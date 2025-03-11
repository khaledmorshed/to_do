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
