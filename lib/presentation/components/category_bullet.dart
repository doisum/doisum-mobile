import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

enum Category { exercise, mindfulness, learning, selfCare }

class CategoryBullet extends StatelessWidget {
  final Category category;
  const CategoryBullet({Key key, this.category}) : super(key: key);

  Color categoryColor() {
    Color color;
    switch (category) {
      case Category.exercise:
        color = CategoryColors.RED;
        break;
      case Category.mindfulness:
        color = CategoryColors.BLUE;
        break;
      case Category.learning:
        color = CategoryColors.YELLOW;
        break;
      case Category.selfCare:
        color = CategoryColors.LIGHT_GREEN;
        break;
    }
    return color;
  }

  String categoryTitle() {
    String title;
    switch (category) {
      case Category.exercise:
        title = 'Atividade física';
        break;
      case Category.mindfulness:
        title = 'Saúde mental';
        break;
      case Category.learning:
        title = 'Aprendizado';
        break;
      case Category.selfCare:
        title = 'Saúde';
        break;
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return Bullet(
      child: Text(
        categoryTitle(),
        style: Theme.of(context).textTheme.body1,
      ),
      color: categoryColor().withOpacity(0.1),
    );
  }
}
