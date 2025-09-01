import 'package:oxidized/oxidized.dart';
import 'package:sora/domain/core/download_info.dart';
import 'package:sora/domain/core/url.dart';
import 'package:sora/domain/gallery_dl/gallery_dl_failure.dart';

abstract class IGalleryDLRepository {
  Future<Result<Unit, GalleryDLFailure>> checkGalleryDLInstallation();

  Future<Result<DownloadInfo, GalleryDLFailure>> download(
    DownloadInfo downloadInfo,
  );

  Stream<Result<DownloadInfo, GalleryDLFailure>> batchDownload(
    List<DownloadInfo> downloadInfos,
  );

  Future<Result<Unit, GalleryDLFailure>> launchGithubURL();

  Future<Result<Unit, GalleryDLFailure>> insertDownloadInfo(
    DownloadInfo downloadInfo,
  );

  Future<Result<Unit, GalleryDLFailure>> checkForDuplicate(
    DownloadInfo downloadInfo,
  );

  Future<Result<int, GalleryDLFailure>> countArchivesItems();

  Future<Result<List<DownloadInfo>, GalleryDLFailure>> fetchArchives(
    int limit, {
    int? offset,
  });

  Future<Result<Unit, GalleryDLFailure>> launchContentURL(
    DownloadInfo downloadInfo,
  );

  Future<Result<Unit, GalleryDLFailure>> copyURLToClipboard(URL url);
}
