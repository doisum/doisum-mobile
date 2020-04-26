import 'package:flutter/material.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

void main() => runApp(Application());

final appTheme = ThemeData(
  primaryColor: PURPLE,
  cursorColor: PURPLE,
  accentColor: ORANGE,
  buttonColor: PURPLE,
  scaffoldBackgroundColor: PURPLE,
  backgroundColor: BACKGROUND_GRAY,
  secondaryHeaderColor: LIGHT_GRAY,
  dividerColor: LIGHT_GRAY,
  textTheme: TextTheme(
    title: WHITE_BOLD.copyWith(fontSize: 24),
    subtitle: BOLD
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: PURPLE,
    shape: ROUNDED_SQUARE_SHAPE,
  ),
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
