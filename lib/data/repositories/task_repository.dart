import 'package:school_tasks/data/database/db_helper.dart';
import 'package:school_tasks/data/models/task.dart';

class TaskRepository {
  final DBHelper dbHelper;

  TaskRepository(this.dbHelper);

  Future<List<Task>> findAll({int completed = 0}) async {
    final db = await dbHelper.database;
    final result = await db!.query(dbHelper.tasksTable, where: 'completed = ?', whereArgs: [completed]);
    final tasks = result.map((e) => Task.fromMap(e)).toList();
    return tasks;
  }

  Future<int> insert(Task task) async {
    final db = await dbHelper.database;
    final result = await db!.insert(dbHelper.tasksTable, task.toMap());
    return result;
  }

  Future<int> update(Task task) async {
    final db = await dbHelper.database;
    final result = await db!.update(dbHelper.tasksTable, task.toMap(), where: 'id = ?', whereArgs: [task.id]);
    return result;
  }

  Future<int> delete(Task task) async {
    final db = await dbHelper.database;
    final result = await db!.delete(dbHelper.tasksTable, where: 'id = ?', whereArgs: [task.id]);
    return result;
  }
}
