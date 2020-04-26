import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class TaskCard extends StatefulWidget {
  TaskCard({Key key}) : super(key: key);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        TimelineStepper(),
        SizedBox(width: 20),
        Expanded(child: TaskCardContent().padding(0, top: 20)),
      ],
    );
  }
}

class TimelineStepper extends StatelessWidget {
  const TimelineStepper({Key key}) : super(key: key);

  Widget circle() {
    return Bullet(
      color: GREEN,
      child: Text(
        '7h00',
        style: TextStyle(
          color: WHITE,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget line() {
    return Container(
      // constraints: BoxConstraints.expand(),
      color: DARK_GRAY,
      width: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        circle(),
        Row(
          children: [line()],
        )
      ],
    );
  }
}

class TaskCardContent extends StatelessWidget {
  const TaskCardContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GREEN.withAlpha(50),
        borderRadius: BorderRadius.all(Radius.circular(9.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Meditar',
            style: BOLD,
          ),
          Text('7h00 - 7h10'),
        ],
      ).padding(10),
    );
  }
}
