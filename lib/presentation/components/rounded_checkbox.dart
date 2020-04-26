import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class RoundedCheckbox extends StatelessWidget {
  final bool isSelected;
  const RoundedCheckbox({Key key, @required this.isSelected}) : super(key: key);

  Color get borderColor => isSelected ? DEEP_PURPLE : LIGHT_GRAY;
  Color get checkColor => isSelected ? DEEP_PURPLE : TRANSPARENT;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration(),
      child: checkIcon(),
    );
  }

  Widget checkIcon() {
    return Icon(
      Icons.check,
      color: this.checkColor,
      size: 14,
    ).padding(3);
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      border: new Border.all(
        width: 2,
        color: this.borderColor,
      ),
      shape: BoxShape.circle,
    );
  }
}
