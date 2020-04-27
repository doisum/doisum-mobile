import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class CategoryChooser extends StatefulWidget {
  final Function(Category) onChanged;

  const CategoryChooser({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  _CategoryChooserState createState() => _CategoryChooserState();
}

class _CategoryChooserState extends State<CategoryChooser> {
  List<Category> categories = [
    Category(type: CategoryType.mindfulness),
    Category(type: CategoryType.learning),
    Category(type: CategoryType.exercise),
    Category(type: CategoryType.selfCare),
    Category(type: CategoryType.work),
  ];

  void onChange(Category selectedCategory) {
    setState(() {
      categories.forEach((c) => c.isSelected = false);
      selectedCategory.isSelected = true;
    });
    widget.onChanged(selectedCategory);
  }

  List<CategoryBullet> categoryBullets() {
    return categories.map((category) {
      return CategoryBullet(
        category: category,
        onPressed: () => onChange(category),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormsTitleLabel('Escolha uma categoria'),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 10,
          children: categoryBullets(),
        ),
      ],
    );
  }
}
