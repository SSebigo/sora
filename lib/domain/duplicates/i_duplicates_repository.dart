import 'package:oxidized/oxidized.dart';
import 'package:sora/domain/duplicates/classification_algorithm.dart';
import 'package:sora/domain/duplicates/classified_image.dart';
import 'package:sora/domain/duplicates/duplicate_image.dart';
import 'package:sora/domain/duplicates/duplicates_failure.dart';
import 'package:sora/domain/duplicates/hash_algorithm.dart';

abstract class IDuplicatesRepository {
  Stream<Result<DuplicateGroup, DuplicatesFailure>> findDuplicatesStream(
    List<String> folderPaths, {
    required HashAlgorithm algorithm,
    void Function(double progress, String currentFile)? onProgress,
  });
  
  Future<Result<ClassificationResult, DuplicatesFailure>> classifyImages(
    List<String> folderPaths, {
    required ClassificationAlgorithm algorithm,
    void Function(double progress, String currentFile)? onProgress,
  });
  
  Future<Result<Unit, DuplicatesFailure>> deleteImages(List<String> paths);
  
  Future<Result<List<String>, DuplicatesFailure>> selectFolders();
  
  void cancelScanning();
}
