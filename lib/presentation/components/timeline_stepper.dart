import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class TimelineStepper extends StatelessWidget {
  const TimelineStepper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '7h00',
      style: TextStyle(
        color: DARK_GRAY,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
  }
}
