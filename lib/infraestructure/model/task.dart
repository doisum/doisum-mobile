import './task_status.dart';
import './days_week.dart';

class Task {
  final String name;
  final TaskStatus status;
  final List<DaysWeek> recurrence;
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
