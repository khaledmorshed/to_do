enum AppLanguages {
  en, // Norwegian
  bn, // English
}

extension AppLanguageTitle on AppLanguages {
  String getTitle() {
    switch (this) {
      case AppLanguages.en:
        return "English";
      case AppLanguages.bn:
        return "Bengali";
      default:
        return "English";
    }
  }
}
