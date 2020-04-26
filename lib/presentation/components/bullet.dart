import 'package:flutter/widgets.dart';

class Bullet extends StatelessWidget {
  final Widget child;
  final Color color;

  const Bullet({
    Key key,
    @required this.child,
    @required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
      ),
      child: Center(
        child: this.child,
      ),
    );
  }
}
