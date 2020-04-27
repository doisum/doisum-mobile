import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FieldSwitch extends StatefulWidget {
  bool isSwitched; // should initialize state with initial value
  final Function(bool) onChanged;

  FieldSwitch({
    @required this.isSwitched,
    @required this.onChanged,
  });

  _FieldSwitchState createState() => _FieldSwitchState();
}

class _FieldSwitchState extends State<FieldSwitch> {
  bool _isSwitched = false;

  void toggleSwitch(value) {
    setState(() {
      _isSwitched = value;
      widget.onChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
        activeColor: Theme.of(context).buttonColor,
        value: _isSwitched,
        onChanged: toggleSwitch,
    );
  }
}
