import 'package:to_do/app/core/model/task_models/task_query_param.dart';
import 'package:to_do/app/data/model/task_models/task_response_model.dart';

abstract class TaskRepository {
  Future<TaskResponseModel> getTaskList(TaskQueryParam queryParam);

  //one more
}
