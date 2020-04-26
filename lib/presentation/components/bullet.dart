import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

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
  Color get backgroundColor {
    return isPressed ? this.widget.color.withOpacity(0.8) : widget.color;
  }

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
        child: Chip(
          backgroundColor: this.backgroundColor,
          label: widget.child,
        ));
  }
}
