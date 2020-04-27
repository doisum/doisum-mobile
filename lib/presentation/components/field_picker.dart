import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/resources/styles/colors.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';


class FieldPicker extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final FieldPickerTypes type;
  final Function(TimeOfDay) onTap;

  const FieldPicker({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.value,
    @required this.onTap,
    @required this.type
  }) : super(key: key);

  Future _selectTime(BuildContext context) async {
    TimeOfDay _currentTime = new TimeOfDay.now();
    TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
    );
    if(selectedTime != null) this.onTap(selectedTime);
  }

  void openSelect(BuildContext context) {
    switch(this.type) {
      case FieldPickerTypes.time: {
        _selectTime(context);
      }
      break;
      case FieldPickerTypes.repeat: {
        print('repeat');
      }
      break;
      case FieldPickerTypes.remember: {
        print('remaider');
      }
      break;
    }
  }

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
          onTap: () => openSelect(context),
          child: Row(
              children: [
                Icon(
                    this.icon,
                    size: 16,
                    color: DEEP_PURPLE,
                ),
                SizedBox(width: 8),
                Text(
                    this.label,
                    style: Theme.of(context).textTheme.headline,
                ),
                Expanded(child: SizedBox()),
                Text(
                    this.value,
                ),
              ],
          ),
          );
    }
}
