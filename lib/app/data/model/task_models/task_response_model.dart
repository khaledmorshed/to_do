class TaskResponseModel {
  int? totalTasks;
  List<TaskResponseData>? taskList;

  TaskResponseModel({
    this.totalTasks,
    this.taskList,
  });

  TaskResponseModel.fromJson(dynamic json) {
    totalTasks = json['total_tasks'];
    if (json['task_list'] != null) {
      taskList = [];
      json['task_list'].forEach((v) {
        taskList?.add(TaskResponseData.fromJson(v));
      });
    }
  }
}

class TaskResponseData {
  String? taskName;
  String? taskDescription;
  String? startDate;
  String? endDate;
  String? status;
  String? updatedAt;

  TaskResponseData({
    this.taskName = "",
    this.taskDescription = "",
    this.startDate = "",
    this.endDate = "",
    this.status = "",
    this.updatedAt = "",
  });

  TaskResponseData.fromJson(dynamic json) {
    taskName = json['task_name'];
    taskDescription = json['task_description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    updatedAt = json['updated_at'];
  }

}
