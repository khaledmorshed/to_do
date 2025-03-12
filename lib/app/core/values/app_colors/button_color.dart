//button color
import 'package:flutter/material.dart';
import 'package:to_do/app/core/values/app_colors/all_colors_export.dart';

abstract class ButtonColor{
//button background color light
  static const Color buttonColorLightPrimary = AppColors.appPrimaryColorLight;
  static const Color buttonColorLightSecondary = AppColors.appSecondaryColorLight;
  static const Color buttonColorLightFirst = AppColors.appPrimaryColorThirdLight;
  static const Color buttonColorLightSecond = AppColors.appSecondaryColorThirdLight;
//button background color dark
  static const Color buttonColorDarkPrimary = AppColors.appPrimaryColorDark;
  static const Color buttonColorDarkSecondary = AppColors.appSecondaryColorDark;
  static const Color buttonColorDarkFirst = Color(0xff0057A3);
  static const Color buttonColorDarkSecond = Color(0xff0057A3);


//button disable color light
  static const Color buttonDisableColorLightPrimary = AppColors.appPrimaryColorLight;
  static const Color buttonDisableColorLightSecondary = AppColors.appSecondaryColorLight;
  static const Color buttonDisableColorLightFirst = Color(0xffdddada);
  static const Color buttonDisableColorLightSecond = Color(0xffdddada);
//button disable color dark
  static const Color buttonDisableColorDarkPrimary = AppColors.appPrimaryColorDark;
  static const Color buttonDisableColorDarkSecondary = AppColors.appSecondaryColorDark;
  static const Color buttonDisableColorDarkFirst = Color(0xffdddada);
  static const Color buttonDisableColorDarkSecond = Color(0xffdddada);
}