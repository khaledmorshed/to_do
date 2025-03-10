import 'package:flutter/material.dart';
import 'package:to_do/app/core/values/app_colors/all_colors_export.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final Color? color;
  const CustomCircularProgressIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? AppColors.whiteOnly,
        strokeWidth: 2,
      ),
    );
  }
}
