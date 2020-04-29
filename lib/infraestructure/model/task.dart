import 'package:healthy_routine_mobile/healthy_routine.dart';

class Task {
  final int id;
  final String name;
  final TaskStatus status;
  final CategoryType type;
  final List<Weekday> recurrence;
  final int startHour;
  final int startMinute;
  final int endHour;
  final int endMinute;

  Task({
    this.id,
    this.name,
    this.status,
    this.type,
    this.recurrence,
    this.startHour,
    this.startMinute,
    this.endHour,
    this.endMinute,
  });

  // Convert a Note object into a Map object
  Map<String, dynamic> asMap() {
    String weekDay = recurrence == null ? '' : recurrence.join(',').toString();

    return {
      'id': id,
      'name': name,
      'status': status.toString(),
      'recurrence': weekDay,
      'startHour': startHour.toString(),
      'startMinute': startMinute.toString(),
      'endHour': endHour.toString(),
      'endMinute': endMinute.toString(),
    };
  }

  // Convert the List<Map<String, dynamic> into a Tasks.
  static Task fromMap(Map<String, dynamic> taskMap) {
    List<String> weekDay = taskMap['recurrence'].split(',');

    List<Weekday> weekDayEnum = List.generate(weekDay.length, (idx) {
      return Weekday.values.firstWhere((e) => e.toString() == weekDay[idx]);
    });

    return Task(
      id: taskMap['id'],
      name: taskMap['name'],
      status: TaskStatus.values
          .firstWhere((e) => e.toString() == taskMap['status']),
      recurrence: weekDayEnum,
      startHour: taskMap['startHour'],
      startMinute: taskMap['startMinute'],
      endHour: taskMap['endHour'],
      endMinute: taskMap['endMinute'],
    );
  }
}
