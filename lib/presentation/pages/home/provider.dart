import 'package:flutter/material.dart';
import 'package:project_technical/config/session/app_sesion.dart';
import 'package:project_technical/presentation/utils/app_services.dart';
import 'package:project_technical/presentation/utils/language_support.dart';

import '../../../config/theme/theme.dart';
import 'state.dart';

class HomeProvider extends ChangeNotifier {
  final state = HomeState();

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
