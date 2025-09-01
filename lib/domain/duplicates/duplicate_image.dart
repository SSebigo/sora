import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sora/domain/duplicates/image_type.dart';

part 'duplicate_image.freezed.dart';

@freezed
sealed class DuplicateImage with _$DuplicateImage {
  const factory DuplicateImage({
    required String path,
    required String hash,
    required int size,
    required DateTime lastModified,
    required bool isSelected,
    required ImageType imageType,
    required double typeConfidence,
  }) = _DuplicateImage;
}

@freezed
sealed class DuplicateGroup with _$DuplicateGroup {
  const factory DuplicateGroup({
    required String hash,
    required List<DuplicateImage> images,
  }) = _DuplicateGroup;
}
