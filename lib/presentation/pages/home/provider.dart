import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:project_technical/config/session/app_sesion.dart';
import 'package:project_technical/presentation/utils/app_services.dart';
import 'package:project_technical/presentation/utils/language_support.dart';

import '../../../config/theme/theme.dart';
import 'state.dart';

class HomeProvider extends ChangeNotifier {
  final state = HomeState();

  HomeProvider() {
    getInitInternetStatus();
  }

  getInitInternetStatus() async {
    if (state.internetStatusSubscription != null) return;
    state.internetStatusSubscription =
        InternetConnection().onStatusChange.listen((InternetStatus status) {
      updateInternetStatus(status == InternetStatus.connected ? true : false);
    });
    notifyListeners();
  }

  @override
  void dispose() {
    state.internetStatusSubscription?.cancel();
    super.dispose();
  }

  void updateInternetStatus(bool connected) {
    state.isConnected = connected;
    notifyListeners();
  }

  Future changeLanguage({required LanguageSupport lang}) {
    return showDialog(
      context: AppServices.context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(LanguageValue.change_language_confirmation),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          actions: [
            TextButton(
              onPressed: () {
                AppServices.navRouter.maybePop();
              },
              child: Text(LanguageValue.cancel),
            ),
            TextButton(
              onPressed: () {
                AppServices.navRouter.maybePop(true);
                AppSession().saveLanguage(lang);
              },
              child: Text(LanguageValue.yes),
            ),
          ],
        );
      },
    );
  }
}
