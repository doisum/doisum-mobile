import 'package:healthy_routine_mobile/healthy_routine.dart';
import 'package:flutter/material.dart';

class CreateTaskPresenter {
  static String taskName;
  static Category category;
  static List<Weekday> listWeekDay = List();
  static int startHour;
  static int startMinute;
  static int endHour;
  static int endMinute;
  static bool repeat;

  static void selectListWeekDay(Weekday day, bool selected) {
    selected
        ? listWeekDay.add(day)
        : listWeekDay.remove(day);
  }

  static void saveTask() {
    Task t = Task(
        name: taskName,
        status: TaskStatus.pending,
        recurrence: listWeekDay,
        startHour: startHour,
        startMinute: startMinute,
        endHour: endHour,
        endMinute: endMinute,
    );
    print(t);
    print('saving task in database');
  }
}
