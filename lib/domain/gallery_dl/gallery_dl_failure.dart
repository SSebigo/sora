import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sora/domain/core/download_info.dart';
import 'package:sora/domain/core/url.dart';

part 'gallery_dl_failure.freezed.dart';

@freezed
sealed class GalleryDLFailure with _$GalleryDLFailure {
  const factory GalleryDLFailure.commandNotFound() = GalleryDLCommandNotFound;

  const factory GalleryDLFailure.githubURLFailedToOpen() =
      GalleryDLGithubURLFailedToOpen;

  const factory GalleryDLFailure.contenAlreadyDownloaded(
    DownloadInfo downloadInfo,
  ) = GalleryDLContentAlreadyDownloaded;

  const factory GalleryDLFailure.invalidURL(DownloadInfo downloadInfo) =
      GalleryDLInvalidURL;

  const factory GalleryDLFailure.failedToCopyToClipboard(URL url) =
      GalleryDLFailedToCopyToClipboard;

  const factory GalleryDLFailure.unexpected({DownloadInfo? downloadInfo}) =
      GalleryDLUnexpected;

  const factory GalleryDLFailure.contentURLFailedToOpen() =
      GalleryDLContentURLFailedToOpen;
}
