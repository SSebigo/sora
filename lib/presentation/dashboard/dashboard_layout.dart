import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora/application/dashboard/dashboard_cubit.dart';
import 'package:sora/domain/dashboard/dashboard_item.dart';
import 'package:sora/i18n/strings.g.dart';
import 'package:sora/presentation/core/default_icon_button.dart';
import 'package:sora/presentation/dashboard/widgets/dashboard_list_tile.dart';
import 'package:sora/presentation/routes/router.gr.dart';
import 'package:sora/utils/palette.dart';

class DashboardLayout extends StatelessWidget {
  DashboardLayout({super.key});

  final items = [
    DashboardItem(
      title: t.dashboard.downloads,
      icon: Icons.download_rounded,
      route: const DownloadsRoute(),
    ),
    DashboardItem(
      title: t.dashboard.archives,
      icon: Icons.archive_rounded,
      route: const ArchivesRoute(),
    ),
    DashboardItem(
      title: t.dashboard.duplicates,
      icon: Icons.photo_library_rounded,
      route: const DuplicatesRoute(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(7.5),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => context.read<DashboardCubit>().toggleDrawer(),
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 100),
                    onEnd:
                        () => context.read<DashboardCubit>().toggleListTiles(
                          fromAnimationEnd: true,
                        ),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: state.isDrawerExpanded ? 250 : null,
                      decoration: BoxDecoration(
                        border: Border.all(color: Palette.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children:
                                items
                                    .asMap()
                                    .entries
                                    .map(
                                      (item) => Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: item.key.isOdd ? 10 : 0,
                                        ),
                                        child:
                                            state.useListTiles
                                                ? DashboardListTile(
                                                  item: item.value,
                                                  itemIdx: item.key,
                                                  currentIdx: state.currentIdx,
                                                  onPressed:
                                                      () =>
                                                          context
                                                            ..read<
                                                                  DashboardCubit
                                                                >()
                                                                .itemPressed(
                                                                  item.key,
                                                                )
                                                            ..router.push(
                                                              item.value.route,
                                                            ),
                                                )
                                                : DefaultIconButton(
                                                  icon: item.value.icon,
                                                  backgroundColor:
                                                      state.currentIdx ==
                                                              item.key
                                                          ? Palette.black
                                                          : null,
                                                  iconColor:
                                                      state.currentIdx ==
                                                              item.key
                                                          ? Palette.white
                                                          : null,
                                                  onPressed:
                                                      () =>
                                                          context
                                                            ..read<
                                                                  DashboardCubit
                                                                >()
                                                                .itemPressed(
                                                                  item.key,
                                                                )
                                                            ..router.push(
                                                              item.value.route,
                                                            ),
                                                ),
                                      ),
                                    )
                                    .toList(),
                          ),
                          Row(
                            mainAxisAlignment:
                                state.isDrawerExpanded
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.center,
                            children: [
                              DefaultIconButton(
                                onPressed:
                                    () =>
                                        context
                                            .read<DashboardCubit>()
                                            .toggleDrawer(),
                                icon:
                                    state.isDrawerExpanded
                                        ? Icons.arrow_back_ios_new_rounded
                                        : Icons.arrow_forward_ios_rounded,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const Expanded(child: AutoRouter()),
      ],
    );
  }
}
