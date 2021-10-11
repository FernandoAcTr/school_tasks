import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class DBHelper {
  final _nameDB = "TASKSDB";
  final _versionDB = 1;
  final tasksTable = 'tasks';

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = path.join(directory.path, _nameDB);

    return await openDatabase(
      dbPath,
      version: _versionDB,
      onCreate: (Database db, int version) async {
        await _createTasksTable(db);
      },
    );
  }

  _createTasksTable(Database db) async {
    final sql =
        "CREATE TABLE $tasksTable (id INTEGER PRIMARY KEY, subject VARCHAR(50), task text, date_limit text, completed integer)";
    await db.execute(sql);
  }
}
