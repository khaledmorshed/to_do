class TableInfo{
  static const String taskList = "task_list";
  static const String taskListTableQuery = "CREATE TABLE IF NOT EXISTS $taskList (id INTEGER PRIMARY KEY, task_name TEXT, task_description TEXT, start_date TEXT, end_date TEXT, status TEXT, deleted_at TIMESTAMP DEFAULT NULL)";
}