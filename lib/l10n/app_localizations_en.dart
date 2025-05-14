// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get password_desc => 'Please enter your password';

  @override
  String get change_password => 'Change Password';

  @override
  String get confirm_password => 'Confirm Password';

  @override
  String get confirm_password_empty => 'Confirm Password cannot be empty';

  @override
  String get password_not_match => 'Password does not match';

  @override
  String get new_password_desc => 'Please enter your new password';

  @override
  String get validate_password => 'Validate Password';

  @override
  String get login => 'Login';

  @override
  String get login_desc => 'Login to your account';

  @override
  String get email_empty => 'Email cannot be empty';

  @override
  String get email_invalid => 'Email is invalid';

  @override
  String get password_empty => 'Password cannot be empty';

  @override
  String get phone_number => 'Phone Number';

  @override
  String get phone_number_empty => 'Phone Number cannot be empty';

  @override
  String get username => 'Username';

  @override
  String get username_empty => 'Username cannot be empty';

  @override
  String get main_menu => 'Main Menu';

  @override
  String get about_us => 'About Us';

  @override
  String get contact_us => 'Contact Us';

  @override
  String get terms_and_conditions => 'Terms and Conditions';

  @override
  String get privacy_policy => 'Privacy Policy';

  @override
  String get logout => 'Logout';

  @override
  String get logout_desc => 'Are you sure you want to logout?';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get yes => 'Yes';

  @override
  String get something_went_wrong => 'Something went wrong';

  @override
  String get no_internet_connection => 'No internet connection';

  @override
  String get retry => 'Retry';

  @override
  String get bad_request_exception => 'Invalid Request';

  @override
  String get internal_server_error_exception => 'Unknown error occurred, please try again later.';

  @override
  String get conflict_exception => 'Conflict occurred';

  @override
  String get unauthorized_exception => 'Access denied';

  @override
  String get unverified_exception => 'Access denied';

  @override
  String get not_found_exception => 'The requested information could not be found';

  @override
  String get no_interent_connection => 'No internet connection detected, please try again.';

  @override
  String get timeout_exception => 'The connection has timed out, please try again.';

  @override
  String get too_many_requests_exception => 'Too many requests, please try again later.';
}
