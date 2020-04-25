import 'package:flutter/foundation.dart';

class Task {}

enum TaskStatus {
  pending,
  doing,
  done,
  rejected,
  skipped,
}

abstract class TaskDatabaseService {
  Future<void> addTask(Task task);
  Future<void> deleteTask(Task task);
  Future<void> markTaskAs(TaskStatus status);
  Future<void> editTask({@required int id, @required Task updatedTask});
  Future<List<Task>> listTasks();
}
