import 'package:flutter/material.dart';

class DividerThemeExtend extends ThemeExtension<DividerThemeExtend> {
  final Color? dividerPrimary;
  final Color? dividerSecondary;
  final Color? dividerFirst;
  final Color? dividerSecond;

  const DividerThemeExtend({
    this.dividerPrimary,
    this.dividerSecondary,
    this.dividerFirst,
    this.dividerSecond,
  });

  @override
  DividerThemeExtend copyWith({
    Color? dividerPrimary,
    Color? dividerSecondary,
    Color? dividerFirst,
    Color? dividerSecond,
  }) {
    return DividerThemeExtend(
      dividerPrimary: dividerPrimary ?? this.dividerPrimary,
      dividerSecondary: dividerSecondary ?? this.dividerSecondary,
      dividerFirst: dividerFirst ?? this.dividerFirst,
      dividerSecond: dividerSecond ?? this.dividerSecond,
    );
  }

  @override
  DividerThemeExtend lerp(ThemeExtension<DividerThemeExtend>? other, double t) {
    if (other is! DividerThemeExtend) return this;

    return DividerThemeExtend(
      dividerPrimary: Color.lerp(dividerPrimary, other.dividerPrimary, t),
      dividerSecondary: Color.lerp(dividerSecondary, other.dividerSecondary, t),
      dividerFirst: Color.lerp(dividerFirst, other.dividerFirst, t),
      dividerSecond: Color.lerp(dividerSecond, other.dividerSecond, t),
    );
  }
}
