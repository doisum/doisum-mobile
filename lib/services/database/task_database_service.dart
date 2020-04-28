import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class TaskDatabaseService extends AbstractTaskDatabaseService {
  // final Database database;
  final String tableTasks = 'tasks';

  // TaskDatabaseService({
  //   this.database,
  // });

  @override
  Future<int> addTask(Task task) async {
    var database = await DatabaseProvider.database();

    int created = await database.insert(tableTasks, task.asMap());
    return created;
  }

  @override
  Future<List<Task>> listTasks() async {
    var database = await DatabaseProvider.database();

    final List<Map<String, dynamic>> maps = await database.query(tableTasks);

    // Convert the List<Map<String, dynamic> into a List<Tasks>.
    // return List.generate(maps.length, (i) {
    //   return Task.fromMap(maps[i]);
    // });

    // Database Mock
    List<Task> tasks = [
      new Task(id: 1, name: 'Flexão', startDate: DateTime.now(), endDate: DateTime.now(), recurrence: [Weekday.monday, Weekday.sunday, Weekday.saturday]),
      new Task(id: 1, name: 'Meditar', startDate: DateTime.now(), endDate: DateTime.now(), recurrence: [Weekday.monday]),
      new Task(id: 1, name: 'Brincar com o Cachorro', startDate: DateTime.now(), endDate: DateTime.now(), recurrence: [Weekday.saturday]),
      new Task(id: 1, name: 'Ler 10 páginas de um livro', startDate: DateTime.now(), endDate: DateTime.now(), recurrence: [Weekday.wednesday, Weekday.thursday]),
      new Task(id: 1, name: 'Assistir a live - Bruno e Marrone', startDate: DateTime.now(), endDate: DateTime.now(), recurrence: [Weekday.friday]),
      new Task(id: 1, name: 'Ligar para a Ana', startDate: DateTime.now(), endDate: DateTime.now(), recurrence: [Weekday.sunday, Weekday.saturday]),
    ];

    return tasks;
  }

  @override
  Future<void> deleteTask(int id) async {
    var database = await DatabaseProvider.database();
    await database.delete(tableTasks, where: "id = ?", whereArgs: [id]);
  }

  @override
  Future<void> markTaskAs(TaskStatus status, int taskId) async {
    var database = await DatabaseProvider.database();
    await database.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        [status.toString(), taskId.toString()]);
  }

  @override
  Future<void> editTask({@required int id, @required Task updatedTask}) async {
    var database = await DatabaseProvider.database();
    await database.update(tableTasks, updatedTask.asMap(),
        where: "id = ?", whereArgs: [id]);
  }

  @override
  Future<Task> findTaskById(@required int id) async {
    var database = await DatabaseProvider.database();
    List<Map> maps = await database.query(tableTasks,
        columns: ['id', 'name', 'status', 'recurrence', 'startDate', 'endDate'],
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Task.fromMap(maps.first);
    }
    return null;
  }
}
