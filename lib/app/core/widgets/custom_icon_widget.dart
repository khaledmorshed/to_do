import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../base/theme/get_all_theme.dart';

class CustomIconWidget extends StatelessWidget {
  //themeIndex--0(PrimaryColor)
  //themeIndex--1(black)
  //themeIndex--2(white)
  final int themeIndex;
  final dynamic child;
  final double size;
  final Color? color;
  final double? height;
  final double? width;
  final double? scale;
  final bool? isSvgString;

  const CustomIconWidget({
    this.themeIndex = 0,
    required this.child,
    this.size = 15,
    this.color,
    this.height,
    this.width,
    this.scale,
    this.isSvgString = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorList = GetTheme().iconTheme().iconThemes;
    final iconColor = color ?? colorList[themeIndex].color!;
    return child is IconData ? Icon(
      child,
      size: size,
      color: iconColor,
    ) : child is String && isSvgString == false ? Image.asset(child, height: height, width: width, color: iconColor, scale: scale,)
        :  SvgPicture.asset(child, height: height, width: width, colorFilter: ColorFilter.mode(
      iconColor,
      BlendMode.srcIn, // A blending mode that works well for coloring SVGs
    ),);
  }
}