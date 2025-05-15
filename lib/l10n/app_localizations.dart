import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @password_desc.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get password_desc;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get change_password;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @confirm_password_empty.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password cannot be empty'**
  String get confirm_password_empty;

  /// No description provided for @password_not_match.
  ///
  /// In en, this message translates to:
  /// **'Password does not match'**
  String get password_not_match;

  /// No description provided for @new_password_desc.
  ///
  /// In en, this message translates to:
  /// **'Please enter your new password'**
  String get new_password_desc;

  /// No description provided for @validate_password.
  ///
  /// In en, this message translates to:
  /// **'Validate Password'**
  String get validate_password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @login_desc.
  ///
  /// In en, this message translates to:
  /// **'Login to your account'**
  String get login_desc;

  /// No description provided for @email_empty.
  ///
  /// In en, this message translates to:
  /// **'Email cannot be empty'**
  String get email_empty;

  /// No description provided for @email_invalid.
  ///
  /// In en, this message translates to:
  /// **'Email is invalid'**
  String get email_invalid;

  /// No description provided for @password_empty.
  ///
  /// In en, this message translates to:
  /// **'Password cannot be empty'**
  String get password_empty;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @phone_number_empty.
  ///
  /// In en, this message translates to:
  /// **'Phone Number cannot be empty'**
  String get phone_number_empty;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @username_empty.
  ///
  /// In en, this message translates to:
  /// **'Username cannot be empty'**
  String get username_empty;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get full_name;

  /// No description provided for @full_name_empty.
  ///
  /// In en, this message translates to:
  /// **'Full Name cannot be empty'**
  String get full_name_empty;

  /// No description provided for @main_menu.
  ///
  /// In en, this message translates to:
  /// **'Main Menu'**
  String get main_menu;

  /// No description provided for @about_us.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get about_us;

  /// No description provided for @contact_us.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contact_us;

  /// No description provided for @terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get terms_and_conditions;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logout_desc.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logout_desc;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get something_went_wrong;

  /// No description provided for @no_internet_connection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get no_internet_connection;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @bad_request_exception.
  ///
  /// In en, this message translates to:
  /// **'Invalid Request'**
  String get bad_request_exception;

  /// No description provided for @internal_server_error_exception.
  ///
  /// In en, this message translates to:
  /// **'Unknown error occurred, please try again later.'**
  String get internal_server_error_exception;

  /// No description provided for @conflict_exception.
  ///
  /// In en, this message translates to:
  /// **'Conflict occurred'**
  String get conflict_exception;

  /// No description provided for @unauthorized_exception.
  ///
  /// In en, this message translates to:
  /// **'Access denied'**
  String get unauthorized_exception;

  /// No description provided for @unverified_exception.
  ///
  /// In en, this message translates to:
  /// **'Access denied'**
  String get unverified_exception;

  /// No description provided for @not_found_exception.
  ///
  /// In en, this message translates to:
  /// **'The requested information could not be found'**
  String get not_found_exception;

  /// No description provided for @no_interent_connection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection detected, please try again.'**
  String get no_interent_connection;

  /// No description provided for @timeout_exception.
  ///
  /// In en, this message translates to:
  /// **'The connection has timed out, please try again.'**
  String get timeout_exception;

  /// No description provided for @too_many_requests_exception.
  ///
  /// In en, this message translates to:
  /// **'Too many requests, please try again later.'**
  String get too_many_requests_exception;

  /// No description provided for @welcome_message.
  ///
  /// In en, this message translates to:
  /// **'Welcome to our App!'**
  String get welcome_message;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @home_menu_desc.
  ///
  /// In en, this message translates to:
  /// **'Where do you want to go?'**
  String get home_menu_desc;

  /// No description provided for @question_1.
  ///
  /// In en, this message translates to:
  /// **'Question 1'**
  String get question_1;

  /// No description provided for @question_1_desc.
  ///
  /// In en, this message translates to:
  /// **'Fetch and Display API Data'**
  String get question_1_desc;

  /// No description provided for @question_2.
  ///
  /// In en, this message translates to:
  /// **'Question 2'**
  String get question_2;

  /// No description provided for @question_2_desc.
  ///
  /// In en, this message translates to:
  /// **'Input Forms and Validation'**
  String get question_2_desc;

  /// No description provided for @question_3.
  ///
  /// In en, this message translates to:
  /// **'Question 3'**
  String get question_3;

  /// No description provided for @question_3_desc.
  ///
  /// In en, this message translates to:
  /// **'Counter with State Management'**
  String get question_3_desc;

  /// No description provided for @input_form.
  ///
  /// In en, this message translates to:
  /// **'Input Form'**
  String get input_form;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @empty_data.
  ///
  /// In en, this message translates to:
  /// **'Data not found'**
  String get empty_data;

  /// No description provided for @change_language.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get change_language;

  /// No description provided for @change_language_desc.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language'**
  String get change_language_desc;

  /// No description provided for @change_language_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to change the language?'**
  String get change_language_confirmation;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @indonesian.
  ///
  /// In en, this message translates to:
  /// **'Indonesian'**
  String get indonesian;

  /// No description provided for @no_connection_get_data.
  ///
  /// In en, this message translates to:
  /// **'No connection, get lastest data from cache'**
  String get no_connection_get_data;

  /// No description provided for @detail_data.
  ///
  /// In en, this message translates to:
  /// **'Detail Data'**
  String get detail_data;

  /// No description provided for @choose_api_status.
  ///
  /// In en, this message translates to:
  /// **'Choose API Status'**
  String get choose_api_status;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'id': return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
