import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class LabeledRoundCheckbox extends StatefulWidget {

  final Function(Weekday, bool) onTap;
  final WeekdayHelper weekday;

  const LabeledRoundCheckbox(
    this.weekday, {
    Key key,
    @required this.onTap,
  }) : super(key: key);

  @override
  _LabeledRoundCheckboxState createState() => _LabeledRoundCheckboxState();
}

class _LabeledRoundCheckboxState extends State<LabeledRoundCheckbox> {
  bool isSelected = false;


  void toggleSelected() {
    setState(() => isSelected = !isSelected);
    widget.onTap(widget.weekday.weekEnum, isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: toggleSelected,
        child: Column(
          children: [
            Text(widget.weekday.name).padding(4),
            RoundedCheckbox(isSelected: this.isSelected),
          ],
        ),
    );
  }
}
