import 'package:flutter/material.dart';
import '../../../values/app_colors/all_colors_export.dart';
import '../extend_theme/check_box_theme_extend.dart';

// CheckBox Light Theme Extension
final checkBoxThemeLightExtension = CheckBoxThemeExtend(
  activeCheckBorderColorList: const [
    //active color, check color, boarder color(primary, white, black)--0
    [AppColors.appPrimaryColorLight, AppColors.whiteOnly, AppColors.blackOnly],
    [AppColors.appSecondaryColorLight, Color(0xff008080), Color(0xff000000)],
    [AppColors.whiteOnly, Color(0xffffffff), Color(0xff000000)],
  ],
);

// CheckBox Dark Theme Extension
final checkBoxThemeDarkExtension = CheckBoxThemeExtend(
  activeCheckBorderColorList: const[
    //active color, check color, boarder color(primary, white, black)--0
    [AppColors.whiteOnly, AppColors.blackOnly, AppColors.whiteOnly],
    [AppColors.whiteOnly, AppColors.whiteOnly, Color(0xffc33434)],
    [AppColors.whiteOnly, AppColors.whiteOnly, Color(0xff000000)],
  ],
);
