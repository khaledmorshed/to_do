import 'package:to_do/app/core/model/task_models/create_task_data_param.dart';
import 'package:to_do/app/core/model/task_models/task_query_param.dart';
import 'package:to_do/app/data/model/task_models/task_response_model.dart';

abstract class Tasks {
  Future<TaskResponseModel> getTaskList(TaskQueryParam queryParam, {bool fetchingFromLocal = false});

  Future<dynamic> createTask(CreateTaskDataParam data, {bool storeDataInLocal = false});

}
