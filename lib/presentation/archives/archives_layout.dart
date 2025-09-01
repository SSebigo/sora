import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sora/application/archives/archives_bloc.dart';
import 'package:sora/presentation/archives/widgets/archives_pagination_button.dart';
import 'package:sora/presentation/core/default_icon_button.dart';
import 'package:sora/utils/pagination.dart';
import 'package:sora/utils/palette.dart';

class ArchivesLayout extends StatelessWidget {
  const ArchivesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ArchivesBloc, ArchivesState>(
      listener: (context, state) {},
      child: Padding(
        padding: const EdgeInsets.only(right: 7.5, top: 7.5, bottom: 7.5),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ArchivesBloc, ArchivesState>(
                  builder: (context, state) {
                    if (state.downloadInfos.isEmpty) {
                      return const Center(
                        child: Text(
                          'No archives found!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      );
                    }

                    return ListView.separated(
                      itemCount: state.downloadInfos.length,
                      itemBuilder: (context, idx) {
                        final downloadInfo = state.downloadInfos[idx];

                        return ListTile(
                          title: Text(
                            downloadInfo.url.getOrCrash(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            downloadInfo.updatedAt != null
                                ? DateFormat().format(downloadInfo.updatedAt!)
                                : '',
                            style: const TextStyle(color: Palette.grey),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: DefaultIconButton(
                                  icon: Icons.content_copy_rounded,
                                  onPressed:
                                      () => context.read<ArchivesBloc>().add(
                                        ArchivesEvent.copyURLToClipboardPressed(
                                          downloadInfo.url,
                                        ),
                                      ),
                                ),
                              ),
                              DefaultIconButton(
                                icon: Icons.open_in_new_rounded,
                                onPressed:
                                    () => context.read<ArchivesBloc>().add(
                                      ArchivesEvent.openInNewPressed(
                                        downloadInfo,
                                      ),
                                    ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, _) => const Divider(),
                    );
                  },
                ),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Palette.greyLight)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: BlocBuilder<ArchivesBloc, ArchivesState>(
                    builder: (context, state) {
                      if (state.itemsCount == 0) {
                        return Container();
                      }

                      final totalPages =
                          (state.itemsCount / Pagination.archiveItemPerPage)
                              .ceil();
                      final currentPage = state.paginationIdx;

                      const maxButtons = 5;
                      const halfRange = maxButtons ~/ 2;

                      final startPage = (currentPage - halfRange)
                          .clamp(0, totalPages - maxButtons)
                          .clamp(0, totalPages - 1);
                      final endPage = (startPage + maxButtons - 1).clamp(
                        0,
                        totalPages - 1,
                      );

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (totalPages > 1)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2.5,
                              ),
                              child: DefaultIconButton(
                                icon: Icons.arrow_back_ios_rounded,
                                onPressed:
                                    currentPage > 0
                                        ? () =>
                                            context.read<ArchivesBloc>().add(
                                              ArchivesEvent.pagePressed(
                                                currentPage - 1,
                                              ),
                                            )
                                        : null,
                              ),
                            ),
                          for (int i = startPage; i <= endPage; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2.5,
                              ),
                              child: ArchivesPaginationButton(
                                title: '${i + 1}',
                                onPressed:
                                    () => context.read<ArchivesBloc>().add(
                                      ArchivesEvent.pagePressed(i),
                                    ),
                                color:
                                    i + 1 == currentPage
                                        ? Palette.black
                                        : Palette.white,
                                isCurrentPage: i == currentPage,
                              ),
                            ),
                          if (totalPages > 1)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2.5,
                              ),
                              child: DefaultIconButton(
                                icon: Icons.arrow_forward_ios_rounded,
                                onPressed:
                                    currentPage < totalPages - 1
                                        ? () =>
                                            context.read<ArchivesBloc>().add(
                                              ArchivesEvent.pagePressed(
                                                currentPage + 1,
                                              ),
                                            )
                                        : null,
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
