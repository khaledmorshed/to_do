import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../settings/controllers/settings_controller.dart';
import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
      fenix: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
  }
}
