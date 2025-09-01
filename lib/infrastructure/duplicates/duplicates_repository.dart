import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image/image.dart' as img;
import 'package:injectable/injectable.dart';
import 'package:oxidized/oxidized.dart';
import 'package:path/path.dart' as p;
import 'package:sora/domain/duplicates/classification_algorithm.dart';
import 'package:sora/domain/duplicates/classified_image.dart';
import 'package:sora/domain/duplicates/duplicate_image.dart';
import 'package:sora/domain/duplicates/duplicates_failure.dart';
import 'package:sora/domain/duplicates/hash_algorithm.dart';
import 'package:sora/domain/duplicates/i_duplicates_repository.dart';
import 'package:sora/domain/duplicates/image_type.dart';
import 'package:sora/infrastructure/duplicates/image_classifier.dart';

@LazySingleton(as: IDuplicatesRepository)
class DuplicatesRepository implements IDuplicatesRepository {
  bool _isCancelled = false;
  static const _supportedExtensions = [
    '.jpg',
    '.jpeg',
    '.png',
    '.gif',
    '.webp',
    '.bmp',
  ];

  @override
  void cancelScanning() {
    _isCancelled = true;
  }

  @override
  Stream<Result<DuplicateGroup, DuplicatesFailure>> findDuplicatesStream(
    List<String> folderPaths, {
    required HashAlgorithm algorithm,
    void Function(double progress, String currentFile)? onProgress,
  }) async* {
    _isCancelled = false;
    try {
      // Collect all image files from all folders
      final allImageFiles = <File>[];

      for (final folderPath in folderPaths) {
        if (_isCancelled) {
          return;
        }

        final directory = Directory(folderPath);

        if (!directory.existsSync()) {
          yield const Err(DuplicatesFailure.folderNotFound());
          return;
        }

        try {
          await for (final entity in directory.list(recursive: true)) {
            if (_isCancelled) {
              return;
            }
            if (entity is File) {
              final extension = p.extension(entity.path).toLowerCase();
              if (_supportedExtensions.contains(extension)) {
                allImageFiles.add(entity);
              }
            }
          }
        } on FileSystemException catch (_) {
          // Skip directories we can't access
          continue;
        }
      }

      if (allImageFiles.isEmpty) {
        onProgress?.call(1, 'No images found');
        return;
      }

      final hashMap = <String, List<DuplicateImage>>{};
      var processedCount = 0;
      final totalFiles = allImageFiles.length;

      for (final file in allImageFiles) {
        if (_isCancelled) {
          return;
        }

        try {
          // Show current file being processed
          onProgress?.call(processedCount / totalFiles, p.basename(file.path));

          final bytes = await file.readAsBytes();
          final image = img.decodeImage(bytes);

          // Classify image type
          final classification =
              image != null
                  ? ImageClassifier.classify(image)
                  : const ImageClassification(
                    type: ImageType.unknown,
                    confidence: 0,
                  );

          final hash = await _computeImageHashFromBytes(
            bytes,
            image,
            algorithm,
          );
          final stat = file.statSync();

          final duplicateImage = DuplicateImage(
            path: file.path,
            hash: hash,
            size: stat.size,
            lastModified: stat.modified,
            isSelected: false,
            imageType: classification.type,
            typeConfidence: classification.confidence,
          );

          final existingImages = hashMap[hash];
          if (existingImages != null) {
            // Found a duplicate, emit the group
            existingImages.add(duplicateImage);
            yield Ok(
              DuplicateGroup(hash: hash, images: List.from(existingImages)),
            );
          } else {
            // First occurrence of this hash
            hashMap[hash] = [duplicateImage];
          }

          processedCount++;

          // Update progress after processing
          onProgress?.call(processedCount / totalFiles, p.basename(file.path));
        } on Exception catch (_) {
          // Still increment to avoid stuck progress
          processedCount++;
          onProgress?.call(
            processedCount / totalFiles,
            'Skipped: ${p.basename(file.path)}',
          );
          continue;
        }
      }

      onProgress?.call(1, 'Complete');
    } on Exception catch (_) {
      yield const Err(DuplicatesFailure.processingError());
    } finally {
      _isCancelled = false;
    }
  }

  Future<String> _computeImageHashFromBytes(
    Uint8List bytes,
    img.Image? image,
    HashAlgorithm algorithm,
  ) async {
    if (image == null) {
      return _computeFileHash(bytes);
    }

    final hash = switch (algorithm) {
      HashAlgorithm.average => _computeAverageHash(image),
      HashAlgorithm.difference => _computeDifferenceHash(image),
      HashAlgorithm.perceptual => _computePerceptualHash(image),
    };

    final fileHash = _computeFileHash(bytes);

    return '${hash}_$fileHash';
  }

  String _computeAverageHash(img.Image image) {
    final resized = img.copyResize(image, width: 8, height: 8);
    final grayscale = img.grayscale(resized);

    final pixels = <int>[];
    for (var y = 0; y < 8; y++) {
      for (var x = 0; x < 8; x++) {
        final pixel = grayscale.getPixel(x, y);
        pixels.add(pixel.r.toInt());
      }
    }

    final average = pixels.reduce((a, b) => a + b) / pixels.length;

    var hash = 0;
    for (var i = 0; i < pixels.length; i++) {
      if (pixels[i] > average) {
        hash |= 1 << i;
      }
    }

    return hash.toRadixString(16).padLeft(16, '0');
  }

  String _computeDifferenceHash(img.Image image) {
    final resized = img.copyResize(image, width: 9, height: 8);
    final grayscale = img.grayscale(resized);

    var hash = 0;
    var bit = 0;

    for (var y = 0; y < 8; y++) {
      for (var x = 0; x < 8; x++) {
        final leftPixel = grayscale.getPixel(x, y);
        final rightPixel = grayscale.getPixel(x + 1, y);

        if (leftPixel.r > rightPixel.r) {
          hash |= 1 << bit;
        }
        bit++;
      }
    }

    return hash.toRadixString(16).padLeft(16, '0');
  }

  String _computePerceptualHash(img.Image image) {
    const size = 32;
    const smallerSize = 8;

    final resized = img.copyResize(image, width: size, height: size);
    final grayscale = img.grayscale(resized);

    final pixels = List.generate(size * size, (i) {
      final x = i % size;
      final y = i ~/ size;
      return grayscale.getPixel(x, y).r.toDouble();
    });

    final dct = _dct2d(pixels, size, smallerSize);

    final dctLowFreq = <double>[];
    for (var y = 0; y < smallerSize; y++) {
      for (var x = 0; x < smallerSize; x++) {
        if (x == 0 && y == 0) continue;
        dctLowFreq.add(dct[y * size + x]);
      }
    }

    final median = _median(List.from(dctLowFreq));

    var hash = 0;
    for (var i = 0; i < dctLowFreq.length && i < 64; i++) {
      if (dctLowFreq[i] > median) {
        hash |= 1 << i;
      }
    }

    return hash.toRadixString(16).padLeft(16, '0');
  }

  List<double> _dct2d(List<double> input, int size, int outputSize) {
    final output = List<double>.filled(size * size, 0);

    for (var v = 0; v < size; v++) {
      for (var u = 0; u < size; u++) {
        var sum = 0.0;
        for (var y = 0; y < size; y++) {
          for (var x = 0; x < size; x++) {
            sum +=
                input[y * size + x] *
                math.cos((2 * x + 1) * u * math.pi / (2 * size)) *
                math.cos((2 * y + 1) * v * math.pi / (2 * size));
          }
        }

        final cu = u == 0 ? 1 / math.sqrt(2) : 1.0;
        final cv = v == 0 ? 1 / math.sqrt(2) : 1.0;
        output[v * size + u] = sum * cu * cv * 2 / size;
      }
    }

    return output;
  }

  double _median(List<double> values) {
    values.sort();
    final middle = values.length ~/ 2;
    if (values.length.isEven) {
      return (values[middle - 1] + values[middle]) / 2;
    }
    return values[middle];
  }

  String _computeFileHash(Uint8List bytes) {
    final digest = md5.convert(bytes);
    return digest.toString();
  }

  @override
  Future<Result<Unit, DuplicatesFailure>> deleteImages(
    List<String> paths,
  ) async {
    try {
      for (final path in paths) {
        final file = File(path);
        if (file.existsSync()) {
          await file.delete();
        }
      }
      return const Ok(unit);
    } on Exception catch (_) {
      return const Err(DuplicatesFailure.deleteError());
    }
  }

  @override
  Future<Result<List<String>, DuplicatesFailure>> selectFolders() async {
    try {
      // Note: file_picker doesn't support multiple directory selection
      // We'll have to add folders one by one or use a custom implementation
      final result = await FilePicker.platform.getDirectoryPath(
        dialogTitle: 'Select folder to scan for duplicates',
        initialDirectory: '${Platform.environment['HOME']}/gallery-dl',
      );

      if (result == null) {
        return const Err(DuplicatesFailure.folderNotFound());
      }

      return Ok([result]);
    } on Exception catch (_) {
      return const Err(DuplicatesFailure.noPermission());
    }
  }

  @override
  Future<Result<ClassificationResult, DuplicatesFailure>> classifyImages(
    List<String> folderPaths, {
    required ClassificationAlgorithm algorithm,
    void Function(double progress, String currentFile)? onProgress,
  }) async {
    _isCancelled = false;

    try {
      final imageFiles = <File>[];

      for (final folderPath in folderPaths) {
        final directory = Directory(folderPath);

        if (!directory.existsSync()) {
          return const Err(DuplicatesFailure.folderNotFound());
        }

        await for (final entity in directory.list(recursive: true)) {
          if (entity is File) {
            final extension = p.extension(entity.path).toLowerCase();
            if (_supportedExtensions.contains(extension)) {
              imageFiles.add(entity);
            }
          }
        }
      }

      if (imageFiles.isEmpty) {
        return const Ok(
          ClassificationResult(photos: [], drawings: [], unknown: []),
        );
      }

      final photos = <ClassifiedImage>[];
      final drawings = <ClassifiedImage>[];
      final unknown = <ClassifiedImage>[];
      var processedCount = 0;

      for (final file in imageFiles) {
        if (_isCancelled) {
          return Ok(
            ClassificationResult(
              photos: photos,
              drawings: drawings,
              unknown: unknown,
            ),
          );
        }

        try {
          onProgress?.call(
            processedCount / imageFiles.length,
            p.basename(file.path),
          );

          final bytes = await file.readAsBytes();
          final image = img.decodeImage(bytes);

          final classification =
              image != null
                  ? ImageClassifier.classify(image, algorithm: algorithm)
                  : const ImageClassification(
                    type: ImageType.unknown,
                    confidence: 0,
                  );

          final stat = file.statSync();

          final classifiedImage = ClassifiedImage(
            path: file.path,
            size: stat.size,
            lastModified: stat.modified,
            imageType: classification.type,
            typeConfidence: classification.confidence,
            isSelected: false,
          );

          switch (classification.type) {
            case ImageType.photo:
              photos.add(classifiedImage);
            case ImageType.drawing:
              drawings.add(classifiedImage);
            case ImageType.unknown:
              unknown.add(classifiedImage);
          }

          processedCount++;

          // Update progress after processing
          onProgress?.call(
            processedCount / imageFiles.length,
            p.basename(file.path),
          );
        } on Exception catch (_) {
          // Still increment to avoid stuck progress
          processedCount++;
          onProgress?.call(
            processedCount / imageFiles.length,
            'Skipped: ${p.basename(file.path)}',
          );
          continue;
        }
      }

      onProgress?.call(1, 'Complete');

      return Ok(
        ClassificationResult(
          photos: photos,
          drawings: drawings,
          unknown: unknown,
        ),
      );
    } on Exception catch (_) {
      return const Err(DuplicatesFailure.processingError());
    }
  }
}
