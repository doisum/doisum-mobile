import 'package:healthy_routine_mobile/healthy_routine.dart';
import 'package:flutter/material.dart';

class Presenter {
  var taskName;
  var type;
  var weekday;
  var startTime;
  var endTime;
  var repeat;


  static void setTaskName(String taskName) {
    taskName = taskName;
  }

  static void setTaskType(CategoryType taskType) {
    type = taskType;
  }

  static void setTaskWeekDay(Weekday weekday) {
    weekday = weekday;
  }

  static void setTaskStartTime(TimeOfDay start) {
    startTime = start;
  }

  static void setTaskEndTime(int hour, int minute) {
    endTime = '123'; // TimeOfDay(hour: hour, minute: minute);
  }

  static void setTaskRepeate(bool repeat) {
    repeat = repeat;
  }
}
