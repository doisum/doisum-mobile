import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class WeekdayChooser extends StatelessWidget {
  const WeekdayChooser({Key key}) : super(key: key);

  List<LabeledRoundCheckbox> options() {
    final weekdays = ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'];
    return weekdays.map((day) {
      return LabeledRoundCheckbox(
        day,
        isSelected: day == 'S', // fix logic
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormsTitleLabel('Escolha o dia da semana'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: options(),
        )
      ],
    );
  }
}
