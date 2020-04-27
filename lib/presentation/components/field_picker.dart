import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/resources/styles/colors.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';


class FieldPicker extends StatelessWidget {
  final IconData icon;
  final String label;
  final FieldPickerType type;
  final Function(TimeOfDay) onChange;
  final Widget child;

  const FieldPicker({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.onChange,
    @required this.type,
    @required this.child,
  }) : super(key: key);

  Future _selectTime(BuildContext context) async {
    TimeOfDay _currentTime = new TimeOfDay.now();
    TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
    );
    if(selectedTime != null) this.onChange(selectedTime);
  }

  void openSelect(BuildContext context) {
    switch(this.type) {
      case FieldPickerType.time: {
        _selectTime(context);
      }
      break;
      case FieldPickerType.repeat: {
        print('repeat');
      }
      break;
      case FieldPickerType.reminder: {
        print('remaider');
      }
      break;
    }
  }

    @override
    Widget build(BuildContext context) {
      return AnimatedContainer(
          height: 17,
          width: 500,
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child: Material(
              color: TRANSPARENT,
              child: InkWell(
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
                        this.child,
                      ],
                  ),
              ),
          ),
      );
    }
}
