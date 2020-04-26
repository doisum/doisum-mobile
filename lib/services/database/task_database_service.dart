import 'package:sqflite/sqflite.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';
import 'dart:async';

class TaskDatabaseService extends AbstractTaskDatabaseService {
  final Database database;

  TaskDatabaseService({
    this.database,
  });

  @override
  Future<int> addTask(Task task) async {
    int created = await database.insert('tasks', task.asMap());
    return created;
  }

  @override
  Future<List<Task>> listTasks() async {
    final List<Map<String, dynamic>> maps = await database.query('tasks');

    // Convert the List<Map<String, dynamic> into a List<Tasks>.
    return List.generate(maps.length, (i) {
      List<String> weekDay = maps[i]['recurrence'].split(',');

      List<Weekday> weekDayEnum = List.generate(weekDay.length, (idx) {
        return Weekday.values.firstWhere((e) => e.toString() == weekDay[i]);
      });

      return Task(
        id: maps[i]['id'],
        name: maps[i]['name'],
        status: TaskStatus.values
            .firstWhere((e) => e.toString() == maps[i]['status']),
        recurrence: weekDayEnum,
        endDate: DateTime.parse(maps[i]['endDate']),
        startDate: DateTime.parse(maps[i]['startDate']),
      );
    });
  }
}
