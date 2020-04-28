import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class TaskCard extends StatefulWidget {
  TaskCard({Key key}) : super(key: key);

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
                          title: "Meditar",
                          schedule: "8:00 AM - 9:00 AM",
                          duration: "10 Minutes",
                          color: Colors.green,
                          isSelected: this.isSelected)
                      .padding(0, top: 20)))
          .padding(0, horizontal: 20),
    );
  }
}

class TaskCardContent extends StatelessWidget {
  final String title;
  final String schedule;
  final String duration;
  final Color color;
  final bool isSelected;

  const TaskCardContent(
      {Key key,
      @required this.title,
      @required this.schedule,
      @required this.duration,
      @required this.color,
      @required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: new LinearGradient(
            stops: [0.015, 0.015],
            colors: [this.color, this.color.withOpacity(0.1)]),
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
                    this.title,
                    style: BOLD,
                  ).padding(0, bottom: 6)),
              Align(
                alignment: Alignment.topRight,
                child: RoundedCheckbox(
                  isSelected: this.isSelected,
                ),
              )
            ],
          ).padding(0, bottom: 3),
          TaskSchedule(schedule: this.schedule),
          TaskDuration(duration: this.duration),
        ].padding(0, left: 13),
      ).padding(13),
    );
  }
}
