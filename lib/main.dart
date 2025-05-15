import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:project_technical/config/route/app_route.dart';
import 'package:project_technical/config/route/route_observer.dart';
import 'package:project_technical/config/session/app_sesion.dart';
import 'package:project_technical/config/theme/theme.dart';
import 'package:project_technical/hive/hive_registrar.g.dart';
import 'package:project_technical/l10n/app_localizations.dart';
import 'package:project_technical/presentation/pages/home/provider.dart';
import 'package:project_technical/presentation/pages/question_one/provider.dart';
import 'package:project_technical/presentation/pages/question_three/provider.dart';
import 'package:project_technical/presentation/pages/question_two/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final getIt = GetIt.instance;

void main() async {
  HttpOverrides.global = IgnoreCertificateErrorOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  // Other
  getIt.registerSingleton<AppRouter>(AppRouter());
  await Hive.initFlutter();
  Hive.registerAdapters();
  await AppSession().openBox();
  GoogleFonts.config.allowRuntimeFetching = false;

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _appRouter = getIt<AppRouter>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => QuestionOneProvider()),
        ChangeNotifierProvider(create: (context) => QuestionTwoProvider()),
        ChangeNotifierProvider(create: (context) => QuestionThreeProvider()),
      ],
      child: ValueListenableBuilder<Box>(
          valueListenable: Hive.box(AppSession.hiveSession).listenable(),
          builder: (context, box, _) {
            Locale locale = Locale(AppSession().getLanguage(setBox: box));

            return MaterialApp.router(
              routerDelegate: _appRouter.delegate(
                navigatorObservers: () => [
                  MyObserver(),
                  AutoRouteObserver(),
                ],
              ),
              routeInformationParser: _appRouter.defaultRouteParser(),
              locale: locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('id'),
              ],
              debugShowCheckedModeBanner: false,
              title: 'Project Technical',
              theme: MaterialTheme(createTextTheme(context)).mainTheme(),
            );
          }),
    );
  }
}

class IgnoreCertificateErrorOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) {
        return true;
      });
  }
}
