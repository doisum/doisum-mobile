import 'package:flutter/widgets.dart';

class Bullet extends StatefulWidget {
  final Widget child;
  final Color color;
  final VoidCallback onPressed;

  const Bullet({
    Key key,
    @required this.child,
    @required this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  _BulletState createState() => _BulletState();
}

class _BulletState extends State<Bullet> {
  var isPressed = false;

  tapDown() {
    setState(() {
      isPressed = true;
    });
  }

  tapUp() {
    setState(() {
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: (_) => tapDown(),
      onTapUp: (_) => tapUp(),
      onTapCancel: tapUp,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: BoxDecoration(
          color:
              isPressed ? this.widget.color.withAlpha(90) : this.widget.color,
          borderRadius: BorderRadius.all(Radius.circular(1000)),
        ),
        child: Center(
          child: this.widget.child,
        ),
      ),
    );
  }
}
