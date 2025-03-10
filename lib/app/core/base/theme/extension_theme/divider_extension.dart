
import 'package:flutter/material.dart';
import '../../../values/app_colors/all_colors_export.dart';
import '../extend_theme/divider_theme_extend.dart';

const dividerThemeLight = DividerThemeExtend(
  dividerPrimary: AppColors.appPrimaryColorLight,
  dividerSecondary: AppColors.appSecondaryColorLight,
  dividerFirst: AppColors.appPrimaryColorLight,
  dividerSecond: AppColors.appSecondaryColorLight,
);

const dividerThemeDark = DividerThemeExtend(
  dividerPrimary: AppColors.appPrimaryColorLight,
  dividerSecondary: AppColors.appSecondaryColorLight,
  dividerFirst: Color(0xefd1ce09),
  dividerSecond: Color(0xefd1ce09),
);