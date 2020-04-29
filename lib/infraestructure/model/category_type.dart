import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

enum CategoryType { exercise, mindfulness, learning, selfCare, work }

extension CategoryTypeExtension on CategoryType {
  Color color() {
    Color color;
    switch (this) {
      case CategoryType.exercise:
        color = CategoryColors.GREEN;
        break;
      case CategoryType.mindfulness:
        color = CategoryColors.BLUE;
        break;
      case CategoryType.learning:
        color = CategoryColors.ORANGE;
        break;
      case CategoryType.selfCare:
        color = CategoryColors.PINK;
        break;
      case CategoryType.work:
        color = CategoryColors.WATER_BLUE;
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