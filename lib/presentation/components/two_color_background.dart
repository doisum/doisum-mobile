import 'package:flutter/material.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class TwoColorBackground extends StatelessWidget {
  final Widget child;
  final Color startColor;
  final Color endColor;
  
  const TwoColorBackground({
    Key key,
    @required this.child,
    this.startColor = PURPLE,
    this.endColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: <Widget>[
            Expanded(child: Container(color: this.startColor)),
            Expanded(child: Container(color: this.endColor ?? Theme.of(context).backgroundColor)),
          ],
        ),
        this.child,
      ],
    );
  }
}
