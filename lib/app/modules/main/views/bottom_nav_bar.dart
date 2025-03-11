import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/values/app_colors/all_colors_export.dart';
import 'package:to_do/app/core/widgets/custom_icon_widget.dart';

import '../../../core/base/base_widget_mixin.dart';
import '../../../core/values/app_values.dart';
import '../controllers/bottom_nav_controller.dart';
import '../model/menu_code.dart';
import '../model/menu_item.dart';

typedef OnBottomNavItemSelected = Function(MenuCode menuCode);

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget with BaseWidgetMixin {
  BottomNavBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final OnBottomNavItemSelected onItemSelected;
  final navController = BottomNavController();
  final Key bottomNavKey = GlobalKey();

  @override
  Widget body(BuildContext context) {
    List<BottomNavItem> navItems = _getNavItems();

    return Obx(
      () => BottomNavigationBar(
        key: bottomNavKey,
        items: _navItemBuilder(navItems),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
        selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: theme.bottomNavigationBarTheme.unselectedItemColor,
        currentIndex: navController.selectedIndex,
        onTap: (index) {
          navController.updateSelectedIndex(index);
          onItemSelected(navItems[index].menuCode);
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _navItemBuilder(List<BottomNavItem> navItems) {
    return navItems.map((BottomNavItem navItem) => _getBottomNavigationBarItem(
            navItem,
            navItems.indexOf(navItem) == navController.selectedIndex,
          ),
        )
        .toList();
  }

  BottomNavigationBarItem _getBottomNavigationBarItem(
    BottomNavItem navItem,
    bool isSelected,
  ) {
    return BottomNavigationBarItem(
      icon: CustomIconWidget(
        themeIndex: 0,
        child: navItem.iconSvgName,
        height: AppValues.iconDefaultSize,
        width: AppValues.iconDefaultSize,
       // color: isSelected ? AppColors.appp : Colors.black
        color: isSelected
            ? theme.bottomNavigationBarTheme.selectedItemColor
            : theme.bottomNavigationBarTheme.unselectedItemColor,

      ),
      label: navItem.navTitle,
      tooltip: navItem.navTitle,
    );
  }

  List<BottomNavItem> _getNavItems() {
    return MenuCode.values.map((e) => e.toBottomNavItem(appLocalization)).toList();
  }
}
