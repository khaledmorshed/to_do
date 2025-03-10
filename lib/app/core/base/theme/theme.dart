import 'package:get/get.dart';

import '../../../../l10n/app_localizations.dart';


enum AppTheme { light, dark, system }

extension AppThemeExtension on AppTheme {
  String getThemeName(AppLocalizations appLocalization) {
    switch (this) {
      case AppTheme.dark:
        return appLocalization.themeDark;
      case AppTheme.light:
        return appLocalization.themeLight;
      default:
        return appLocalization.themeSystem;
    }
  }

  bool getIsDarkModeOn() {
    return Get.isDarkMode || this == AppTheme.dark;
  }
}
