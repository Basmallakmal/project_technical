// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:project_technical/presentation/pages/home/view.dart' as _i1;
import 'package:project_technical/presentation/pages/question_one/view.dart'
    as _i2;
import 'package:project_technical/presentation/pages/question_three/view.dart'
    as _i3;
import 'package:project_technical/presentation/pages/question_two/view.dart'
    as _i4;

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i5.PageRouteInfo<void> {
  const HomePageRoute({List<_i5.PageRouteInfo>? children})
    : super(HomePageRoute.name, initialChildren: children);

  static const String name = 'HomePageRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.QuestionOnePage]
class QuestionOnePageRoute extends _i5.PageRouteInfo<void> {
  const QuestionOnePageRoute({List<_i5.PageRouteInfo>? children})
    : super(QuestionOnePageRoute.name, initialChildren: children);

  static const String name = 'QuestionOnePageRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.QuestionOnePage();
    },
  );
}

/// generated route for
/// [_i3.QuestionThreePage]
class QuestionThreePageRoute extends _i5.PageRouteInfo<void> {
  const QuestionThreePageRoute({List<_i5.PageRouteInfo>? children})
    : super(QuestionThreePageRoute.name, initialChildren: children);

  static const String name = 'QuestionThreePageRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i3.QuestionThreePage();
    },
  );
}

/// generated route for
/// [_i4.QuestionTwoPage]
class QuestionTwoPageRoute extends _i5.PageRouteInfo<void> {
  const QuestionTwoPageRoute({List<_i5.PageRouteInfo>? children})
    : super(QuestionTwoPageRoute.name, initialChildren: children);

  static const String name = 'QuestionTwoPageRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i4.QuestionTwoPage();
    },
  );
}
