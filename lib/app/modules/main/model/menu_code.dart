import '../../../../l10n/app_localizations.dart';
import 'menu_item.dart';

enum MenuCode { home, create, settings }

extension MenuCodeExtensions on MenuCode {
  BottomNavItem toBottomNavItem(AppLocalizations appLocalization) {
    switch (this) {
      case MenuCode.home:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavHome,
          iconSvgName: "ic_home.svg",
          menuCode: MenuCode.home,
        );
      case MenuCode.create:
        return BottomNavItem(
            navTitle: appLocalization.bottomNavFavorite,
            iconSvgName: "ic_favorite.svg",
            menuCode: MenuCode.create);
      case MenuCode.settings:
        return BottomNavItem(
            navTitle: appLocalization.bottomNavSettings,
            iconSvgName: "ic_settings.svg",
            menuCode: MenuCode.settings);
    }
  }
}
