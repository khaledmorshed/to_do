import 'package:flutter/material.dart';

@immutable
class TextThemeExtend extends ThemeExtension<TextThemeExtend> {
  final TextStyle? titleLarge;
  final TextStyle? titleMedium;
  final TextStyle? titleSmall;

  // Colorful text colors
  final Color txtPrimaryColor;
  final Color txtPrimaryColorChangeable;
  final Color txtPrimaryColorFirst;
  final Color txtPrimaryColorSecond;
  final Color txtPrimaryColorThird;

  final Color txtSecondaryColor;
  final Color txtSecondaryColorChangeable;
  final Color txtSecondaryColorFirst;
  final Color txtSecondaryColorSecond;
  final Color txtSecondaryColorThird;

  final Color txtRedColor;
  final Color txtColorFulFirst;
  final Color txtColorFulSecond;
  final Color txtColorFulThird;
  final Color txtColorFulFourth;
  final Color txtColorFulFifth;

  // Non-colorful body and label colors
  final Color txtColorBlack;
  final Color txtColorWhite;
  final Color txtBodyColorLarge;
  final Color txtBodyColorMoreMedium;
  final Color txtBodyColorMedium;
  final Color txtBodyColorLessMedium;
  final Color txtBodyColorSmall;
  final Color txtBodyColorLessSmall;

  final Color txtLabelColorLarge;
  final Color txtLabelColorMoreMedium;
  final Color txtLabelColorMedium;
  final Color txtLabelColorLessMedium;
  final Color txtLabelColorSmall;

  const TextThemeExtend({
    this.titleLarge,
    this.titleMedium,
    this.titleSmall,
    required this.txtPrimaryColor,
    required this.txtPrimaryColorChangeable,
    required this.txtPrimaryColorFirst,
    required this.txtPrimaryColorSecond,
    required this.txtPrimaryColorThird,
    required this.txtColorBlack,
    required this.txtColorWhite,
    required this.txtBodyColorLarge,
    required this.txtBodyColorMoreMedium,
    required this.txtBodyColorMedium,
    required this.txtBodyColorLessMedium,
    required this.txtBodyColorSmall,
    required this.txtBodyColorLessSmall,
    required this.txtSecondaryColor,
    required this.txtSecondaryColorChangeable,
    required this.txtSecondaryColorFirst,
    required this.txtSecondaryColorSecond,
    required this.txtSecondaryColorThird,
    required this.txtRedColor,
    required this.txtColorFulFirst,
    required this.txtColorFulSecond,
    required this.txtColorFulThird,
    required this.txtColorFulFourth,
    required this.txtColorFulFifth,
    required this.txtLabelColorLarge,
    required this.txtLabelColorMoreMedium,
    required this.txtLabelColorMedium,
    required this.txtLabelColorLessMedium,
    required this.txtLabelColorSmall,
  });

  @override
  TextThemeExtend copyWith({
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    Color? txtPrimaryColor,
    Color? txtPrimaryColorChangeable,
    Color? txtPrimaryColorFirst,
    Color? txtPrimaryColorSecond,
    Color? txtPrimaryColorThird,
    Color? txtColorBlack,
    Color? txtColorWhite,
    Color? txtBodyColorLarge,
    Color? txtBodyColorMoreMedium,
    Color? txtBodyColorMedium,
    Color? txtBodyColorLessMedium,
    Color? txtBodyColorSmall,
    Color? txtBodyColorLessSmall,
    Color? txtSecondaryColor,
    Color? txtSecondaryColorChangeable,
    Color? txtSecondaryColorFirst,
    Color? txtSecondaryColorSecond,
    Color? txtSecondaryColorThird,
    Color? txtRedColor,
    Color? txtColorFulFirst,
    Color? txtColorFulSecond,
    Color? txtColorFulThird,
    Color? txtColorFulFourth,
    Color? txtColorFulFifth,
    Color? txtLabelColorLarge,
    Color? txtLabelColorMoreMedium,
    Color? txtLabelColorMedium,
    Color? txtLabelColorLessMedium,
    Color? txtLabelColorSmall,
  }) {
    return TextThemeExtend(
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      txtPrimaryColor: txtPrimaryColor ?? this.txtPrimaryColor,
      txtPrimaryColorChangeable: txtPrimaryColorChangeable ?? this.txtPrimaryColorChangeable,
      txtPrimaryColorFirst: txtPrimaryColorFirst ?? this.txtPrimaryColorFirst,
      txtPrimaryColorSecond: txtPrimaryColorSecond ?? this.txtPrimaryColorSecond,
      txtPrimaryColorThird: txtPrimaryColorThird ?? this.txtPrimaryColorThird,
      txtColorBlack: txtColorBlack ?? this.txtColorBlack,
      txtColorWhite: txtColorWhite ?? this.txtColorWhite,
      txtBodyColorLarge: txtBodyColorLarge ?? this.txtBodyColorLarge,
      txtBodyColorMoreMedium: txtBodyColorMoreMedium ?? this.txtBodyColorMoreMedium,
      txtBodyColorMedium: txtBodyColorMedium ?? this.txtBodyColorMedium,
      txtBodyColorLessMedium: txtBodyColorLessMedium ?? this.txtBodyColorLessMedium,
      txtBodyColorSmall: txtBodyColorSmall ?? this.txtBodyColorSmall,
      txtBodyColorLessSmall: txtBodyColorLessSmall ?? this.txtBodyColorLessSmall,
      txtSecondaryColor: txtSecondaryColor ?? this.txtSecondaryColor,
      txtSecondaryColorChangeable: txtSecondaryColorChangeable ?? this.txtSecondaryColorChangeable,
      txtSecondaryColorFirst: txtSecondaryColorFirst ?? this.txtSecondaryColorFirst,
      txtSecondaryColorSecond: txtSecondaryColorSecond ?? this.txtSecondaryColorSecond,
      txtSecondaryColorThird: txtSecondaryColorThird ?? this.txtSecondaryColorThird,
      txtRedColor: txtRedColor ?? this.txtRedColor,
      txtColorFulFirst: txtColorFulFirst ?? this.txtColorFulFirst,
      txtColorFulSecond: txtColorFulSecond ?? this.txtColorFulSecond,
      txtColorFulThird: txtColorFulThird ?? this.txtColorFulThird,
      txtColorFulFourth: txtColorFulFourth ?? this.txtColorFulFourth,
      txtColorFulFifth: txtColorFulFifth ?? this.txtColorFulFifth,
      txtLabelColorLarge: txtLabelColorLarge ?? this.txtLabelColorLarge,
      txtLabelColorMoreMedium: txtLabelColorMoreMedium ?? this.txtLabelColorMoreMedium,
      txtLabelColorMedium: txtLabelColorMedium ?? this.txtLabelColorMedium,
      txtLabelColorLessMedium: txtLabelColorLessMedium ?? this.txtLabelColorLessMedium,
      txtLabelColorSmall: txtLabelColorSmall ?? this.txtLabelColorSmall,
    );
  }

  @override
  TextThemeExtend lerp(ThemeExtension<TextThemeExtend>? other, double t) {
    if (other is! TextThemeExtend) return this;

    return TextThemeExtend(
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t),
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t),
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t),
      txtPrimaryColor: Color.lerp(txtPrimaryColor, other.txtPrimaryColor, t)!,
      txtPrimaryColorFirst: Color.lerp(txtPrimaryColorFirst, other.txtPrimaryColorFirst, t)!,
      txtPrimaryColorSecond: Color.lerp(txtPrimaryColorSecond, other.txtPrimaryColorSecond, t)!,
      txtPrimaryColorThird: Color.lerp(txtPrimaryColorThird, other.txtPrimaryColorThird, t)!,
      txtBodyColorLarge: Color.lerp(txtBodyColorLarge, other.txtBodyColorLarge, t)!,
      txtColorWhite: Color.lerp(txtColorWhite, other.txtColorWhite, t)!,
      txtColorBlack: Color.lerp(txtColorBlack, other.txtColorBlack, t)!,
      txtBodyColorMoreMedium: Color.lerp(txtBodyColorMoreMedium, other.txtBodyColorMoreMedium, t)!,
      txtBodyColorMedium: Color.lerp(txtBodyColorMedium, other.txtBodyColorMedium, t)!,
      txtBodyColorLessMedium: Color.lerp(txtBodyColorLessMedium, other.txtBodyColorLessMedium, t)!,
      txtBodyColorSmall: Color.lerp(txtBodyColorSmall, other.txtBodyColorSmall, t)!,
      txtBodyColorLessSmall: Color.lerp(txtBodyColorLessSmall, other.txtBodyColorLessSmall, t)!,
      txtSecondaryColor: Color.lerp(txtSecondaryColor, other.txtSecondaryColor, t)!,
      txtSecondaryColorFirst: Color.lerp(txtSecondaryColorFirst, other.txtSecondaryColorFirst, t)!,
      txtSecondaryColorSecond: Color.lerp(txtSecondaryColorSecond, other.txtSecondaryColorSecond, t)!,
      txtSecondaryColorThird: Color.lerp(txtSecondaryColorThird, other.txtSecondaryColorThird, t)!,
      txtRedColor: Color.lerp(txtRedColor, other.txtRedColor, t)!,
      txtColorFulFirst: Color.lerp(txtColorFulFirst, other.txtColorFulFirst, t)!,
      txtColorFulSecond: Color.lerp(txtColorFulSecond, other.txtColorFulSecond, t)!,
      txtColorFulThird: Color.lerp(txtColorFulThird, other.txtColorFulThird, t)!,
      txtColorFulFourth: Color.lerp(txtColorFulFourth, other.txtColorFulFourth, t)!,
      txtColorFulFifth: Color.lerp(txtColorFulFifth, other.txtColorFulFifth, t)!,
      txtLabelColorLarge: Color.lerp(txtLabelColorLarge, other.txtLabelColorLarge, t)!,
      txtLabelColorMoreMedium: Color.lerp(txtLabelColorMoreMedium, other.txtLabelColorMoreMedium, t)!,
      txtLabelColorMedium: Color.lerp(txtLabelColorMedium, other.txtLabelColorMedium, t)!,
      txtLabelColorLessMedium: Color.lerp(txtLabelColorLessMedium, other.txtLabelColorLessMedium, t)!,
      txtLabelColorSmall: Color.lerp(txtLabelColorSmall, other.txtLabelColorSmall, t)!,
      txtPrimaryColorChangeable: Color.lerp(txtPrimaryColorChangeable, other.txtPrimaryColorChangeable, t)!,
      txtSecondaryColorChangeable: Color.lerp(txtSecondaryColorChangeable, other.txtSecondaryColorChangeable, t)!,
    );
  }
}
