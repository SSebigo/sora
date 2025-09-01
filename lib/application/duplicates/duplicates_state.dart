part of 'duplicates_bloc.dart';

@freezed
sealed class DuplicatesState with _$DuplicatesState {
  const factory DuplicatesState({
    required List<String> selectedFolders,
    required List<DuplicateGroup> duplicateGroups,
    required ClassificationResult classificationResult,
    required bool isLoading,
    required bool isScanning,
    required bool isDeleting,
    required double scanProgress,
    required String currentFile,
    required HashAlgorithm selectedAlgorithm,
    required ClassificationAlgorithm selectedClassificationAlgorithm,
    required ScanMode scanMode,
    required Option<Result<Unit, CoreFailure>> failureOrOption,
  }) = _DuplicatesState;

  factory DuplicatesState.initial() => const DuplicatesState(
    selectedFolders: [],
    duplicateGroups: [],
    classificationResult: ClassificationResult(
      photos: [],
      drawings: [],
      unknown: [],
    ),
    isLoading: false,
    isScanning: false,
    isDeleting: false,
    scanProgress: 0,
    currentFile: '',
    selectedAlgorithm: HashAlgorithm.average,
    selectedClassificationAlgorithm: ClassificationAlgorithm.basic,
    scanMode: ScanMode.duplicates,
    failureOrOption: None(),
  );
}
