class TaskUIModel {
  String taskName;
  String taskDescription;
  String startDate;
  String endDate;
  String status;
  String updatedAt;

  TaskUIModel({
    this.taskName = "",
    this.taskDescription = "",
    this.startDate = "",
    this.endDate = "",
    this.status = "",
    this.updatedAt = "",
  });

  @override
  String toString() {
    return 'TaskUIModel{taskName: $taskName, taskDescription: $taskDescription, startDate: $startDate, endDate: $endDate, status: $status, updatedAt: $updatedAt}';
  }
}
