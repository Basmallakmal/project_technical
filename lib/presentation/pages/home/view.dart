import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:project_technical/config/route/app_route.gr.dart';
import 'package:project_technical/config/session/app_sesion.dart';
import 'package:project_technical/config/theme/theme.dart';
import 'package:project_technical/gen/assets.gen.dart';
import 'package:project_technical/presentation/pages/home/provider.dart';
import 'package:project_technical/presentation/utils/app_services.dart';
import 'package:project_technical/presentation/utils/language_support.dart';
import 'package:project_technical/presentation/widget/home_widget/flag_item.dart';
import 'package:project_technical/presentation/widget/home_widget/menu_item.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LanguageValue.home),
            elevation: 1,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LanguageValue.welcome_message,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.outline,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16,
                      children: [
                        Text(
                          LanguageValue.home_menu_desc,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        MenuItem(
                          onTap: () {
                            AppServices.navRouter.push(QuestionOnePageRoute());
                          },
                          title: LanguageValue.question_1,
                        ),
                        MenuItem(
                          onTap: () {
                            AppServices.navRouter.push(QuestionTwoPageRoute());
                          },
                          title: LanguageValue.question_2,
                        ),
                        MenuItem(
                          onTap: () {
                            AppServices.navRouter
                                .push(QuestionThreePageRoute());
                          },
                          title: LanguageValue.question_3,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 64),
                  Center(
                    child: Text(
                      LanguageValue.change_language,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ValueListenableBuilder<Box>(
                      valueListenable:
                          Hive.box(AppSession.hiveSession).listenable(),
                      builder: (context, box, _) {
                        LanguageSupport currentLang =
                            LanguageSupportHelper.getLanguageSupport(
                                AppSession().getLanguage(setBox: box));
                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.outline,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                LanguageValue.change_language_desc,
                                style: Theme.of(context).textTheme.bodyLarge,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FlagItem(
                                    onTap: () {
                                      provider.changeLanguage(
                                          lang: LanguageSupport.en);
                                    },
                                    flagImage: Assets.images.englishFlag.path,
                                    flagText: LanguageValue.english,
                                    isSelected:
                                        currentLang == LanguageSupport.en,
                                  ),
                                  FlagItem(
                                    onTap: () {
                                      provider.changeLanguage(
                                          lang: LanguageSupport.id);
                                    },
                                    flagImage:
                                        Assets.images.indonesianFlag.path,
                                    flagText: LanguageValue.indonesian,
                                    isSelected:
                                        currentLang == LanguageSupport.id,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
