import 'package:flutter/material.dart';

class ElevatedButtonThemeExtend extends ThemeExtension<ElevatedButtonThemeExtend> {
  static const int _numStyles = 4; // Number of button styles
  static const int _numDisabledColors = 4; // Number of disabled colors

  final List<ButtonStyle> elevatedButtonStyles;
  final List<Color> disabledColors;

  const ElevatedButtonThemeExtend({
    required this.elevatedButtonStyles,
    required this.disabledColors,
  })  : assert(elevatedButtonStyles.length == _numStyles, 'elevatedButtonStyles must have $_numStyles items'),
        assert(disabledColors.length == _numDisabledColors, 'disabledColors must have $_numDisabledColors items');

  @override
  ElevatedButtonThemeExtend copyWith({
    List<ButtonStyle>? elevatedButtonStyles,
    List<Color>? disabledColors,
  }) {
    return ElevatedButtonThemeExtend(
      elevatedButtonStyles: elevatedButtonStyles ?? this.elevatedButtonStyles,
      disabledColors: disabledColors ?? this.disabledColors,
    );
  }

  @override
  ElevatedButtonThemeExtend lerp(ThemeExtension<ElevatedButtonThemeExtend>? other, double t) {
    if (other is! ElevatedButtonThemeExtend) return this;

    return ElevatedButtonThemeExtend(
      elevatedButtonStyles: List<ButtonStyle>.generate(
        _numStyles,
            (i) => ButtonStyle.lerp(elevatedButtonStyles[i], other.elevatedButtonStyles[i], t) ?? elevatedButtonStyles[i],
      ),
      disabledColors: List<Color>.generate(
        _numDisabledColors,
            (i) => Color.lerp(disabledColors[i], other.disabledColors[i], t) ?? disabledColors[i],
      ),
    );
  }
}
