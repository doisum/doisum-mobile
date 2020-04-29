import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class TaskSchedule extends StatelessWidget {
  final String schedule;
  const TaskSchedule({Key key, @required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.access_time),
        Text(
          this.schedule,
          style: Theme.of(context).textTheme.body2,
        ).padding(0, left: 5)
      ],
    ).padding(0, bottom: 5);
  }
}

class TaskDuration extends StatelessWidget {
  final String duration;

  const TaskDuration({Key key, @required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.timer),
        Text(
          this.duration,
          style: Theme.of(context).textTheme.body2,
        ).padding(0, left: 5)
      ],
    ).padding(0, bottom: 5);
  }
}
