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
        Icon(Icons.access_time, size: 15, color: PURPLE,),
        Text(
          this.schedule,
          style: TextStyle(
            color: PURPLE,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
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
        Icon(Icons.timer, size: 15, color: PURPLE,),
        Text(
          this.duration,
          style: TextStyle(
            color: PURPLE,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ).padding(0, left: 5)
      ],
    ).padding(0, bottom: 5);
  }
}
