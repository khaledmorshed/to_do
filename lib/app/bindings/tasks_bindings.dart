import 'package:get/get.dart';
import 'package:to_do/app/data/local/db/sqflite/sqf_lite_db_impl.dart';
import 'package:to_do/app/data/remote/task_remote_data_source_impl.dart';
import 'package:to_do/app/data/repository/tasks/tasks.dart';

class TasksBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Tasks>(
      () => TaskRemoteDataSourceImpl(databaseHelper: SqfLitDbImpl()),
      tag: (Tasks).toString(),
    );
  }
}
