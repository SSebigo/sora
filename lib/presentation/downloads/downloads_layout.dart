import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora/application/downloads/downloads_bloc.dart';
import 'package:sora/domain/core/core_failure.dart';
import 'package:sora/domain/core/download_status.dart';
import 'package:sora/domain/core/unique_id.dart';
import 'package:sora/domain/core/value_failure.dart';
import 'package:sora/domain/duplicates/duplicates_failure.dart';
import 'package:sora/domain/gallery_dl/gallery_dl_failure.dart';
import 'package:sora/presentation/core/default_button.dart';
import 'package:sora/presentation/core/default_icon_button.dart';
import 'package:sora/presentation/downloads/widgets/downloads_gallery_dl_not_found_dialog.dart';
import 'package:sora/presentation/downloads/widgets/downloads_list_tile.dart';

class DownloadsLayout extends StatefulWidget {
  const DownloadsLayout({super.key});

  @override
  State<DownloadsLayout> createState() => _DownloadsLayoutState();
}

class _DownloadsLayoutState extends State<DownloadsLayout> {
  final _urlTextEditingControllers = <UniqueID, TextEditingController>{};
  final _folderTextEditingControllers = <UniqueID, TextEditingController>{};

  @override
  Widget build(BuildContext context) {
    return BlocListener<DownloadsBloc, DownloadsState>(
      listener: (context, state) {
        _urlTextEditingControllers.removeWhere(
          (key, _) => !state.downloadInfos.any((info) => info.uid == key),
        );
        _folderTextEditingControllers.removeWhere(
          (key, _) => !state.downloadInfos.any((info) => info.uid == key),
        );

        for (final info in state.downloadInfos) {
          if (!_urlTextEditingControllers.containsKey(info.uid)) {
            _urlTextEditingControllers.putIfAbsent(
              info.uid,
              TextEditingController.new,
            );
          }
          if (!_folderTextEditingControllers.containsKey(info.uid)) {
            _folderTextEditingControllers.putIfAbsent(
              info.uid,
              TextEditingController.new,
            );
          }
        }

        state.failureOrOption.when(
          some:
              (value) => value.when(
                ok: (_) {},
                err: (err) {
                  final failure = switch (err) {
                    GalleryDL(:final GalleryDLFailure f) => f,
                    Duplicates(:final DuplicatesFailure f) => f,
                  };

                  final _ = switch (failure) {
                    GalleryDLCommandNotFound() => showDialog<void>(
                      context: context,
                      barrierDismissible: false,
                      builder:
                          (_) => BlocProvider<DownloadsBloc>.value(
                            value: context.read<DownloadsBloc>(),
                            child: DownloadsGalleryDLNotFoundDialog(
                              onLinkPressed:
                                  () => context.read<DownloadsBloc>().add(
                                    const DownloadsEvent.galleryDLURLPressed(),
                                  ),
                              onRestartPressed:
                                  () => context.read<DownloadsBloc>().add(
                                    const DownloadsEvent.init(),
                                  ),
                            ),
                          ),
                    ),
                    _ => null,
                  };
                },
              ),
          none: () {},
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 7.5, top: 7.5, bottom: 7.5),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          BlocBuilder<DownloadsBloc, DownloadsState>(
                            builder: (context, state) {
                              return DefaultButton(
                                title: 'Download all',
                                isLoading: state.downloadInfos.any(
                                  (info) =>
                                      info.status == DownloadStatus.downloading,
                                ),
                                disabled:
                                    !state.downloadInfos.any(
                                      (info) =>
                                          info.status != DownloadStatus.success,
                                    ),
                                onPressed:
                                    () => context.read<DownloadsBloc>().add(
                                      const DownloadsEvent.batchDownloadButtonPressed(),
                                    ),
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DefaultIconButton(
                              onPressed:
                                  () => context.read<DownloadsBloc>().add(
                                    const DownloadsEvent.addURLButtonPressed(),
                                  ),
                              icon: Icons.add,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BlocBuilder<DownloadsBloc, DownloadsState>(
                            builder: (context, state) {
                              return DefaultButton(
                                title: 'Clear all',
                                isLoading: state.downloadInfos.any(
                                  (info) =>
                                      info.status == DownloadStatus.downloading,
                                ),
                                disabled: state.downloadInfos.any(
                                  (info) =>
                                      info.status == DownloadStatus.downloading,
                                ),
                                onPressed:
                                    () => context.read<DownloadsBloc>().add(
                                      const DownloadsEvent.batchClearButtonPressed(),
                                    ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<DownloadsBloc, DownloadsState>(
                  builder: (context, state) {
                    return ListView.separated(
                      itemCount: state.downloadInfos.length,
                      itemBuilder: (context, idx) {
                        final downloadInfo = state.downloadInfos[idx];
                        final urlController =
                            _urlTextEditingControllers[downloadInfo.uid];
                        final folderController =
                            _folderTextEditingControllers[downloadInfo.uid];

                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: DownloadListTile(
                            downloadInfo: downloadInfo,
                            folderController: folderController,
                            urlController: urlController,
                            onFolderChanged:
                                (value) => context.read<DownloadsBloc>().add(
                                  DownloadsEvent.folderChanged(
                                    downloadInfo.uid,
                                    value,
                                  ),
                                ),
                            onURLChanged:
                                (value) => context.read<DownloadsBloc>().add(
                                  DownloadsEvent.urlChanged(
                                    downloadInfo.uid,
                                    value,
                                  ),
                                ),
                            onDownloadPressed:
                                () => context.read<DownloadsBloc>().add(
                                  DownloadsEvent.singleDownloadButtonPressed(
                                    downloadInfo.uid,
                                  ),
                                ),
                            onClearPressed:
                                () => context.read<DownloadsBloc>().add(
                                  DownloadsEvent.clearButtonPressed(
                                    downloadInfo.uid,
                                  ),
                                ),
                            folderValidator:
                                (_) => context
                                    .read<DownloadsBloc>()
                                    .state
                                    .downloadInfos[idx]
                                    .folder
                                    ?.value
                                    .match((_) => null, (err) {
                                      final result = switch (err) {
                                        ValueEmpty() =>
                                          'Folder cannot be empty',
                                        _ => null,
                                      };

                                      return result;
                                    }),
                            urlValidator:
                                (_) => context
                                    .read<DownloadsBloc>()
                                    .state
                                    .downloadInfos[idx]
                                    .url
                                    .value
                                    .match((_) => null, (err) {
                                      final result = switch (err) {
                                        ValueInvalidURL() => 'Invalid URL',
                                        ValueEmpty() => 'URL cannot be empty',
                                      };

                                      return result;
                                    }),
                          ),
                        );
                      },
                      separatorBuilder: (context, idx) => const Divider(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
