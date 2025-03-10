import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../base/theme/get_all_theme.dart';

class CustomCheckBox extends StatelessWidget {
  final int themeIndex;
  final bool value;
  final Function? onChanged;
  const CustomCheckBox({
    this.themeIndex = 0,
    this.value = false,
    required this.onChanged,
    super.key});

  @override
  Widget build(BuildContext context) {
    final theme = GetTheme().checkBoxTheme();
    final Color activeColor = theme.activeColorList[themeIndex];
    final Color checkColor = theme.checkColorList[themeIndex];
    final Color boarderColor =  theme.borderColorList[themeIndex];
    return SizedBox(
      height: 40.h,
      child: Checkbox(
        activeColor: activeColor,
        checkColor: checkColor,
        //splashRadius: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        side: BorderSide(
          width: 1.2,
          color: boarderColor,
        ),
        value: value,
        onChanged:  onChanged != null ? (bool? flag) => onChanged!(flag) : null,
      ),
    );
  }
}
