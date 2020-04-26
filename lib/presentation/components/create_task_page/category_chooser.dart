import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class CategoryChooser extends StatelessWidget {
  const CategoryChooser({Key key}) : super(key: key);

  final taskSuggestions = const [
    CategoryBullet(category: Category.mindfulness),
    CategoryBullet(category: Category.learning),
    CategoryBullet(category: Category.exercise),
    CategoryBullet(category: Category.selfCare),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormsTitleLabel('Escolha uma categoria'),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 10,
          children: taskSuggestions,
        ),
      ],
    );
  }
}
