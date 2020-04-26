import 'package:flutter/widgets.dart';

BoxDecoration roundDecoration({@required Color color, @required double radius}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.all(
      Radius.circular(radius),
    ),
  );
}
