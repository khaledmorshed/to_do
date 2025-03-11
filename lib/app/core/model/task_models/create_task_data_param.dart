import '/app/core/values/app_values.dart';

class CreateTaskDataParam {
  String taskName;
  String taskDescription;
  String startDate;
  String endDate;
  String status;
  String updatedAt;

  CreateTaskDataParam({
    this.taskName = "",
    this.taskDescription = "",
    this.startDate = "",
    this.endDate = "",
    this.status = "Todo",
    this.updatedAt = "",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['task_name'] = taskName;
    data['task_description'] = taskDescription;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status'] = status;
    return data;
  }
}
