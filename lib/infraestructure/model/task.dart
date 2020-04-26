import 'package:healthy_routine_mobile/healthy_routine.dart';

class Task {
  final int id;
  final String name;
  final TaskStatus status;
  final List<Weekday> recurrence;
  final DateTime startDate;
  final DateTime endDate;

  Task({
    this.id,
    this.name,
    this.status,
    this.recurrence,
    this.startDate,
    this.endDate,
  });

  // Convert a Note object into a Map object
  Map<String, dynamic> taskMap() {
    return {
      'id': id,
      'name': name,
      'status': status.toString(),
      'startDate': startDate.toString(),
      'endDate': endDate.toString(),
    };
  }
}
