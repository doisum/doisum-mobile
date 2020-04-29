import 'package:healthy_routine_mobile/healthy_routine.dart';
import 'package:flutter/material.dart';

class CreateTaskPresenter {
  static String taskName;
  static Category category;
  static List<Weekday> listWeekDay = List();
  static TimeOfDay startTime;
  static TimeOfDay endTime;
  static bool repeat;

  static void selectListWeekDay(Weekday day, bool selected) {
    selected
        ? listWeekDay.add(day)
        : listWeekDay.remove(day);
  }

  static void saveTask(BuildContext context, TaskDatabaseService database) {
    Task t = Task(
        name: taskName,
        status: TaskStatus.pending,
        recurrence: listWeekDay,
        startTime: startTime,
        endTime: endTime,
    );
    database.addTask(t.asMap(context));
    print('saving task in database');
  }
}
