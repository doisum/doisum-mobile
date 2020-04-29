import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class TimelineStepper extends StatelessWidget {
  final Task task;

  const TimelineStepper(this.task, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      task.startDate.toString(),
      style: TextStyle(
        color: DARK_GRAY,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
  }
}
