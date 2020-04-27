import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class WeekdayChooser extends StatelessWidget {
  final Function(Weekday, bool) onChanged;

  const WeekdayChooser({Key key, @required this.onChanged}) : super(key: key);

  List<LabeledRoundCheckbox> options() {
    final weekdays = [
      WeekdayHelper(name: 'D', weekEnum: Weekday.sunday),
      WeekdayHelper(name: 'S', weekEnum: Weekday.monday),
      WeekdayHelper(name: 'T', weekEnum: Weekday.tuesday),
      WeekdayHelper(name: 'Q', weekEnum: Weekday.wednesday),
      WeekdayHelper(name: 'Q', weekEnum: Weekday.thursday),
      WeekdayHelper(name: 'S', weekEnum: Weekday.friday),
      WeekdayHelper(name: 'S', weekEnum: Weekday.saturday),
    ];
    return weekdays.map((day) {
      return LabeledRoundCheckbox(
        day,
        onTap: (day, state) => this.onChanged(day, state),
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
