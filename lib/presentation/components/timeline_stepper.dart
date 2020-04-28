import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';
import 'package:intl/intl.dart';

class TimelineStepper extends StatelessWidget {
  final Task task;

  const TimelineStepper(this.task, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      new DateFormat('h:mm a').format(task.startDate),
      style: TextStyle(
        color: DARK_GRAY,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
  }
}
