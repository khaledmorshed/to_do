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

  @override
  String toString() {
    return 'TaskResponseModel{totalTasks: $totalTasks, taskList: $taskList}';
  }

}

class TaskResponseData {
  String? taskName;
  String? taskDescription;
  String? startDate;
  String? endDate;
  String? status;

  TaskResponseData({
    this.taskName = "",
    this.taskDescription = "",
    this.startDate = "",
    this.endDate = "",
    this.status = "",
  });

  TaskResponseData.fromJson(dynamic json) {
    taskName = json['task_name'];
    taskDescription = json['task_description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
  }

  @override
  String toString() {
    return 'TaskResponseData{taskName: $taskName, taskDescription: $taskDescription, startDate: $startDate, endDate: $endDate, status: $status}';
  }

}
