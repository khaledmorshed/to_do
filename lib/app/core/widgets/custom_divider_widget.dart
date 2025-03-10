import 'package:flutter/material.dart';


class CustomDividerWidget extends StatelessWidget {
  final Color? color;
  final double thickness;

  const CustomDividerWidget({
    super.key,
    this.color,
    this.thickness = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      color: color,
    );
  }
}
