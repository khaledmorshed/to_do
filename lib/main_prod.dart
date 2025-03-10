import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app/data/local/preference/preference_manager.dart';
import 'app/my_app.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';

void main()async {
  EnvConfig devConfig = EnvConfig(
    appName: "Flutter GetX MVVM",
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

