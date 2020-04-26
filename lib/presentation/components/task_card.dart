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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        TimelineStepper().padding(0, bottom: 10),
        SizedBox(width: 20),
        Expanded(child: TaskCardContent().padding(0, top: 20)),
      ],
    ).padding(0, horizontal: 20);
  }
}

class TaskCardContent extends StatelessWidget {
  const TaskCardContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: roundDecoration(color: GREEN.withAlpha(50), radius: 9.5),
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
