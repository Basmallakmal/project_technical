import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:project_technical/domain/model/post_model.dart';
import 'package:project_technical/presentation/utils/language_support.dart';

class AppSession {
  static FlutterSecureStorage storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      sharedPreferencesName: hiveSession,
    ),
  );

  static String keyToken = "token";
  static String keyId = "id";
  static String hiveSession = "project-tech-session-hive";

  static String hivePostData = "post-data-hive";

  static String keyName = "name";
  static String keyUsername = "username";
  static String keyPhoto = "photo_profile";
  static String keyRole = "user_role";
  static String keyAccountVerif = "account-verif-status";
  static String keyLanguage = "user-language";

  /// SECURE STORAGE

  saveToken(String token) async {
    await storage.write(key: keyToken, value: token);
  }

  Future<String> getToken() async {
    return await storage.read(key: keyToken) ?? "";
  }

  saveId(String value) async {
    await storage.write(key: keyId, value: value);
  }

  Future<String> getId() async {
    return await storage.read(key: keyId) ?? "";
  }

  /// HIVE SESSION

  Future openBox() async {
    await Hive.openBox(hiveSession);
    await Hive.openBox<PostModel>(hivePostData);
  }

  saveName(String value, {Box? setBox}) {
    var box = setBox ?? Hive.box(hiveSession);
    box.put(keyName, value);
  }

  String getName({Box? setBox}) {
    var box = setBox ?? Hive.box(hiveSession);
    return box.get(keyName, defaultValue: "");
  }

  savePhotoProfile(String value, {Box? setBox}) {
    var box = setBox ?? Hive.box(hiveSession);
    box.put(keyPhoto, value);
  }

  String getPhotoProfile({Box? setBox}) {
    var box = setBox ?? Hive.box(hiveSession);
    return box.get(keyPhoto, defaultValue: "");
  }

  saveUserRole(String value, {Box? setBox}) {
    var box = setBox ?? Hive.box(hiveSession);
    box.put(keyRole, value);
  }

  String getUserRole({Box? setBox}) {
    var box = setBox ?? Hive.box(hiveSession);
    return box.get(keyRole, defaultValue: "");
  }

  saveUsername(String value, {Box? setBox}) {
    var box = setBox ?? Hive.box(hiveSession);
    box.put(keyUsername, value);
  }

  String getUsername({Box? setBox}) {
    var box = setBox ?? Hive.box(hiveSession);
    return box.get(keyUsername, defaultValue: "");
  }

  saveAccVerifStatus(bool value, {Box? setBox}) {
    var box = setBox ?? Hive.box(hiveSession);
    box.put(keyAccountVerif, value);
  }

  bool getAccVerifStatus({Box? setBox}) {
    var box = setBox ?? Hive.box(hiveSession);
    return box.get(keyAccountVerif, defaultValue: false);
  }

  saveLanguage(LanguageSupport lang, {Box? setBox}) {
    var box = setBox ?? Hive.box(hiveSession);
    if (lang.value != getLanguage()) {
      box.put(keyLanguage, lang.value);
    }
  }

  String getLanguage({Box? setBox}) {
    var box = setBox ?? Hive.box(hiveSession);
    return box.get(keyLanguage, defaultValue: LanguageSupport.en.value);
  }

  /// MAIN FUNCTION

  Future saveAppSession({
    required String token,
    required String name,
    required String username,
    required String photo,
    required String role,
    required bool accountVerif,
    required String language,
  }) async {
    await saveToken(token);
    await saveName(name);
    await saveUsername(username);
    await savePhotoProfile(photo);
    await saveUserRole(role);
    await saveAccVerifStatus(accountVerif);
    await saveLanguage(LanguageSupportHelper.getLanguageSupport(language));
  }

  Future deleteAppSession() async {
    var box = Hive.box(hiveSession);
    List<String> deleteKeyList = [
      keyName,
      keyPhoto,
      keyRole,
      keyAccountVerif,
      keyLanguage,
    ];

    await box.deleteAll(deleteKeyList);
    await storage.deleteAll();
  }
}
