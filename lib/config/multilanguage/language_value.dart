import 'package:project_i/l10n/app_localizations.dart';

import '../../presentation/utils/app_services.dart';

class LanguageValue {
  /// LOGIN STRING
  static String get email => AppLocalizations.of(AppServices.context)!.email;

  static String get password =>
      AppLocalizations.of(AppServices.context)!.password;

  static String get login => AppLocalizations.of(AppServices.context)!.login;

  static String get login_desc =>
      AppLocalizations.of(AppServices.context)!.login_desc;

  static String get email_empty =>
      AppLocalizations.of(AppServices.context)!.email_empty;

  static String get email_invalid =>
      AppLocalizations.of(AppServices.context)!.email_invalid;

  static String get username =>
      AppLocalizations.of(AppServices.context)!.username;

  static String get username_empty =>
      AppLocalizations.of(AppServices.context)!.username_empty;

  static String get password_empty =>
      AppLocalizations.of(AppServices.context)!.password_empty;

  static String get phone_number =>
      AppLocalizations.of(AppServices.context)!.phone_number;

  static String get phone_number_empty =>
      AppLocalizations.of(AppServices.context)!.phone_number_empty;

  /// NETWORK ERROR STRING
  static String get something_went_wrong =>
      AppLocalizations.of(AppServices.context)!.something_went_wrong;

  static String get bad_request_exception =>
      AppLocalizations.of(AppServices.context)!.bad_request_exception;

  static String get internal_server_error_exception =>
      AppLocalizations.of(AppServices.context)!.internal_server_error_exception;

  static String get conflict_exception =>
      AppLocalizations.of(AppServices.context)!.conflict_exception;

  static String get unauthorized_exception =>
      AppLocalizations.of(AppServices.context)!.unauthorized_exception;

  static String get unverified_exception =>
      AppLocalizations.of(AppServices.context)!.unverified_exception;

  static String get not_found_exception =>
      AppLocalizations.of(AppServices.context)!.not_found_exception;

  static String get no_interent_connection =>
      AppLocalizations.of(AppServices.context)!.no_interent_connection;

  static String get timeout_exception =>
      AppLocalizations.of(AppServices.context)!.timeout_exception;

  static String get too_many_requests_exception =>
      AppLocalizations.of(AppServices.context)!.too_many_requests_exception;

  /// PROFILE STRING

  static String get main_menu =>
      AppLocalizations.of(AppServices.context)!.main_menu;

  static String get about_us =>
      AppLocalizations.of(AppServices.context)!.about_us;

  static String get contact_us =>
      AppLocalizations.of(AppServices.context)!.contact_us;

  static String get terms_and_conditions =>
      AppLocalizations.of(AppServices.context)!.terms_and_conditions;

  static String get privacy_policy =>
      AppLocalizations.of(AppServices.context)!.privacy_policy;

  static String get logout_desc =>
      AppLocalizations.of(AppServices.context)!.logout_desc;

  static String get logout => AppLocalizations.of(AppServices.context)!.logout;

  static String get change_password =>
      AppLocalizations.of(AppServices.context)!.change_password;

  static String get password_desc =>
      AppLocalizations.of(AppServices.context)!.password_desc;

  static String get confirm_password =>
      AppLocalizations.of(AppServices.context)!.confirm_password;

  static String get confirm_password_empty =>
      AppLocalizations.of(AppServices.context)!.confirm_password_empty;

  static String get password_not_match =>
      AppLocalizations.of(AppServices.context)!.password_not_match;

  static String get new_password_desc =>
      AppLocalizations.of(AppServices.context)!.new_password_desc;

  static String get validate_password =>
      AppLocalizations.of(AppServices.context)!.validate_password;

  /// GENERAL STRING

  static String get no_internet_connection =>
      AppLocalizations.of(AppServices.context)!.no_internet_connection;

  static String get retry => AppLocalizations.of(AppServices.context)!.retry;

  static String get cancel => AppLocalizations.of(AppServices.context)!.cancel;

  static String get ok => AppLocalizations.of(AppServices.context)!.ok;

  static String get yes => AppLocalizations.of(AppServices.context)!.yes;
}
