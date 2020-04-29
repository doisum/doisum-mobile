import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class TaskDatabaseService extends AbstractTaskDatabaseService {
  final Database database;
  final String tableTasks = 'tasks';

  TaskDatabaseService({
    this.database,
  });

  @override
  Future<int> addTask(Task task) async {
    int created = await database.insert(tableTasks, task.asMap());
    return created;
  }

  @override
  Future<List<Task>> listTasks() async {
    final List<Map<String, dynamic>> maps = await database.query(tableTasks);

    // Convert the List<Map<String, dynamic> into a List<Tasks>.
    return List.generate(maps.length, (i) {
      return Task.fromMap(maps[i]);
    });
  }

  @override
  Future<void> deleteTask(int id) async {
    await database.delete(tableTasks, where: "id = ?", whereArgs: [id]);
  }

  @override
  Future<void> markTaskAs(TaskStatus status, int taskId) async {
    await database.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        [status.toString(), taskId.toString()]);
  }

  @override
  Future<void> editTask({@required int id, @required Task updatedTask}) async {
    await database.update(tableTasks, updatedTask.asMap(),
        where: "id = ?", whereArgs: [id]);
  }

  @override
  Future<Task> findTaskById(@required int id) async {
    List<Map> maps = await database.query(tableTasks,
        columns: ['id', 'name', 'status', 'recurrence', 'startDate', 'endDate', 'startTime', 'endTime'],
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Task.fromMap(maps.first);
    }
    return null;
  }
}
