import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'extend_theme/check_box_theme_extend.dart';
import 'extend_theme/container_theme_extend.dart';
import 'extend_theme/custom_icon_widget_with_back_ground_extend_theme.dart';
import 'extend_theme/custom_rectangle_icon_widget_with_back_ground_extend_theme.dart';
import 'extend_theme/elevated_button_theme_extend.dart';
import 'extend_theme/icon_theme_extend.dart';
import 'extend_theme/text_button_theme_extend.dart';
import 'extend_theme/text_form_field_theme_extend.dart';
import 'extend_theme/text_theme_extend.dart';

class GetTheme{
  //text theme
  TextThemeExtend txtTheme(){
    return Theme.of(Get.context!).extension<TextThemeExtend>()!;
  }

  //icon theme
  IconThemeExtend iconTheme(){
    return Theme.of(Get.context!).extension<IconThemeExtend>()!;
  }
  ContainerThemeExtend containerTheme(){
    return Theme.of(Get.context!).extension<ContainerThemeExtend>()!;
  }

  // CustomRectangleIconWidgetWithBackGroundExtendTheme
  CustomRectangleIconWidgetWithBackGroundExtendTheme customRectangleIconWidgetWithBackGroundTheme(){
    return Theme.of(Get.context!).extension<CustomRectangleIconWidgetWithBackGroundExtendTheme>()!;
  }

  // CustomRectangleIconWidgetWithBackGroundExtendTheme
  CustomIconWidgetWithBackGroundExtendTheme customIconWidgetWithBackGroundTheme(){
    return Theme.of(Get.context!).extension<CustomIconWidgetWithBackGroundExtendTheme>()!;
  }

  //checkBox theme
  CheckBoxThemeExtend checkBoxTheme(){
    return Theme.of(Get.context!).extension<CheckBoxThemeExtend>()!;
  }

  //text form field theme
  TextFormFieldThemeExtend textFormFieldTheme(){
    final value =  Theme.of(Get.context!).extension<TextFormFieldThemeExtend>()!;
    return value;
  }

  //elevatedButton theme
  ElevatedButtonThemeExtend elevatedButtonTheme(){
    return Theme.of(Get.context!).extension<ElevatedButtonThemeExtend>()!;
  }

  //TextButton theme
  TextButtonThemeExtend textButtonTheme(){
    return Theme.of(Get.context!).extension<TextButtonThemeExtend>()!;
  }
}