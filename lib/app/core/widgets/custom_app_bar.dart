import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Default appbar customized with the design of our app
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitleText;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;

  CustomAppBar({
    Key? key,
    required this.appBarTitleText,
    this.actions,
    this.isBackButtonEnabled = true,
  }) : super(key: key);

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;

    return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      elevation: 2.0,
      automaticallyImplyLeading: isBackButtonEnabled,
      actions: actions,
    //  iconTheme: theme.appBarTheme.iconTheme,
      title: Text(
        appBarTitleText,
        style: theme.appBarTheme.titleTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
