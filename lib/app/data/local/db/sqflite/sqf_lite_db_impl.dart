import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' ;
import 'package:to_do/app/data/local/db/sqflite/sqflite_db_base.dart';

class SqfLitDbImpl implements SqfLitDbBase {
  static Database? _database;
  static int dbVersion = 0;
  static String createTableInfo = "";
  static String previousTableInfo = "";

  @override
  String get databaseName => "task_db";

  @override
  Future<Database> initDb({String databaseName = "task_db"}) async {
    try {
      final rootPath = await getDatabasesPath();
      final dbPath = join(rootPath, databaseName);
      return await openDatabase(dbPath, version: 1, onCreate: createDb, onUpgrade: upgradeDb);
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<void> createDb(Database db, int version) async {
    await db.execute(createTableInfo);
  }

  @override
  Future<void> upgradeDb(Database db, int oldVersion, int newVersion) async {
    if (oldVersion != newVersion) {
      await db.execute(createTableInfo);
    }
  }

  @override
  Future<void> createAnewTableWithoutBuildInFunction(Database db, String table) async {
    await db.execute(table);
  }

  @override
  Future<int> insertDataInTableWithoutBuildINFunction({required String tableName, required String createTableInformation, required var map, String databaseName = "task_db"}) async {
    final db = await initDb(databaseName: databaseName);
    await createAnewTableWithoutBuildInFunction(db, createTableInformation);
    return db.insert(tableName, map);
  }

  @override
  Future<dynamic> createDatabaseAndInsertDataInTable({required String tableName, required String createTableInformation, var map, String databaseName = "task_db"}) async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, databaseName);
      bool doesDatabaseExist = await databaseExists(path);
      if (!doesDatabaseExist) {
        createTableInfo = createTableInformation;
        final db = await initDb(databaseName: databaseName);
        return db.insert(tableName, map);
      } else {
        final db = await initDb(databaseName: databaseName);
        await createAnewTableWithoutBuildInFunction(db, createTableInformation);
        return db.insert(tableName, map);
      }
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAnyTableDataFromLocalDbWitPassingOnlyTableName({required String tableName, String databaseName = "task_db"}) async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, databaseName);
      bool doesDatabaseExist = await databaseExists(path);
      if (!doesDatabaseExist) return [];
      final db = await initDb(databaseName: databaseName);
      return await db.query(tableName);
    } catch (err) {
      return [];
    }
  }

  @override
  Future<void> updateAnyTableDataFromLocalDb({required String tableName, required dynamic updateColumnValues, required String where, required List<dynamic> whereArgs, String databaseName = "task_db"}) async {
    try {
      final db = await initDb(databaseName: databaseName);
      await db.update(tableName, updateColumnValues, where: where, whereArgs: whereArgs);
    } catch (err) {
      return;
    }
  }

  @override
  Future<bool> deleteAnyTableDataFromLocalDb({required String tableName, String? where, List<dynamic>? whereArgs, bool isTableDataDirectReset = true, String databaseName = "task_db"}) async {
    try {
      final db = await initDb(databaseName: databaseName);
      if (!isTableDataDirectReset) {
        await db.delete(tableName, where: where, whereArgs: whereArgs);
      } else {
        await db.delete(tableName);
      }
      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  Future<dynamic> getTaskData({
    required dynamic queryParam,
    String databaseName = "task_db",
    String tableName = "",
  }) async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, databaseName);
      bool doesDatabaseExist = await databaseExists(path);
      if (!doesDatabaseExist) return {};

      final db = await initDb(databaseName: databaseName);
      String query = "SELECT * FROM ${tableName} WHERE 1=1";

      // // Apply dynamic filters to the query
      // if (queryParam['filters'] != null) {
      //   Map<String, dynamic> filters = queryParam['filters'];
      //   filters.forEach((key, value) {
      //     query += " AND $key = '$value'";
      //     query += " AND $key = '$value'";
      //   });
      // }

      // Pagination
      int offset = (queryParam['pageNumber'] - 1) * queryParam['perPage'];
      query += " LIMIT ${queryParam['perPage']} OFFSET $offset";

      // Execute the query
      List<Map<String, dynamic>> result = await db.rawQuery(query);

      // Count total tasks (without pagination) for pagination info
      var countResult = await db.rawQuery("SELECT COUNT(*) AS total FROM ${tableName} WHERE 1=1");
      int totalTasks = countResult.isNotEmpty ? (countResult.first['total'] as int?) ?? 0 : 0;

      // Return dynamic response (you could return a map or structured model)
      return {
        'total_tasks': totalTasks,
        'task_list': result, // Result can be dynamic
      };
    } catch (err) {
      print("Error fetching data: $err");
      return {
        'totalTasks': 0,
        'taskList': [],
      };
    }
  }

  @override
  Future<void> deleteDatabaseFile({String databaseName = "task_db"}) async {
    final rootPath = await getDatabasesPath();
    final dbPath = join(rootPath, databaseName);
    if (_database != null) {
      await _database?.close();
      _database = null;
    }
    await deleteDatabase(dbPath);
  }
  
}
