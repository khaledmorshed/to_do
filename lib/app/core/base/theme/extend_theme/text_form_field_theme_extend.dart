import 'package:flutter/material.dart';

@immutable
class TextFormFieldThemeExtend extends ThemeExtension<TextFormFieldThemeExtend> {
  final List<InputDecorationTheme?> inputDecorationThemes;
  final List<TextStyle?> textStyles;

  const TextFormFieldThemeExtend({
    required this.inputDecorationThemes,
    required this.textStyles,
  })  : assert(inputDecorationThemes.length == 2),
        assert(textStyles.length == 2);

  @override
  TextFormFieldThemeExtend copyWith({
    List<InputDecorationTheme?>? inputDecorationThemes,
    List<TextStyle?>? textStyles,
  }) {
    return TextFormFieldThemeExtend(
      inputDecorationThemes: inputDecorationThemes ?? this.inputDecorationThemes,
      textStyles: textStyles ?? this.textStyles,
    );
  }

  @override
  TextFormFieldThemeExtend lerp(ThemeExtension<TextFormFieldThemeExtend>? other, double t) {
    if (other is! TextFormFieldThemeExtend) return this;

    return TextFormFieldThemeExtend(
      inputDecorationThemes: List.generate(
        inputDecorationThemes.length,
            (index) => _lerpInputDecorationTheme(inputDecorationThemes[index], other.inputDecorationThemes[index], t),
      ),
      textStyles: List.generate(
        textStyles.length,
            (index) => TextStyle.lerp(textStyles[index], other.textStyles[index], t),
      ),
    );
  }

  InputDecorationTheme? _lerpInputDecorationTheme(
      InputDecorationTheme? a, InputDecorationTheme? b, double t) {
    if (a == null && b == null) return null;

    return InputDecorationTheme(
      border: t < 0.5 ? a?.border : b?.border,
      enabledBorder: _lerpOutlineInputBorder(a?.enabledBorder as OutlineInputBorder?, b?.enabledBorder as OutlineInputBorder?, t),
      focusedBorder: _lerpOutlineInputBorder(a?.focusedBorder as OutlineInputBorder?, b?.focusedBorder as OutlineInputBorder?, t),
      errorBorder: _lerpOutlineInputBorder(a?.errorBorder as OutlineInputBorder?, b?.errorBorder as OutlineInputBorder?, t),
      disabledBorder: _lerpOutlineInputBorder(a?.disabledBorder as OutlineInputBorder?, b?.disabledBorder as OutlineInputBorder?, t),
      focusedErrorBorder: _lerpOutlineInputBorder(a?.focusedErrorBorder as OutlineInputBorder?, b?.focusedErrorBorder as OutlineInputBorder?, t),
      labelStyle: TextStyle.lerp(a?.labelStyle, b?.labelStyle, t),
      hintStyle: TextStyle.lerp(a?.hintStyle, b?.hintStyle, t),
      errorStyle: TextStyle.lerp(a?.errorStyle, b?.errorStyle, t),
      fillColor: Color.lerp(a?.fillColor, b?.fillColor, t),
      focusColor: Color.lerp(a?.focusColor, b?.focusColor, t),
      hoverColor: Color.lerp(a?.hoverColor, b?.hoverColor, t),
      floatingLabelStyle: TextStyle.lerp(a?.floatingLabelStyle, b?.floatingLabelStyle, t),
      suffixIconColor: Color.lerp(a?.suffixIconColor, b?.suffixIconColor, t),
      prefixIconColor: Color.lerp(a?.prefixIconColor, b?.prefixIconColor, t),
    );
  }

  static OutlineInputBorder? _lerpOutlineInputBorder(
      OutlineInputBorder? a, OutlineInputBorder? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return OutlineInputBorder(
      borderRadius: BorderRadius.lerp(a.borderRadius, b.borderRadius, t)!,
      borderSide: BorderSide.lerp(a.borderSide, b.borderSide, t),
    );
  }

  InputDecorationTheme? getInputDecorationTheme(int index) => inputDecorationThemes[index];
  TextStyle? getTextStyle(int index) => textStyles[index];
}
