import 'package:sqflite/sqflite.dart';

abstract class SqfLitDbBase {

  String get databaseName;

  Future<Database> initDb({String databaseName = "task_db"});

  Future<void> createDb(Database db, int version);

  Future<void> upgradeDb(Database db, int oldVersion, int newVersion);

  Future<void> createAnewTableWithoutBuildInFunction(Database db, String table);

  Future<int> insertDataInTableWithoutBuildINFunction({
    required String tableName,
    required String createTableInformation,
    required var map,
    String databaseName = "task_db"
  });

  Future<dynamic> createDatabaseAndInsertDataInTable({
    required String tableName,
    required String createTableInformation,
    var map,
    String databaseName = "task_db"
  });

  Future<List<Map<String, dynamic>>> getAnyTableDataFromLocalDbWitPassingOnlyTableName({
    required String tableName,
    String databaseName = "task_db"
  });

  Future<void> updateAnyTableDataFromLocalDb({
    required String tableName,
    required dynamic updateColumnValues,
    required String where,
    required List<dynamic> whereArgs,
    String databaseName = "task_db"
  });

  Future<bool> deleteAnyTableDataFromLocalDb({
    required String tableName,
    String? where,
    List<dynamic>? whereArgs,
    bool isTableDataDirectReset = true,
    String databaseName = "task_db"
  });

  Future<void> deleteDatabaseFile({String databaseName = "task_db"});
}