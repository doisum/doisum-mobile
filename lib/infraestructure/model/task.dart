import 'package:healthy_routine_mobile/healthy_routine.dart';

class Task {
  final String name;
  final TaskStatus status;
  final List<Weekday> recurrence;
  final DateTime startDate;
  final DateTime endDate;

  Task({
    this.name,
    this.status,
    this.recurrence,
    this.startDate,
    this.endDate,
  });
}
