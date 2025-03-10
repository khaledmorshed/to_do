import 'package:flutter/material.dart';

@immutable
class ContainerThemeExtend extends ThemeExtension<ContainerThemeExtend> {
  final List<List<Color>> containerBackgroundBoarderBoxShadowColorList;

   ContainerThemeExtend({
    required this.containerBackgroundBoarderBoxShadowColorList,
  }) : assert(containerBackgroundBoarderBoxShadowColorList.length == 13),
        assert(containerBackgroundBoarderBoxShadowColorList.every((list) => list.length == 3));

  List<Color> get containerBackgroundColorList => containerBackgroundBoarderBoxShadowColorList.map((list) => list[0]).toList();
  List<Color> get containerBorderColorList => containerBackgroundBoarderBoxShadowColorList.map((list) => list[1]).toList();
  List<Color> get containerBoxShadowColorList => containerBackgroundBoarderBoxShadowColorList.map((list) => list[2]).toList();

  @override
  ContainerThemeExtend copyWith({
    List<List<Color>>? containerBackgroundBoarderBoxShadowColorList,
  }) {
    return ContainerThemeExtend(
      containerBackgroundBoarderBoxShadowColorList: containerBackgroundBoarderBoxShadowColorList ?? this.containerBackgroundBoarderBoxShadowColorList,
    );
  }

  @override
  ContainerThemeExtend lerp(ThemeExtension<ContainerThemeExtend>? other, double t) {
    if (other is! ContainerThemeExtend) return this;

    return ContainerThemeExtend(
      containerBackgroundBoarderBoxShadowColorList: List<List<Color>>.generate(
        containerBackgroundBoarderBoxShadowColorList.length,
            (index) => [
          Color.lerp(containerBackgroundBoarderBoxShadowColorList[index][0], other.containerBackgroundBoarderBoxShadowColorList[index][0], t)!,
          Color.lerp(containerBackgroundBoarderBoxShadowColorList[index][1], other.containerBackgroundBoarderBoxShadowColorList[index][1], t)!,
          Color.lerp(containerBackgroundBoarderBoxShadowColorList[index][2], other.containerBackgroundBoarderBoxShadowColorList[index][2], t)!,
        ],
      ),
    );
  }
}
