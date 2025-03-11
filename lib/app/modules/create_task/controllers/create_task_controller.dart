import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/model/task_models/create_task_data_param.dart';
import '../../../data/repository/tasks/tasks.dart';
import '/app/core/base/base_controller.dart';
import '/app/core/base/paging_controller.dart';

class CreateTaskController extends BaseController {
  final Tasks _tasks =
      Get.find(tag: (Tasks).toString());

  final taskNameController = TextEditingController();
  final taskDescriptionController = TextEditingController();
  final startDate = DateTime.now();
  final endDate = DateTime.now();
  var isTaskCreate = false.obs;

  final pagingController = PagingController<dynamic>();

  void createTask() {
    if (!pagingController.canSubmitAgain()) return;

    pagingController.submitButtonLoading = true;

    var dataParam = CreateTaskDataParam(
      taskName: taskNameController.text,
      taskDescription: taskDescriptionController.text,
      startDate: startDate.toString(),
      endDate: endDate.toString(),
      status: "Todo"
    );

    var createTaskResponse = _tasks.createTask(dataParam, storeDataInLocal: true);

    callDataService(
      createTaskResponse,
      onSuccess: _handleCreateTaskResponseSuccess,
    );

    pagingController.submitButtonLoading = false;
  }

  void _handleCreateTaskResponseSuccess(dynamic response) {
    isTaskCreate = response;
  }

}
