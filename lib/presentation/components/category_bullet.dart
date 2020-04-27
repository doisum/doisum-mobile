import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class Category {
  CategoryType type;
  bool isSelected;

  Category({
    @required this.type,
    this.isSelected = false,
  });
}

enum CategoryType { exercise, mindfulness, learning, selfCare, work }

class CategoryBullet extends StatelessWidget {
  final Category category;
  final VoidCallback onPressed;

  const CategoryBullet({
    Key key,
    @required this.category,
    @required this.onPressed,
  }) : super(key: key);

  Color categoryColor() {
    Color color;
    switch (category.type) {
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

  String categoryTitle() {
    String title;
    switch (category.type) {
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

  @override
  Widget build(BuildContext context) {
    return Bullet(
      child: Text(
        categoryTitle(),
        style: Theme.of(context).textTheme.body1,
      ),
      color: categoryColor().withOpacity(0.1),
      onPressed: this.onPressed,
      isSelected: this.category.isSelected,
    );
  }
}
