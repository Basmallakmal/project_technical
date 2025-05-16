import 'package:auto_route/auto_route.dart';

import 'app_route.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route,View',
)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: HomePageRoute.page,
      initial: true,
    ),
    AutoRoute(
      path: '/question-one',
      page: QuestionOnePageRoute.page,
    ),
    AutoRoute(
      path: '/question-two',
      page: QuestionTwoPageRoute.page,
    ),
    AutoRoute(
      path: '/question-three',
      page: QuestionThreePageRoute.page,
    ),
  ];
}
