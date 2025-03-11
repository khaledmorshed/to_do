import '../../../../l10n/app_localizations.dart';
import 'menu_item.dart';

enum MenuCode { home, create, settings }

extension MenuCodeExtensions on MenuCode {
  BottomNavItem toBottomNavItem(AppLocalizations appLocalization) {
    switch (this) {
      case MenuCode.home:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavHome,
          iconSvgName: "images/png/home.png",
          menuCode: MenuCode.home,
        );
      case MenuCode.create:
        return BottomNavItem(
            navTitle: appLocalization.createTask,
            iconSvgName: "images/png/create_task.png",
            menuCode: MenuCode.create);
      case MenuCode.settings:
        return BottomNavItem(
            navTitle: appLocalization.bottomNavSettings,
            iconSvgName: "images/png/calendar.png",
            menuCode: MenuCode.settings);
    }
  }
}
