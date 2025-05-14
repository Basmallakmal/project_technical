import 'package:auto_route/auto_route.dart';
import 'package:project_i/config/session/app_sesion.dart';

import 'app_route.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    String token = await AppSession().getToken();
    if (token.isEmpty) {
      // router.replace(
      //   LoginPageRoute(onLoginResult: (result) {
      //     if (result) {
      //       resolver.next(true);
      //       router.removeLast();
      //     }
      //   }),
      // );
    } else {
      resolver.next(true);
    }
  }
}
