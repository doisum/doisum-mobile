import 'package:flutter/widgets.dart';

class Routes {
  static String createTask = '/create_task';

  static openCreateTaskPage(BuildContext c) {
    Navigator.of(c).pushNamed(createTask);
  }
}