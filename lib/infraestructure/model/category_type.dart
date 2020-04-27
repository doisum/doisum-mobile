import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

enum CategoryType { exercise, mindfulness, learning, selfCare, work }

extension CategoryTypeExtension on CategoryType {
  Color color() {
    Color color;
    switch (this) {
      case CategoryType.exercise:
        color = CategoryColors.RED;
        break;
      case CategoryType.mindfulness:
        color = CategoryColors.BLUE;
        break;
      case CategoryType.learning:
        color = CategoryColors.YELLOW;
        break;
      case CategoryType.selfCare:
        color = CategoryColors.LIGHT_GREEN;
        break;
      case CategoryType.work:
        color = CategoryColors.PINK;
        break;
    }
    return color;
  }

  String title() {
    String title;
    switch (this) {
      case CategoryType.exercise:
        title = 'Atividade física';
        break;
      case CategoryType.mindfulness:
        title = 'Saúde mental';
        break;
      case CategoryType.learning:
        title = 'Aprendizado';
        break;
      case CategoryType.selfCare:
        title = 'Saúde';
        break;
      case CategoryType.work:
        title = 'Trabalho';
        break;
    }
    return title;
  }
}