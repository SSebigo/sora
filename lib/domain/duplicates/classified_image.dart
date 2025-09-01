import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sora/domain/duplicates/image_type.dart';

part 'classified_image.freezed.dart';

@freezed
sealed class ClassifiedImage with _$ClassifiedImage {
  const factory ClassifiedImage({
    required String path,
    required int size,
    required DateTime lastModified,
    required ImageType imageType,
    required double typeConfidence,
    required bool isSelected,
  }) = _ClassifiedImage;
}

@freezed
sealed class ClassificationResult with _$ClassificationResult {
  const factory ClassificationResult({
    required List<ClassifiedImage> photos,
    required List<ClassifiedImage> drawings,
    required List<ClassifiedImage> unknown,
  }) = _ClassificationResult;

  const ClassificationResult._();

  int get totalImages => photos.length + drawings.length + unknown.length;

  int get selectedCount =>
      photos.where((img) => img.isSelected).length +
      drawings.where((img) => img.isSelected).length +
      unknown.where((img) => img.isSelected).length;
}
