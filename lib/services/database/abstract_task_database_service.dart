import 'package:healthy_routine_mobile/healthy_routine.dart';
import 'package:flutter/foundation.dart';

abstract class AbstractTaskDatabaseService {
  Future<void> addTask(Task task);
// Future<void> deleteTask(Task task);
//  Future<void> markTaskAs(TaskStatus status);
//  Future<void> editTask({@required int id, @required Task updatedTask});
  Future<List<Task>> listTasks();
}
