import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';
import 'package:intl/intl.dart';

class TaskCard extends StatefulWidget {
  final Task task;

  TaskCard(this.task, {Key key}) : super(key: key);

  @override
  _TaskCardState createState() => _TaskCardState(task);
}

class _TaskCardState extends State<TaskCard> {
   final Task task;
  
  _TaskCardState(this.task);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        TimelineStepper(this.task).padding(0, bottom: 10),
        SizedBox(width: 20),
        Expanded(child: TaskCardContent(this.task).padding(0, top: 20)),
      ],
    ).padding(0, horizontal: 20);
  }
}

class TaskCardContent extends StatelessWidget {
  final Task task;

  const TaskCardContent(this.task, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: roundDecoration(color: GREEN.withAlpha(50), radius: 9.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.task.name,
            style: BOLD,
          ),
          Text('${new DateFormat('h:mm a').format(task.startDate)} - ${new DateFormat('h:mm a').format(task.endDate)}'),
        ],
      ).padding(10),
    );
  }
}
