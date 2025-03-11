import 'package:get/get.dart';
import 'package:to_do/app/data/local/db/sqflite/sqf_lite_db_impl.dart';
import 'package:to_do/app/data/local/db/sqflite/sqflite_db_base.dart';

import '/app/data/local/preference/preference_manager.dart';
import '/app/data/local/preference/preference_manager_impl.dart';

class SqfliteDbBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SqfLitDbBase>(
      () => SqfLitDbImpl(),
      fenix: true,
    );
  }
}
