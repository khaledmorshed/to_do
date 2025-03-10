import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_values.dart';

/// For Roboto Google Font
myTxtCustom({
  double fontSize = 14,
  Color? color,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  TextDecoration? decoration,
  Color? decorationColor, double? height}){
  return TextStyle(fontFamily: AppValues.fontFamily, height: height, fontSize: fontSize, color: color, fontWeight: fontWeight,
    fontStyle: fontStyle, decoration: decoration, decorationColor: decorationColor,
    letterSpacing: letterSpacing,);
}

/// For Extra Large Size
myTxt18({Color? color, FontWeight? fontWeight, FontStyle fonStyle = FontStyle.normal, double? height}){
  return TextStyle(fontFamily: AppValues.fontFamily, height: height,  fontSize: 18.sp, color: color, fontWeight: fontWeight ?? FontWeight.w800,);
}

/// For Large Size
myTxt16({Color? color, FontWeight? fontWeight, FontStyle fonStyle = FontStyle.normal, double? height}){
  return TextStyle(fontFamily: AppValues.fontFamily, height: height, fontSize: 16.sp, color: color, fontWeight: fontWeight ?? FontWeight.w600, fontStyle: fonStyle,);
}
/// For Medium Size
myTxt15({Color? color, FontWeight? fontWeight, FontStyle fonStyle = FontStyle.normal, double? height}){
  return TextStyle(fontFamily: AppValues.fontFamily, height: height, fontSize: 15.sp, color: color, fontWeight: fontWeight ?? FontWeight.normal, fontStyle: fonStyle,);
}

/// For Medium Size
myTxt14({Color? color, FontWeight? fontWeight, FontStyle fonStyle = FontStyle.normal, double? height}){
  return TextStyle(fontFamily: AppValues.fontFamily, height: height, fontSize: 14.sp, color: color, fontWeight: fontWeight ?? FontWeight.normal, fontStyle: fonStyle,);
}

/// For Medium Size
myTxt13({Color? color, FontWeight? fontWeight, FontStyle fonStyle = FontStyle.normal, double? height}){
  return TextStyle(fontFamily: AppValues.fontFamily, height: height, fontSize: 13.sp, color: color, fontWeight: fontWeight ?? FontWeight.normal, fontStyle: fonStyle,);
}

/// For Small Size
myTxt12({Color? color, FontWeight? fontWeight, FontStyle? fonStyle, double? height}){
  return TextStyle(fontFamily: AppValues.fontFamily, height: height, fontSize: 12.sp, color: color, fontWeight: fontWeight ?? FontWeight.w400);
}

/// For Very Small Size
myTxt11({Color? color, FontWeight? fontWeight, FontStyle? fonStyle, double? height}){
  return TextStyle(fontFamily: AppValues.fontFamily, height: height, fontSize: 11.sp, color: color, fontWeight: fontWeight ?? FontWeight.w400);
}

/// For Very Small Size
myTxt10({Color? color, FontWeight? fontWeight, FontStyle? fonStyle, double? height}){
  return TextStyle(fontFamily: AppValues.fontFamily, height: height, fontSize: 10.sp, color: color, fontWeight: fontWeight ?? FontWeight.w400);
}

