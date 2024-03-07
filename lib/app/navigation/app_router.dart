import 'package:auto_route/auto_route.dart';
import 'package:music_app/app/navigation/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends $AppRouter {
  AppRouter() : super();

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRouter.page,
          initial: true,
          children: [
            AutoRoute(
              initial: true,
              page: HomeRoute.page,
            ),
            AutoRoute(page: AlbumPlaylistRoute.page),
            AutoRoute(page: MusicDetailRoute.page),
            AutoRoute(page: PlaylistRoute.page),
            AutoRoute(page: LocalTracksRoute.page),
          ],
        ),
      ];
}
