## Getting Started

This project is using the latest version of Flutter. To get started, make sure you have Flutter
installed on your machine. You can follow the instructions on
the [Flutter website](https://flutter.dev/docs/get-started/install) to set up Flutter.

## How to run this project

Important pub packages:

- [get_it] (https://pub.dev/packages/get_it)
- [Hive_ce] (https://pub.dev/packages/hive_ce_flutter)
- [FlutterSecureStorage] (https://pub.dev/packages/flutter_secure_storage)
- [dio] (https://pub.dev/packages/dio)
- [provider] (https://pub.dev/packages/provider)
- [auto_route] (https://pub.dev/packages/auto_route)
- [internationalization] (https://docs.flutter.dev/accessibility-and-localization/internationalization)


1. Clone this repository
2. Open this project in your IDE/Text Editor
3. Run `flutter pub get` to get all dependencies
4. Run `dart run build_runner build -d` to build all generated files
5. Run `flutter gen-l10n` to generate locale files
6. Run `flutter run` to run this project

## Project Folder Structure

    ```
    kyoo_signage_app
    ├── lib
    │   ├── config
    │   │   ├── multilanguage
    │   │   │   └── language_value.dart // Multilanguage value
    │   │   ├── route
    │   │   │   └── app_route.dart // Route configuration
    │   │   │   └── [route_guard].dart // Route guard
    │   │   ├── session
    │   │   │   └── app_session.dart // User session management
    │   │   ├── theme // Class for all custom theme widget
    │   │   │   └── colors.dart // App color setup
    │   │   │   └── theme.dart // App theme setup
    │   │   │   └── [other].dart // Other theme class
    │   ├── domain
    │   │   ├── controller // Controller class for API call
    │   │   │   └── [controller].dart // Controller class
    │   │   ├── model // Model class for API response
    │   │   │   └── [model].dart // Model class
    │   │   ├── repository // Repository class for API call
    │   │   │   └── [repository].dart // Repository class
    │   ├── l10n
    │   │   ├── app_en.arb // English locale value
    │   │   ├── app_id.arb // Indonesia locale value
    │   ├── presentation
    │   │   ├── pages // All pages in this project
    │   │   │   └── [pageName] // Page folder
    │   │   │   │   ├── provider.dart // Page Provider Widget
    │   │   │   │   ├── state.dart // Page State Widget
    │   │   │   │   └── view.dart // Page Widget
    │   │   ├── utils // All utility class in this project
    │   │   │   └── app_services.dart // Get_it singleton services
    │   │   │   └── [other].dart // Other utility class
    │   │   ├── widgets // All custom widgets in this project
    │   │   │   └── [widget].dart // Custom widget
    │   ├── config.dart // Environment variable
    │   ├── main.dart // Main file
    ```

## User Session Management

User session management is handled by `lib/config/session/app_session.dart` file.
You can use `AppSession` class to get and set user session.
Session use 2 types of storage, which are:

1. Secure storage for sensitive data
2. Hive storage for non-sensitive data

## How to use get_it in this project

Currently there are 1 get_it singleton services in this project, which are:

1. NavigationService and context

The services are registered in `lib/utils/app_services.dart` file. You can add new service in this
file.
to use the service, just call AppServices class and call the service you want to use.

## How to add new route

1. create new page in `lib/presentation/pages`
2. in `view.dart` state Widget, add @RoutePage() annotation from auto_route package
3. Run `dart run build_runner build -d` to generate new route
4. Add new route in `lib/config/route/app_route.dart`

## How to add new locale value

1. Add new locale value in `lib/l10n/app_en.arb` and `lib/l10n/app_id.arb`
2. Run `flutter gen-l10n` to generate new locale value
3. Add new generated locale value in `lib/config/multilanguage/language_value.dart`
