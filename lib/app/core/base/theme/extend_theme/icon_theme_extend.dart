import 'package:flutter/material.dart';

@immutable
class IconThemeExtend extends ThemeExtension<IconThemeExtend> {
  final List<IconThemeData> iconThemes;

  const IconThemeExtend({
    required this.iconThemes,
  }) : assert(iconThemes.length == 4); // Adjust this length as needed

  @override
  IconThemeExtend copyWith({
    List<IconThemeData>? iconThemes,
  }) {
    return IconThemeExtend(
      iconThemes: iconThemes ?? this.iconThemes,
    );
  }

  @override
  IconThemeExtend lerp(ThemeExtension<IconThemeExtend>? other, double t) {
    if (other is! IconThemeExtend) return this;

    return IconThemeExtend(
      iconThemes: List<IconThemeData>.generate(
        iconThemes.length,
            (index) => IconThemeData.lerp(iconThemes[index], other.iconThemes[index], t) ?? iconThemes[index],
      ),
    );
  }

  IconThemeData getIconTheme(int index) => iconThemes[index];
}
