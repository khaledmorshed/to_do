import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/values/app_languages.dart';
import 'package:to_do/app/data/local/preference/preference_manager.dart';
import 'package:to_do/app/data/local/preference/preference_manager_impl.dart';
import 'package:to_do/app/routes/app_pages.dart';
import 'package:to_do/flavors/build_config.dart';
import 'package:to_do/flavors/env_config.dart';
import '../l10n/app_localizations.dart';
import 'bindings/initial_binding.dart';
import 'core/base/theme/app_theme.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  bool _didLanguageSet = false;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.envConfig;
  final PreferenceManager _preferenceManager = PreferenceManagerImpl();


  @override
  Widget build(BuildContext context) {
    _localizeApp();
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: ((context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: _envConfig.appName,
          initialRoute: AppPages.INITIAL,
          initialBinding: InitialBinding(),
          getPages: AppPages.routes,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          theme:  AppThemeData().getTheme(),
          supportedLocales: _getSupportedLocal(),
        );
      })
    );
  }

  _localizeApp(){
    String appLanguage = _preferenceManager.getString(
      PreferenceManager.language,
      defaultValue: Platform.localeName
    );
    if(appLanguage.contains(AppLanguages.en.name)){
      appLanguage = AppLanguages.en.name;
    }
    if(!widget._didLanguageSet){
      _envConfig.logger.i("AppLanguage: $appLanguage");
      WidgetsBinding.instance.addPostFrameCallback((_){
        widget._didLanguageSet = true;
        Get.updateLocale(Locale(appLanguage));
      });
    }
  }

  List<Locale> _getSupportedLocal(){
    return AppLanguages.values.map((language)=>Locale(language.name)).toList();
  }

}
