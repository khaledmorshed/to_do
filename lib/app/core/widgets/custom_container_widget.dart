import 'package:flutter/material.dart';

import '../base/theme/extend_theme/container_theme_extend.dart';

class CustomContainerWidget extends StatelessWidget {
  ///Which type of container do you want to use?..just mention themIndex(0, 1, etc)

  //background, boarder(primary, none)--0
  //background, boarder(secondary, none)--1
  //background, boarder, shadowColor(white, none, blackType)--2
  //background, boarder(white, yellow type)--3
  //background, boarder(gray type, purple type)--4
  //background, boarder(white, primary)--5
  //background, boarder(black type, none)--6

  final int themeIndex;
  final dynamic child;
  final double? height;
  final double? width;
  final Color? backGroundColor;
  final Color? boarderColor;
  final Color? shadColor;
  final bool isOnlyPadding;
  final bool isOnlyMargin;
  final bool isSymmetricPadding;
  final bool isSymmetricMargin;
  final bool isAllBoarder;
  final bool isOnlyBoarder;
  final bool isTopBoarder;
  final bool isBottomBoarder;
  final bool isLeftBoarder;
  final bool isRightBoarder;
  final double boarderWidth;
  final double offsetDx;
  final double offsetDy;
  final double spreadRadius;
  final double blurRadius;
  final double horizontalPadding;
  final double verticalPadding;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;
  final double horizontalMargin;
  final double verticalMargin;
  final double leftMargin;
  final double rightMargin;
  final double topMargin;
  final double bottomMargin;
  final Color? topBoarderColor;
  final Color? bottomBoarderColor;
  final Color? leftBoarderColor;
  final Color? rightBoarderColor;
  final Color? boxShadowColor;
  final double backGroundColorOpacity;
  final double boarderColorOpacity;
  final double shadowColorOpacity;
  final double boarderRadius;
  final BoxShape shape;
  final double padding;
  final double margin;
  final bool isBoxShadow ;
  final DecorationImage? image ;
  final Alignment alignment ;
  final bool isOnlyBorderRadius;
  final double topLeftBorderRadius;
  final double topRightBorderRadius;
  final double bottomLeftBorderRadius;
  final double bottomRightBorderRadius;
  final bool isAllBoarderRadius ;

  const CustomContainerWidget({
    super.key,
    this.themeIndex = 0,
    this.child,
    this.height,
    this.width,
    this.backGroundColor,
    this.boarderColor,
    this.shadColor,
    this.isSymmetricPadding = false,
    this.isSymmetricMargin = false,
    this.isOnlyPadding = false,
    this.isOnlyMargin = false,
    this.isAllBoarder = false,
    this.isOnlyBoarder = false,
    this.isTopBoarder = false,
    this.isBottomBoarder = false,
    this.isLeftBoarder = false,
    this.isRightBoarder = false,
    this.boarderWidth = 2,
    this.offsetDx = 0.5,
    this.offsetDy = 0.5,
    this.blurRadius = 10,
    this.spreadRadius = 1,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.horizontalMargin = 0,
    this.verticalMargin = 0,
    this.leftMargin = 0,
    this.rightMargin = 0,
    this.topMargin = 0,
    this.bottomMargin = 0,
    this.topBoarderColor,
    this.bottomBoarderColor,
    this.leftBoarderColor,
    this.rightBoarderColor,
    this.boxShadowColor,
    this.boarderColorOpacity = 0.5,
    this.shadowColorOpacity = 0.12,
    this.boarderRadius = 10,
    this.shape = BoxShape.rectangle,
    this.padding = 0,
    this.margin = 0,
    this.backGroundColorOpacity = 1,
    this.isBoxShadow = false,
    this.image,
    this.alignment = Alignment.center,
    this.isOnlyBorderRadius = false,
    this.topLeftBorderRadius = 0,
    this.topRightBorderRadius = 0,
    this.bottomRightBorderRadius = 0,
    this.bottomLeftBorderRadius = 0,
    this.isAllBoarderRadius = false,
  });

  @override
  Widget build(BuildContext context) {
    final containerTheme = Theme.of(context).extension<ContainerThemeExtend>()!;
    final containerBackGroundColorList = containerTheme.containerBackgroundColorList;
    final containerBoarderColorList = containerTheme.containerBorderColorList;
    final containerBoxShadowColorList = containerTheme.containerBoxShadowColorList;

    final Color bgColor = backGroundColor ?? containerBackGroundColorList[themeIndex];
    final Color bdColor = boarderColor ?? containerBoarderColorList[themeIndex];
    final Color shadowColor = boxShadowColor ??  containerBoxShadowColorList[themeIndex];

    return Container(
      height: height,
      width: width,
      padding: isOnlyPadding ? EdgeInsets.only(left: leftPadding, right: rightPadding, top: topPadding, bottom: bottomPadding) : isSymmetricPadding ? EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding) : EdgeInsets.all(padding),
      margin: isOnlyMargin ? EdgeInsets.only(left: leftMargin, right: rightMargin, top: topMargin, bottom: bottomMargin) : isSymmetricMargin ? EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: verticalMargin) : EdgeInsets.all(margin),
      alignment: alignment,
      decoration: BoxDecoration(
        image: image,
        shape: shape,
        color: bgColor.withOpacity(backGroundColorOpacity),
        borderRadius: isOnlyBorderRadius ? BorderRadius.only(topLeft: Radius.circular(topLeftBorderRadius), topRight: Radius.circular(topRightBorderRadius), bottomLeft: Radius.circular(bottomLeftBorderRadius), bottomRight: Radius.circular(bottomRightBorderRadius)) :  isAllBoarderRadius ?  BorderRadius.all(Radius.circular(boarderRadius)) : null,

        border: isOnlyBoarder ? Border(
          bottom: isBottomBoarder ? BorderSide(width: boarderWidth, color: bdColor.withOpacity(boarderColorOpacity)) : BorderSide.none,
          top: isTopBoarder ? BorderSide(width: boarderWidth, color: bdColor.withOpacity(boarderColorOpacity)) : BorderSide.none,
          left: isLeftBoarder ? BorderSide(width: boarderWidth, color: bdColor.withOpacity(boarderColorOpacity)) : BorderSide.none,
          right: isRightBoarder ? BorderSide(width: boarderWidth, color: bdColor.withOpacity(boarderColorOpacity)) : BorderSide.none,
        ) : isAllBoarder ? Border.all(width: boarderWidth, color: bdColor) : null,
        boxShadow: isBoxShadow ?  [
          BoxShadow(
            offset: Offset(offsetDx, offsetDx),
            color: shadowColor.withOpacity(shadowColorOpacity),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          ),
        ] : [],
      ),
      child: child,
    );
  }
}