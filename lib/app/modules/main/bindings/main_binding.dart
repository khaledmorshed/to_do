import 'package:get/get.dart';
import 'package:to_do/app/modules/create_task/controllers/create_task_controller.dart';

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

    Get.lazyPut<CreateTaskController>(
          () => CreateTaskController(),
      fenix: true,
    );

    // Get.lazyPut<CreateTaskController>(
    //   () => CreateTaskController(),
    // );

    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
  }
}
