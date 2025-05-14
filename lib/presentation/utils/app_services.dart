import 'package:flutter/material.dart';
import 'package:project_i/config/route/app_route.dart';
import 'package:project_i/main.dart';

class AppServices {
  static BuildContext get context =>
      getIt<AppRouter>().navigatorKey.currentContext!;

  static AppRouter get navRouter => getIt<AppRouter>();
}
