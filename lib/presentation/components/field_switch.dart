import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FieldSwitch extends StatefulWidget {
  _FieldSwitchState createState() => _FieldSwitchState();
}

class _FieldSwitchState extends State<FieldSwitch> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
        activeColor: Theme.of(context).buttonColor,
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
            print(isSwitched);
          });
        },
    );
  }
}
