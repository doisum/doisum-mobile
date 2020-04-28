import 'package:flutter/widgets.dart';

class TwoColorBackground extends StatelessWidget {
  final Widget child;
  final Color startColor;
  final Color endColor;
  
  const TwoColorBackground({
    Key key,
    @required this.child,
    @required this.startColor,
    @required this.endColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: <Widget>[
            Expanded(child: Container(color: this.startColor)),
            Expanded(child: Container(color: this.endColor)),
          ],
        ),
        this.child,
      ],
    );
  }
}
