import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/base/theme/theme.dart';
import '../../../../flavors/build_config.dart';
import '../../../../flavors/env_config.dart';
import '../../../data/local/preference/preference_manager.dart';
import '../../../data/local/preference/preference_manager_impl.dart';
import '../../values/app_colors/all_colors_export.dart';
import 'extension_theme/check_box_extension.dart';
import 'extension_theme/container_extension.dart';
import 'extension_theme/custom_icon_widget_with_back_ground_extension.dart';
import 'extension_theme/custom_rectangle_icon_widget_with_back_ground_extension.dart';
import 'extension_theme/divider_extension.dart';
import 'extension_theme/elevated_button_extension.dart';
import 'extension_theme/icon_extension.dart';
import 'extension_theme/text_button_extension.dart';
import 'extension_theme/text_extension.dart';
import 'extension_theme/text_form_feild_extension.dart';

class AppThemeData{

  // light theme
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor:  AppColors.scaffoldBackGroundColorLight,
      primaryColor:  AppColors.appPrimaryColorLight,
      primaryColorLight: AppColors.appPrimaryColorLight,
      appBarTheme: AppBarTheme(
        color: AppColors.appPrimaryColorLight,
        iconTheme: IconThemeData(
          color: AppColors.whiteOnly,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.appPrimaryColorLight, opacity: 0.7),
      hintColor: AppColors.hintColor,
      highlightColor: AppColors.appSecondaryColorLight,
      snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColors.appPrimaryColorLight
      ),
      disabledColor: AppColors.disableColorLight,
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.whiteOnly,
        titleTextStyle: TextStyle(
          color: AppColors.appPrimaryColorLight,
        ),
        contentTextStyle: TextStyle(
          color: AppColors.blackOnly,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.whiteOnly,
        unselectedItemColor: AppColors.blackOnly,
        selectedItemColor: AppColors.appPrimaryColorLight
      ),
      extensions: [
        textThemeLightExtension,
        textFormFieldThemeLightExtension,
        containerThemeLightExtension,
        iconThemeLightExtension,
        elevatedButtonThemeLightExtension,
        textButtonThemeLightExtension,
        dividerThemeLight,
        customRectangleIconWidgetWithBackGroundLightTheme,
        customIconWidgetWithBackGroundLightTheme,
        checkBoxThemeLightExtension,
      ]
  );

  // dark theme
  static final darkThem = ThemeData(
    scaffoldBackgroundColor:  AppColors.appPrimaryColorDark,
    primaryColor:  AppColors.appPrimaryColorDark,
    primaryColorDark: AppColors.appPrimaryColorDark,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: AppColors.whiteOnly,
        ),
      ),
      iconTheme:  const IconThemeData(color: AppColors.whiteOnly, opacity: 0.8),
      disabledColor: AppColors.disableColorDark,
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.whiteOnly,
        titleTextStyle: TextStyle(
          color: AppColors.appPrimaryColorDark,
        ),
        contentTextStyle: TextStyle(
          color: AppColors.blackOnly,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.blackOnly,
          unselectedItemColor: AppColors.green400,
          selectedItemColor: AppColors.whiteOnly
      ),
      extensions: [
        textThemeDarkExtension,
        textFormFieldThemeDarkExtension,
        containerThemeDarkExtension,
        iconThemDarkExtension,
        elevatedButtonThemeDarkExtension,
        textButtonThemeDarkExtension,
        dividerThemeDark,
        customRectangleIconWidgetWithBackGroundDarkTheme,
        customIconWidgetWithBackGroundDarkTheme,
        checkBoxThemeDarkExtension,
      ]
  );


  ThemeData getTheme(){
    final EnvConfig envConfig = BuildConfig.instance.envConfig;
    final PreferenceManager preferenceManager = PreferenceManagerImpl();
    String savedTheme = preferenceManager.getString(
        PreferenceManager.theme,
        defaultValue: AppTheme.system.name
    );
    envConfig.logger.i("Saved Theme: $savedTheme");
    if(savedTheme == AppTheme.dark.name){
      return AppThemeData.darkThem;
    }else if(savedTheme == AppTheme.light.name){
      return AppThemeData.lightTheme;
    }else{
      return AppThemeData.lightTheme;
      return _getThemeSameAsSystem();
    }
  }

  ThemeData _getThemeSameAsSystem() {
    return Get.isPlatformDarkMode
        ? AppThemeData.darkThem
        : AppThemeData.lightTheme;
  }

}