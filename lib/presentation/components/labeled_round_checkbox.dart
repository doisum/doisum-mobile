import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class LabeledRoundCheckbox extends StatelessWidget {
  final String label;
  final bool isSelected;
  const LabeledRoundCheckbox(
    this.label, {
    Key key,
    @required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(this.label).padding(4),
        RoundedCheckbox(isSelected: this.isSelected),
      ],
    );
  }
}
