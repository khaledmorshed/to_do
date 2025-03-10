import 'package:flutter/material.dart';
import '../../../values/app_colors/all_colors_export.dart';
import '../extend_theme/icon_theme_extend.dart';

//light
final iconThemeLightExtension = IconThemeExtend(
  iconThemes: const[
    //primary----0
    IconThemeData(
      color: AppColors.appPrimaryColorLight,
      opacity: 0.8,
    ),
    //secondary---1
    IconThemeData(
      color: AppColors.appSecondaryColorLight,
      opacity: 0.8,
    ),
    //white----2
    IconThemeData(
      color: AppColors.whiteOnly,
      opacity: 0.8,
    ),
    //
    IconThemeData(
      color: AppColors.whiteOnly,
      opacity: 0.8,
    ),
  ]
);

//dark
final iconThemDarkExtension =  IconThemeExtend(
    iconThemes: const[
      IconThemeData(
        color: AppColors.appPrimaryColorLight,
        opacity: 0.8,
      ),
      IconThemeData(
        color: AppColors.appSecondaryColorDark,
        opacity: 0.8,
      ),
      IconThemeData(
        color: AppColors.whiteOnly,
        opacity: 0.8,
      ),
      IconThemeData(
        color: AppColors.whiteOnly,
        opacity: 0.8,
      ),
    ]
);