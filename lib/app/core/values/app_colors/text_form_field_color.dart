import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class TextFormFieldColor {
// text color light
  static const Color textFieldTextLightFirst = Color(0xff050000);

// text color dark
  static const Color textFieldTextDarkFirst = Color(0xfffbfbfb);

// border color light
  static const Color textFieldBoarderColorLightFirst = Color(0xffBDBDBD);
  static const Color textFieldEnableBoarderColorLightFirst = Color(0xffBDBDBD);
  static const Color textFieldFocusBoarderColorLightFirst = Color(0xff0057A3); // primary color
  static const Color textFieldErrorBoarderColorLightFirst = Color(0xffBDBDBD);

// border color dark
  static const Color textFieldBoarderColorDarkFirst = Color(0xffBDBDBD);
  static const Color textFieldEnableBoarderColorDarkFirst = Color(0xffBDBDBD);
  static const Color textFieldFocusBoarderColorDarkFirst = Color(0xff0057A3);
  static const Color textFieldErrorBoarderColorDarkFirst = Color(0xfff60404);

// fill color light
  static const Color textFieldFillColorLightFirst = Color(0xffffffff);

// fill color dark
  static const Color textFieldFillColorDarkFirst = Color(0xff817f7f);

// hint color light
  static const Color textFieldHintColorLightFirst = Color(0xffBDBDBD);

// hint color dark
  static const Color textFieldHintColorDarkFirst = Color(0xfffffdfd);

// label color light
  static const Color textFieldLabelColorLightFirst = Color(0xffBDBDBD);

// label color dark
  static const Color textFieldLabelColorDarkFirst = Color(0xffBDBDBD);

// floating label color light
  static const Color textFieldFloatingLabelColorLightFirst = Color(0xffBDBDBD);

// floating label color dark
  static const Color textFieldFloatingLabelColorDarkFirst = Color(0xffBDBDBD);

// prefix icon color light
  static const Color textFieldPrefixColorLightFirst = Color(0xff0057A3); // primary color

// prefix icon color dark
  static const Color textFieldPrefixColorDarkFirst = Color(0xff0057A3); // primary color

// suffix icon color light
  static const Color textFieldSuffixColorLightFirst = Color(0xff0057A3); // primary color

// suffix icon color dark
  static const Color textFieldSuffixColorDarkFirst = AppColors.whiteOnly; // primary color

}