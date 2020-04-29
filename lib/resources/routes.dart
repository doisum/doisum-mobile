import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class Routes {
  static String createTask = '/create_task';

  static pop(BuildContext c) {
    Navigator.of(c).pop();
  }

  static openCreateTaskPage(BuildContext c, var database) {
    Navigator.of(c).push(_createRoute(database));
  }

  static Route _createRoute(var database) {
    return PageRouteBuilder(
      opaque: false,
      pageBuilder: (context, animation, secondaryAnimation) => CreateTaskPage(database: database),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
