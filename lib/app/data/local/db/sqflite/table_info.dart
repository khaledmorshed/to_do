class TableInfo{
  static const String taskList = "task_list";
  static const String taskListTableQuery = "CREATE TABLE IF NOT EXISTS $taskList (id TEXT PRIMARY KEY ON CONFLICT IGNORE, name TEXT, full_name TEXT, login TEXT, avatar_url TEXT, description TEXT, stargazers_count TEXT, watchers_count TEXT, forks TEXT, updated_at TEXT, deleted_at TIMESTAMP DEFAULT NULL)";
}