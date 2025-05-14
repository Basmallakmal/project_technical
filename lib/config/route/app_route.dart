import 'package:auto_route/auto_route.dart';
import 'package:project_i/config/route/auth_guard.dart';

import 'app_route.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route,View',
)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    // AutoRoute(
    //   path: '/dashboard',
    //   page: DashboardPageRoute.page,
    //   initial: true,
    //   children: [
    //     AutoRoute(
    //       path: 'home',
    //       page: HomePageRoute.page,
    //     ),
    //     AutoRoute(
    //       path: 'announcement',
    //       page: AnnouncementPageRoute.page,
    //     ),
    //     AutoRoute(
    //       path: 'profile',
    //       page: ProfilePageRoute.page,
    //     ),
    //   ],
    // ),
    AutoRoute(
      path: '/',
      page: LoginPageRoute.page,
      initial: true,
    ),
    // AutoRoute(
    //   path: '/login',
    //   page: LoginPageRoute.page,
    // ),
  ];
}
