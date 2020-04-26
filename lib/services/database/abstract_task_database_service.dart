import 'package:healthy_routine_mobile/healthy_routine.dart';
import 'package:flutter/foundation.dart';

abstract class AbstractTaskDatabaseService {
  Future<int> addTask(Task task);
  Future<void> deleteTask(int id);
  Future<void> markTaskAs(TaskStatus status, int taskId);
  Future<void> editTask({@required int id, @required Task updatedTask});
  Future<List<Task>> listTasks();
  Future<Task> findTaskById(@required int id);
}
