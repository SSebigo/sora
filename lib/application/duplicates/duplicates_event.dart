part of 'duplicates_bloc.dart';

@freezed
class DuplicatesEvent with _$DuplicatesEvent {
  const factory DuplicatesEvent.init() = Init;
  const factory DuplicatesEvent.selectFolderPressed() = SelectFolderPressed;
  const factory DuplicatesEvent.addFolderPressed() = AddFolderPressed;
  const factory DuplicatesEvent.removeFolderPressed(String folderPath) = 
      RemoveFolderPressed;
  const factory DuplicatesEvent.scanPressed() = ScanPressed;
  const factory DuplicatesEvent.stopScanPressed() = StopScanPressed;
  const factory DuplicatesEvent.progressUpdated(
    double progress,
    String currentFile,
  ) = ProgressUpdated;
  const factory DuplicatesEvent.duplicateGroupFound(
    DuplicateGroup group,
  ) = DuplicateGroupFound;
  const factory DuplicatesEvent.scanCompleted() = ScanCompleted;
  const factory DuplicatesEvent.scanError(DuplicatesFailure failure) = 
      ScanError;
  const factory DuplicatesEvent.imageToggled(
    String groupHash,
    String imagePath,
  ) = ImageToggled;
  const factory DuplicatesEvent.selectAllInGroupPressed(String groupHash) =
      SelectAllInGroupPressed;
  const factory DuplicatesEvent.keepOldestInGroupPressed(String groupHash) =
      KeepOldestInGroupPressed;
  const factory DuplicatesEvent.keepNewestInGroupPressed(String groupHash) =
      KeepNewestInGroupPressed;
  const factory DuplicatesEvent.deleteSelectedPressed() = DeleteSelectedPressed;
  const factory DuplicatesEvent.algorithmChanged(HashAlgorithm algorithm) =
      AlgorithmChanged;
  const factory DuplicatesEvent.scanModeChanged(ScanMode mode) =
      ScanModeChanged;
  const factory DuplicatesEvent.classifiedImageToggled(String imagePath) =
      ClassifiedImageToggled;
  const factory DuplicatesEvent.classificationAlgorithmChanged(
    ClassificationAlgorithm algorithm,
  ) = ClassificationAlgorithmChanged;
}
