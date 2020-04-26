import 'package:flutter/material.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

void main() => runApp(Application());

final appTheme = ThemeData(
  backgroundColor: BACKGROUND_GRAY
);

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthy Routine',
      theme: appTheme,
      home: DailyTaskListPage(),
      routes: {
        Routes.createTask: (c) => CreateTaskPage(),
      },
    );
  }
}
