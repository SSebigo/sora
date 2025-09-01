import 'package:freezed_annotation/freezed_annotation.dart';

part 'duplicates_failure.freezed.dart';

@freezed
class DuplicatesFailure with _$DuplicatesFailure {
  const factory DuplicatesFailure.folderNotFound() = FolderNotFound;
  const factory DuplicatesFailure.noPermission() = NoPermission;
  const factory DuplicatesFailure.processingError() = ProcessingError;
  const factory DuplicatesFailure.deleteError() = DeleteError;
}
