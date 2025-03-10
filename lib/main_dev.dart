import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do/app/data/local/preference/preference_manager.dart';
import 'package:to_do/flavors/build_config.dart';
import 'package:to_do/flavors/env_config.dart';
import 'package:to_do/flavors/environment.dart';

import 'app/my_app.dart';

void main()async {

  EnvConfig devConfig = EnvConfig(
    appName: "To-Do",
    baseUrl: "https://",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.development,
    envConfig: devConfig,
  );

  await GetStorage.init(PreferenceManager.preferenceDataBaseName);

  runApp(MyApp());
}
