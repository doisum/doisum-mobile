import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class TaskCard extends StatefulWidget {
  final Task task;

  TaskCard({Key key, @required this.task}) : super(key: key);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isSelected = false;

  void toggleSelected() {
    setState(() => isSelected = !isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      curve: Curves.easeIn,
      child: Material(
        color: TRANSPARENT,
        child: InkWell(
          onTap: toggleSelected,
          child: TaskCardContent(
            task: widget.task,
            isSelected: this.isSelected,
          ).padding(0, top: 20),
        ),
      ).padding(0, horizontal: 20),
    );
  }
}

class TaskCardContent extends StatelessWidget {
  final Task task;
  final bool isSelected;

  const TaskCardContent(
      {Key key, @required this.task, @required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: new LinearGradient(
          stops: [0.015, 0.015],
          colors: [
            this.task.type.color(),
            this.task.type.color().withOpacity(0.1)
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  this.task.name,
                  style: BOLD,
                ).padding(0, bottom: 6),
              ),
              Align(
                alignment: Alignment.topRight,
                child: RoundedCheckbox(
                  isSelected: this.isSelected,
                ),
              )
            ],
          ).padding(0, bottom: 3),
          TaskSchedule(schedule: this.task.startTime.format(context)),
          // TaskDuration(duration: this.task.endTime.toString()),
          TaskDuration(duration: "10 Minutes"),
        ].padding(0, left: 13),
      ).padding(13),
    );
  }
}
