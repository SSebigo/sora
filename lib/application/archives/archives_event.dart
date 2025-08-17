part of 'archives_bloc.dart';

@freezed
class ArchivesEvent with _$ArchivesEvent {
  const factory ArchivesEvent.init() = Init;

  const factory ArchivesEvent.itemsCounted() = ItemsCounted;

  const factory ArchivesEvent.openInNewPressed(DownloadInfo downloadInfo) =
      OpenInNewPressed;

  const factory ArchivesEvent.pagePressed(int idx) = PagePressed;

  const factory ArchivesEvent.copyURLToClipboardPressed(URL url) =
      CopyURLToClipboardPressed;
}
