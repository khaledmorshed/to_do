import 'package:flutter/material.dart';

class TextButtonThemeExtend extends ThemeExtension<TextButtonThemeExtend> {
  static const int _numStyles = 4; // Number of button styles
  static const int _numDisabledColors = 4; // Number of disabled colors

  final List<ButtonStyle> textButtonStyles;
  final List<Color> disabledColors;

  const TextButtonThemeExtend({
    required this.textButtonStyles,
    required this.disabledColors,
  })  : assert(textButtonStyles.length == _numStyles, 'textButtonStyles must have $_numStyles items'),
        assert(disabledColors.length == _numDisabledColors, 'disabledColors must have $_numDisabledColors items');

  @override
  TextButtonThemeExtend copyWith({
    List<ButtonStyle>? textButtonStyles,
    List<Color>? disabledColors,
  }) {
    return TextButtonThemeExtend(
      textButtonStyles: textButtonStyles ?? this.textButtonStyles,
      disabledColors: disabledColors ?? this.disabledColors,
    );
  }

  @override
  TextButtonThemeExtend lerp(ThemeExtension<TextButtonThemeExtend>? other, double t) {
    if (other is! TextButtonThemeExtend) return this;

    return TextButtonThemeExtend(
      textButtonStyles: List<ButtonStyle>.generate(
        _numStyles,
            (i) => ButtonStyle.lerp(textButtonStyles[i], other.textButtonStyles[i], t) ?? textButtonStyles[i], // Fallback to original style if lerp returns null
      ),
      disabledColors: List<Color>.generate(
        _numDisabledColors,
            (i) => Color.lerp(disabledColors[i], other.disabledColors[i], t) ?? disabledColors[i], // Fallback to original color if lerp returns null
      ),
    );
  }
}