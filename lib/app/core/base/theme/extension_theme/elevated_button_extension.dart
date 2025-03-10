import 'package:flutter/material.dart';
import 'package:to_do/app/core/values/app_colors/all_colors_export.dart';
import '../extend_theme/elevated_button_theme_extend.dart';
import '../extend_theme/text_button_theme_extend.dart';

final elevatedButtonThemeLightExtension = ElevatedButtonThemeExtend(
  disabledColors: [
    ButtonColor.buttonDisableColorLightPrimary,
    ButtonColor.buttonDisableColorLightSecondary,
    ButtonColor.buttonDisableColorLightFirst,
    ButtonColor.buttonDisableColorLightSecond,
  ],
  elevatedButtonStyles: [
    //primary color----0
    ElevatedButton.styleFrom(
      backgroundColor: ButtonColor.buttonColorLightPrimary,
      side: const BorderSide(color: ButtonColor.buttonColorLightPrimary),
      textStyle: const TextStyle(
        color: AppColors.whiteOnly,
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: ButtonColor.buttonColorLightPrimary, width: 0),
      ),
      shadowColor: ButtonColor.buttonColorLightPrimary,
    ),
    //secondary color----1
    ElevatedButton.styleFrom(
      backgroundColor: ButtonColor.buttonColorLightSecondary,
      side: const BorderSide(color: ButtonColor.buttonColorLightSecondary),
      textStyle: const TextStyle(
        color: AppColors.whiteOnly,
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: ButtonColor.buttonColorLightSecondary, width: 0),
      ),
      shadowColor: ButtonColor.buttonColorLightSecondary,
    ),
    //2
    ElevatedButton.styleFrom(
      backgroundColor: ButtonColor.buttonColorLightFirst,
      side: const BorderSide(color: ButtonColor.buttonColorLightFirst),
      textStyle: const TextStyle(
        color: AppColors.whiteOnly,
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: ButtonColor.buttonColorLightFirst, width: 0),
      ),
      shadowColor: ButtonColor.buttonColorLightFirst,
    ),
    //blue ---3
    ElevatedButton.styleFrom(
      backgroundColor: ButtonColor.buttonColorLightSecond,
      side: const BorderSide(color: ButtonColor.buttonColorLightSecond,),
      textStyle: const TextStyle(
        color: AppColors.whiteOnly,
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: ButtonColor.buttonColorLightSecond, width: 0),
      ),
      shadowColor: ButtonColor.buttonColorLightSecond,
    ),
  ],
);

final elevatedButtonThemeDarkExtension = ElevatedButtonThemeExtend(
  disabledColors: [
    ButtonColor.buttonDisableColorDarkPrimary,
    ButtonColor.buttonDisableColorDarkSecondary,
    ButtonColor.buttonDisableColorDarkFirst,
    ButtonColor.buttonDisableColorDarkSecond,
  ],
  elevatedButtonStyles: [
    //---0
    ElevatedButton.styleFrom(
      backgroundColor: ButtonColor.buttonColorDarkPrimary,
      side: const BorderSide(color: ButtonColor.buttonColorDarkPrimary),
      textStyle: const TextStyle(
        color: AppColors.whiteOnly,
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: ButtonColor.buttonColorDarkPrimary, width: 0),
      ),
    ),
    //----1
    ElevatedButton.styleFrom(
      backgroundColor: ButtonColor.buttonColorDarkSecondary,
      side: const BorderSide(color: ButtonColor.buttonColorDarkSecondary),
      textStyle: const TextStyle(
        color: AppColors.whiteOnly,
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: ButtonColor.buttonColorDarkSecondary, width: 0),
      ),
    ),
    //----2
    ElevatedButton.styleFrom(
      backgroundColor: ButtonColor.buttonColorDarkFirst,
      side: const BorderSide(color: ButtonColor.buttonColorDarkFirst),
      textStyle: const TextStyle(
        color: AppColors.whiteOnly,
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: ButtonColor.buttonColorDarkFirst, width: 0),
      ),
    ),
    //----3
    ElevatedButton.styleFrom(
      backgroundColor: ButtonColor.buttonColorDarkSecond,
      side: const BorderSide(color: ButtonColor.buttonColorDarkSecond),
      textStyle: const TextStyle(
        color: AppColors.whiteOnly,
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: ButtonColor.buttonColorDarkSecond, width: 0),
      ),
    ),
  ],
);