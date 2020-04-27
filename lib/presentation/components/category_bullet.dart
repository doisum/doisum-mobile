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

class CategoryBullet extends StatelessWidget {
  final Category category;
  final VoidCallback onPressed;

  const CategoryBullet({
    Key key,
    @required this.category,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bullet(
      child: Text(
        category.type.title(),
        style: Theme.of(context).textTheme.body1,
      ),
      color: category.type.color().withOpacity(0.1),
      onPressed: this.onPressed,
      isSelected: this.category.isSelected,
    );
  }
}
