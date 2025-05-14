// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:project_i/presentation/pages/dashboard/view.dart' as _i1;
import 'package:project_i/presentation/pages/login/view.dart' as _i2;

/// generated route for
/// [_i1.DashboardPage]
class DashboardPageRoute extends _i3.PageRouteInfo<void> {
  const DashboardPageRoute({List<_i3.PageRouteInfo>? children})
    : super(DashboardPageRoute.name, initialChildren: children);

  static const String name = 'DashboardPageRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.DashboardPage();
    },
  );
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i3.PageRouteInfo<void> {
  const LoginPageRoute({List<_i3.PageRouteInfo>? children})
    : super(LoginPageRoute.name, initialChildren: children);

  static const String name = 'LoginPageRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return _i2.LoginPage();
    },
  );
}
