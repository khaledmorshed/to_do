import 'package:flutter/material.dart';

@immutable
class CustomIconWidgetWithBackGroundExtendTheme extends ThemeExtension<CustomIconWidgetWithBackGroundExtendTheme> {
  final List<Color> backgroundColors;

  const CustomIconWidgetWithBackGroundExtendTheme({
    required this.backgroundColors,
  }) : assert(backgroundColors.length == 4);

  @override
  CustomIconWidgetWithBackGroundExtendTheme copyWith({
    List<Color>? backgroundColors,
  }) {
    return CustomIconWidgetWithBackGroundExtendTheme(
      backgroundColors: backgroundColors ?? this.backgroundColors,
    );
  }

  @override
  CustomIconWidgetWithBackGroundExtendTheme lerp(ThemeExtension<CustomIconWidgetWithBackGroundExtendTheme>? other, double t) {
    if (other is! CustomIconWidgetWithBackGroundExtendTheme) return this;

    return CustomIconWidgetWithBackGroundExtendTheme(
      backgroundColors: List<Color>.generate(
        backgroundColors.length,
            (index) => Color.lerp(backgroundColors[index], other.backgroundColors[index], t)!,
      ),
    );
  }

  Color getColor(int index) => backgroundColors[index];
}
