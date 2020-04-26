import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const RoundedButton({
    Key key,
    @required this.title,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bullet(
      onPressed: onPressed,
      color: Theme.of(context).buttonColor,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              this.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.button,
            ).padding(13),
          ),
        ],
      ),
    );
  }
}
