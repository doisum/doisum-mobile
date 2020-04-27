import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/resources/styles/colors.dart';


class FieldPicker extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Function(BuildContext) onTap;

  const FieldPicker({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.value,
    @required this.onTap,
  }) : super(key: key);


    @override
    Widget build(BuildContext context) {
      return GestureDetector(
          onTap: () => this.onTap(context),
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
