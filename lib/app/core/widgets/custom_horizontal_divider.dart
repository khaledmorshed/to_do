import 'package:flutter/material.dart';

import '../values/app_colors/app_colors.dart';

class CustomHorizontalDivider extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  const CustomHorizontalDivider({
    this.width = 60,
    this.height = 1.2,
    this.color = AppColors.grey400,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}
