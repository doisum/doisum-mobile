import 'package:flutter/material.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthy Routine',
      home: DailyTaskListPage(),
    );
  }
}
