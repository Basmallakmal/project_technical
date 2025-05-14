enum LanguageSupport { en, id }

extension LanguageSupportExtension on LanguageSupport {
  String get value {
    switch (this) {
      case LanguageSupport.en:
        return "en";
      case LanguageSupport.id:
        return "id";
    }
  }
}

class LanguageSupportHelper {
  static LanguageSupport getLanguageSupport(String value) {
    switch (value) {
      case "en":
        return LanguageSupport.en;
      case "id":
        return LanguageSupport.id;
      default:
        return LanguageSupport.id;
    }
  }
}