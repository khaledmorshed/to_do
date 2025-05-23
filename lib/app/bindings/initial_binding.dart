import 'package:get/get.dart';
import 'package:to_do/app/bindings/preference_manager_bindings.dart';
import 'package:to_do/app/bindings/sqflite_db_bindings.dart';
import 'package:to_do/app/bindings/tasks_bindings.dart';
import 'package:to_do/app/data/remote/task_remote_data_source_impl.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    TasksBindings().dependencies();
    PreferenceManagerBindings().dependencies();
    SqfliteDbBindings().dependencies();
  }
}
