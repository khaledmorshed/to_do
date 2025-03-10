import 'package:to_do/flavors/env_config.dart';
import 'package:to_do/flavors/environment.dart';

class BuildConfig{
  late final Environment environment;
    late final EnvConfig envConfig;
  bool _lock = false;

  static final BuildConfig instance = BuildConfig._internal();

  BuildConfig._internal();

  factory BuildConfig.instantiate({
    required Environment envType,
    required EnvConfig envConfig,
  }){
    if(instance._lock) return instance;

    instance.environment = envType;
    instance.envConfig = envConfig;
    instance._lock = true;

    return instance;
  }

}