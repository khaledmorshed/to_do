import 'package:flutter/material.dart';
import '../../../values/app_colors/all_colors_export.dart';
import '../extend_theme/container_theme_extend.dart';

// Container Light Theme Extension
final containerThemeLightExtension = ContainerThemeExtend(
  containerBackgroundBoarderBoxShadowColorList: const [
    //background, boarder, shadowColor(primary, none, _)--0
    [AppColors.appPrimaryColorLight, AppColors.appPrimaryColorLight, AppColors.appPrimaryColorLight],
    //background, boarder(secondary, none, _)--1
    [AppColors.appSecondaryColorLight, AppColors.appSecondaryColorLight, AppColors.appSecondaryColorLight],
    //background, boarder(white, none, _)--2
    [AppColors.whiteOnly, AppColors.whiteOnly, AppColors.whiteOnly],
    //background, boarder(white, yellow type)--3
    [AppColors.whiteOnly, AppColors.yellow200, Color(0xff000000)],
    //background, boarder(gray type, purple type)--4
    [AppColors.grey400, AppColors.grey400, AppColors.grey400],
    //background, boarder, shadowColor(white, primary shade, black type)--5
    [AppColors.whiteOnly, AppColors.appPrimaryColorLight, Color(0xff000000)],
    //background, boarder(primary shade, none)--6
    [AppColors.appPrimaryColorLight, AppColors.appPrimaryColorLight, AppColors.appPrimaryColorLight],
    //background, boarder, shadowColor(primary shade, none, none)--7
    [AppColors.appPrimaryColorLight, AppColors.appPrimaryColorLight, AppColors.appPrimaryColorLight],
    //background, boarder(white, gray type none)--8
    [AppColors.whiteOnly, AppColors.grey400, Color(0xff000000)],

    //background, boarder(grey, grey)--9
    [Colors.grey, Colors.grey, Colors.grey],
    //background, boarder(white, none)--10
    [AppColors.whiteOnly, Color(0xff008080), Color(0xff000000)],
    //background, boarder(white, none)--11
    [AppColors.whiteOnly, Color(0xff008080), Color(0xff000000)],

    //unused
    [AppColors.whiteOnly, Color(0xff008080), Color(0xff000000)],
  ],
);

// Container Dark Theme Extension
final containerThemeDarkExtension = ContainerThemeExtend(
  containerBackgroundBoarderBoxShadowColorList:  [
    //background, boarder, shadowColor(primary, none, _)--0
    const [Color(0xff0057A3), Color(0xff0057A3), Color(0xffb13737)],
    //background, boarder(secondary, none)--1
    const [Color(0xff0057A3), Color(0xff0057A3), Color(0xffc33434)],
    //background, boarder(white, none)--2
    const [Color(0xff0057A3), Color(0xff0057A3), Color(0xff000000)],
    //background, boarder(white, orange type)--3
    const [Color(0xff0057A3), AppColors.orangeOnly, Color(0xffa83131)],
    //background, boarder(gray type, purple type)--4
    const [Color(0xff0057A3), Color(0xff0057A3), Color(0x44000000)],
    //background, boarder, shadowColor(white, primary, black type)--5
    const [Color(0xff0057A3), Color(0xff0057A3), Color(0xef4acadf)],
    //background, boarder(black type, none)--6
    const [Color(0xff0057A3), Color(0xff0057A3), Color(0x55000000)],
    //background, boarder, shadowColor(white, secondary, black type)--7
    const [Color(0xff0057A3), AppColors.orangeOnly, Color(0xff000000)],
    //background, boarder(secondary with opacity, none)--8
    [AppColors.appSecondaryColorLight.withOpacity(0.12), const Color(0xff806600), const Color(0xff000000)],
    //background, boarder(secondary, none)--9
    const [Colors.grey, Colors.grey, Colors.grey],
    //background, boarder(white, none)--10
    const [AppColors.appSecondaryColorLight, Color(0xff008080), Color(0xff000000)],
    //background, boarder(white, none)--11
    const [AppColors.whiteOnly, Color(0xff008080), Color(0xff000000)],

    //unused
    const [AppColors.whiteOnly, Color(0xff008080), Color(0xff000000)],
  ],
);
