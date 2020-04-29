import 'package:healthy_routine_mobile/healthy_routine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Task {
  final int id;
  final String name;
  final TaskStatus status;
  final CategoryType type;
  final List<Weekday> recurrence;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  Task({
    this.id,
    this.name,
    this.status,
    this.type,
    this.recurrence,
    this.startTime,
    this.endTime,
  });

  // Convert a Note object into a Map object
  Map<String, dynamic> asMap(BuildContext context) {
    String weekDay = recurrence == null ? '' : recurrence.join(',').toString();

    return {
      'id': id,
      'name': name,
      'status': status.toString(),
      'recurrence': weekDay,
      'startTime': startTime.format(context),
      'endTime': endTime.format(context),
    };
  }

  // Convert the List<Map<String, dynamic> into a Tasks.
  static Task fromMap(Map<String, dynamic> taskMap) {
    List<String> weekDay = taskMap['recurrence'].split(',');

    List<Weekday> weekDayEnum = List.generate(weekDay.length, (idx) {
      return Weekday.values.firstWhere((e) => e.value() == weekDay[idx]);
    });

    TimeOfDay parseTimeOfDay(String s) {
      final time = s.split(":");
      TimeOfDay timeOfDay = TimeOfDay(hour:int.parse(time[0]),minute: int.parse(time[1]));
      return timeOfDay;
    }

    return Task(
      id: taskMap['id'],
      name: taskMap['name'],
      status: TaskStatus.values
          .firstWhere((e) => e.value() == taskMap['status']),
      recurrence: weekDayEnum,
      startTime: parseTimeOfDay(taskMap['startTime']),
      endTime: parseTimeOfDay(taskMap['endTime']),
    );
  }
}
