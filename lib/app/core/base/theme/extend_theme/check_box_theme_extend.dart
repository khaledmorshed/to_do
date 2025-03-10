import 'package:flutter/material.dart';

@immutable
class CheckBoxThemeExtend extends ThemeExtension<CheckBoxThemeExtend> {
  final List<List<Color>> activeCheckBorderColorList;

  CheckBoxThemeExtend({
    required this.activeCheckBorderColorList,
  })  : assert(activeCheckBorderColorList.length == 3),
        assert(activeCheckBorderColorList.every((list) => list.length == 3));

  // Getters to extract individual color lists
  List<Color> get activeColorList => activeCheckBorderColorList.map((list) => list[0]).toList();
  List<Color> get checkColorList => activeCheckBorderColorList.map((list) => list[1]).toList();
  List<Color> get borderColorList => activeCheckBorderColorList.map((list) => list[2]).toList();

  @override
  CheckBoxThemeExtend copyWith({
    List<List<Color>>? activeCheckBorderColorList,
  }) {
    return CheckBoxThemeExtend(
      activeCheckBorderColorList: activeCheckBorderColorList ?? this.activeCheckBorderColorList,
    );
  }

  @override
  CheckBoxThemeExtend lerp(ThemeExtension<CheckBoxThemeExtend>? other, double t) {
    if (other is! CheckBoxThemeExtend) return this;

    return CheckBoxThemeExtend(
      activeCheckBorderColorList: List<List<Color>>.generate(
        activeCheckBorderColorList.length,
            (index) => [
          Color.lerp(activeCheckBorderColorList[index][0], other.activeCheckBorderColorList[index][0], t)!,
          Color.lerp(activeCheckBorderColorList[index][1], other.activeCheckBorderColorList[index][1], t)!,
          Color.lerp(activeCheckBorderColorList[index][2], other.activeCheckBorderColorList[index][2], t)!,
        ],
      ),
    );
  }
}
