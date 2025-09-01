import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sora/domain/duplicates/duplicates_failure.dart';
import 'package:sora/domain/gallery_dl/gallery_dl_failure.dart';

part 'core_failure.freezed.dart';

@freezed
sealed class CoreFailure with _$CoreFailure {
  const factory CoreFailure.galleryDL(GalleryDLFailure f) = GalleryDL;
  const factory CoreFailure.duplicates(DuplicatesFailure f) = Duplicates;
}
