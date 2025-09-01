import 'package:auto_route/auto_route.dart';
import 'package:sora/presentation/routes/router.gr.dart';
import 'package:sora/utils/routes.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: Routes.dashboard,
      page: DashboardRoute.page,
      initial: true,
      children: [
        AutoRoute(
          path: Routes.downloads,
          page: DownloadsRoute.page,
          initial: true,
        ),
        AutoRoute(path: Routes.archives, page: ArchivesRoute.page),
        AutoRoute(path: Routes.duplicates, page: DuplicatesRoute.page),
        AutoRoute(path: Routes.settings, page: SettingsRoute.page),
      ],
    ),
  ];
}
