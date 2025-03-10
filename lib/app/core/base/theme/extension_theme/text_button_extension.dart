import 'package:flutter/material.dart';
import '../../../values/app_colors/all_colors_export.dart';
import '../extend_theme/text_button_theme_extend.dart';

//light
final textButtonThemeLightExtension =  TextButtonThemeExtend(
    disabledColors: [
      ButtonColor.buttonDisableColorLightPrimary,
      ButtonColor.buttonDisableColorLightSecondary,
      ButtonColor.buttonDisableColorLightFirst,
      ButtonColor.buttonDisableColorLightSecond,
    ],
    textButtonStyles: [
      //----0
      TextButton.styleFrom(
        backgroundColor: ButtonColor.buttonColorLightPrimary,
        side: const BorderSide(color: ButtonColor.buttonColorLightPrimary),
        textStyle: const TextStyle(
          color: AppColors.whiteOnly,
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: ButtonColor.buttonColorLightPrimary, width: 0),
        ),
      ),
      //----1
      TextButton.styleFrom(
        backgroundColor: ButtonColor.buttonColorLightSecondary,
        side: const BorderSide(color: ButtonColor.buttonColorLightSecondary),
        textStyle: const TextStyle(
          color: AppColors.whiteOnly,
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: ButtonColor.buttonColorLightSecondary, width: 0),
        ),
      ),
      //----2
      TextButton.styleFrom(
        backgroundColor: ButtonColor.buttonColorLightFirst,
        side: const BorderSide(color: ButtonColor.buttonColorLightFirst),
        textStyle: const TextStyle(
          color: AppColors.whiteOnly,
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: ButtonColor.buttonColorLightFirst, width: 0),
        ),
      ),
      //----3
      TextButton.styleFrom(
        backgroundColor: ButtonColor.buttonColorLightSecond,
        side: const BorderSide(color: ButtonColor.buttonColorLightSecond),
        textStyle: const TextStyle(
          color: AppColors.whiteOnly,
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: ButtonColor.buttonColorLightSecond, width: 0),
        ),
      ),
    ]
    
);

//dark
final textButtonThemeDarkExtension = TextButtonThemeExtend(
    disabledColors: [
      ButtonColor.buttonDisableColorDarkPrimary,
      ButtonColor.buttonDisableColorDarkSecondary,
      ButtonColor.buttonDisableColorDarkFirst,
      ButtonColor.buttonDisableColorDarkSecond,
    ],
    textButtonStyles: [
      //---0
      TextButton.styleFrom(
        backgroundColor: ButtonColor.buttonColorDarkPrimary,
        side: const BorderSide(color: ButtonColor.buttonColorDarkPrimary),
        textStyle: const TextStyle(
          color: AppColors.whiteOnly,
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: ButtonColor.buttonColorDarkPrimary, width: 0),
        ),
      ),
      //---1
      TextButton.styleFrom(
        backgroundColor: ButtonColor.buttonColorDarkSecondary,
        side: const BorderSide(color: ButtonColor.buttonColorDarkSecondary),
        textStyle: const TextStyle(
          color: AppColors.whiteOnly,
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: ButtonColor.buttonColorDarkSecondary, width: 0),
        ),
      ),
      //---2
      TextButton.styleFrom(
        backgroundColor: ButtonColor.buttonColorDarkFirst,
        side: const BorderSide(color: ButtonColor.buttonColorDarkFirst),
        textStyle: const TextStyle(
          color: AppColors.blackOnly,
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: ButtonColor.buttonColorDarkFirst, width: 0),
        ),
      ),
      //---3
      TextButton.styleFrom(
        backgroundColor: ButtonColor.buttonColorDarkSecond,
        side: const BorderSide(color: ButtonColor.buttonColorDarkSecond),
        textStyle: const TextStyle(
          color: AppColors.whiteOnly,
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: ButtonColor.buttonColorDarkSecond, width: 0),
        ),
      ),
    ]

    
);