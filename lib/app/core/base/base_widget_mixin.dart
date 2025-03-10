import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../l10n/app_localizations.dart';
import '/flavors/build_config.dart';

mixin BaseWidgetMixin on StatelessWidget {
  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;
  final Logger logger = BuildConfig.instance.envConfig.logger;

  late TextTheme _textTheme;

  TextTheme get textTheme => _textTheme;

  late ThemeData _theme;

  ThemeData get theme => _theme;

  @override
  Widget build(BuildContext context) {
    _textTheme = context.textTheme;
    _theme = context.theme;

    return Container(
      child: body(context),
    );
  }

  Widget body(BuildContext context);
}
