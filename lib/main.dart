import 'package:flutter/material.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

void main() => runApp(Application());

final appTheme = ThemeData(
  buttonColor: PURPLE,
  scaffoldBackgroundColor: PURPLE,
  backgroundColor: BACKGROUND_GRAY,
  dividerColor: LIGHT_GRAY,

  textTheme: TextTheme(
      title: WHITE_BOLD.copyWith(fontSize: 24),
      body1: PURPLE_BOLD.copyWith(fontSize: 14),
      headline: DEEP_PURPLE_BOLD.copyWith(fontSize: 14),
      display1: PURPLE_BOLD.copyWith(fontSize: 24),
      button: WHITE_FONT.copyWith(fontSize: 16)),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: PURPLE,
    shape: ROUNDED_SQUARE_SHAPE,
  ),

  primaryColor: PURPLE,
  cursorColor: PURPLE,
  secondaryHeaderColor: LIGHT_GRAY,
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
