import 'package:flutter/material.dart';
import 'package:to_do/app/core/values/app_colors/all_colors_export.dart';
import '../extend_theme/custom_icon_widget_with_back_ground_extend_theme.dart';

final customIconWidgetWithBackGroundLightTheme =  CustomIconWidgetWithBackGroundExtendTheme(
  backgroundColors:  [
    AppColors.iconBackgroundColor,
    AppColors.whiteOnly,
    Colors.blue,
    Colors.grey.withOpacity(0.4),
  ],
);

// dark theme
final customIconWidgetWithBackGroundDarkTheme =  CustomIconWidgetWithBackGroundExtendTheme(
  backgroundColors:  [
    AppColors.iconBackgroundColor,
    AppColors.whiteOnly,
    Colors.blue,
    Colors.grey.withOpacity(0.4),
  ],
);
