import 'package:flutter/material.dart';

@immutable
class CustomRectangleIconWidgetWithBackGroundExtendTheme extends ThemeExtension<CustomRectangleIconWidgetWithBackGroundExtendTheme> {
  final List<Color> backgroundColors;

  const CustomRectangleIconWidgetWithBackGroundExtendTheme({
    required this.backgroundColors,
  }) : assert(backgroundColors.length == 3);

  @override
  CustomRectangleIconWidgetWithBackGroundExtendTheme copyWith({
    List<Color>? backgroundColors,
  }) {
    return CustomRectangleIconWidgetWithBackGroundExtendTheme(
      backgroundColors: backgroundColors ?? this.backgroundColors,
    );
  }

  @override
  CustomRectangleIconWidgetWithBackGroundExtendTheme lerp(ThemeExtension<CustomRectangleIconWidgetWithBackGroundExtendTheme>? other, double t) {
    if (other is! CustomRectangleIconWidgetWithBackGroundExtendTheme) return this;

    return CustomRectangleIconWidgetWithBackGroundExtendTheme(
      backgroundColors: List<Color>.generate(
        backgroundColors.length,
            (index) => Color.lerp(backgroundColors[index], other.backgroundColors[index], t)!,
      ),
    );
  }

  Color getColor(int index) => backgroundColors[index];
}
