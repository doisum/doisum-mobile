import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

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
        TimelineStepper().padding(0, bottom: 10),
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
          Text('${this.task.startDate.hour}h${this.task.startDate.minute} - ${this.task.endDate.hour}h${this.task.endDate.minute}'),
        ],
      ).padding(10),
    );
  }
}
