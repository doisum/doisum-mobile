import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

BoxDecoration roundDecoration(
    {@required Color color, @required double radius}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.all(
      Radius.circular(radius),
    ),
  );
}

const InputDecoration CLEAN_TEXT_FIELD = InputDecoration(
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
);
