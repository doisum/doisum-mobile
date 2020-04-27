import 'package:flutter/material.dart';

class FormsTitleLabel extends StatelessWidget {
  final String title;
  const FormsTitleLabel(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: Theme.of(context).textTheme.headline,
    );
  }
}
