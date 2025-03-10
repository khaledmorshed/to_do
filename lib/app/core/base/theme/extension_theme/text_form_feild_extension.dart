import 'package:flutter/material.dart';
import 'package:to_do/app/core/values/app_colors/all_colors_export.dart';
import '../extend_theme/text_form_field_theme_extend.dart';

// Light Theme Extension
final textFormFieldThemeLightExtension = TextFormFieldThemeExtend(
  textStyles:  [
    TextStyle(color: AppColors.blackOnly),
    TextStyle(color: AppColors.blackOnly),
  ],
  inputDecorationThemes: const [
    // First Theme--0
    InputDecorationTheme(
      border: OutlineInputBorder(borderSide: BorderSide(color: TextFormFieldColor.textFieldBoarderColorLightFirst)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: TextFormFieldColor.textFieldEnableBoarderColorLightFirst)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: TextFormFieldColor.textFieldFocusBoarderColorLightFirst)),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: TextFormFieldColor.textFieldEnableBoarderColorLightFirst)),
      disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      labelStyle: TextStyle(color: TextFormFieldColor.textFieldLabelColorLightFirst),
      hintStyle: TextStyle(color: TextFormFieldColor.textFieldHintColorLightFirst),
      fillColor: TextFormFieldColor.textFieldFillColorLightFirst,
      focusColor: TextFormFieldColor.textFieldFocusBoarderColorLightFirst,
      floatingLabelStyle: TextStyle(color: TextFormFieldColor.textFieldFloatingLabelColorDarkFirst),
      suffixIconColor: TextFormFieldColor.textFieldSuffixColorLightFirst,
      prefixIconColor: TextFormFieldColor.textFieldPrefixColorLightFirst,
      counterStyle: TextStyle(color: Colors.grey),
      helperStyle: TextStyle(color: Colors.grey),
    ),
    // Second---1
    InputDecorationTheme(
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
      disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
      labelStyle: TextStyle(color: Colors.blueGrey),
      hintStyle: TextStyle(color: Colors.blueGrey),
      errorStyle: TextStyle(color: Colors.purple),
      fillColor: Colors.blueGrey,
      focusColor: Colors.green,
      hoverColor: Colors.green,
      floatingLabelStyle: TextStyle(color: Colors.orange),
      suffixIconColor: Colors.green,
      prefixIconColor: Colors.green,
      counterStyle: TextStyle(color: Colors.blueGrey),
      helperStyle: TextStyle(color: Colors.blueGrey),
    ),
  ],
);

// Dark Theme Extension
final textFormFieldThemeDarkExtension = TextFormFieldThemeExtend(
  textStyles: const [
    TextStyle(color: AppColors.whiteOnly),
    TextStyle(color: AppColors.whiteOnly),
  ],
  inputDecorationThemes: const [
    // First Theme
    InputDecorationTheme(
      border: OutlineInputBorder(borderSide: BorderSide(color: TextFormFieldColor.textFieldBoarderColorDarkFirst)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: TextFormFieldColor.textFieldEnableBoarderColorDarkFirst)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: TextFormFieldColor.textFieldFocusBoarderColorDarkFirst)),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: TextFormFieldColor.textFieldErrorBoarderColorDarkFirst)),
      disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
      labelStyle: TextStyle(color: TextFormFieldColor.textFieldLabelColorDarkFirst),
      hintStyle: TextStyle(color: TextFormFieldColor.textFieldHintColorDarkFirst),
      fillColor: TextFormFieldColor.textFieldFillColorDarkFirst,
      focusColor: TextFormFieldColor.textFieldFocusBoarderColorDarkFirst,
      floatingLabelStyle: TextStyle(color: TextFormFieldColor.textFieldFloatingLabelColorDarkFirst),
      suffixIconColor: AppColors.appPrimaryColorLight,
      prefixIconColor: AppColors.appPrimaryColorLight,
      counterStyle: TextStyle(color: Colors.grey),
      helperStyle: TextStyle(color: Colors.grey),
    ),
    InputDecorationTheme(
      border: OutlineInputBorder(borderSide: BorderSide(color: TextFormFieldColor.textFieldBoarderColorDarkFirst)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: TextFormFieldColor.textFieldEnableBoarderColorDarkFirst)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: TextFormFieldColor.textFieldFocusBoarderColorDarkFirst)),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: TextFormFieldColor.textFieldErrorBoarderColorDarkFirst)),
      disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
      labelStyle: TextStyle(color: TextFormFieldColor.textFieldLabelColorDarkFirst),
      hintStyle: TextStyle(color: TextFormFieldColor.textFieldHintColorDarkFirst),
      fillColor: TextFormFieldColor.textFieldFillColorDarkFirst,
      focusColor: TextFormFieldColor.textFieldFocusBoarderColorDarkFirst,
      floatingLabelStyle: TextStyle(color: TextFormFieldColor.textFieldFloatingLabelColorDarkFirst),
      suffixIconColor: AppColors.appPrimaryColorDark,
      prefixIconColor: AppColors.appPrimaryColorDark,
      counterStyle: TextStyle(color: Colors.grey),
      helperStyle: TextStyle(color: Colors.grey),
    ),
  ],
);
