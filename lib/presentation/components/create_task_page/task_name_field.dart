import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class TaskNameField extends StatelessWidget {
  const TaskNameField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FormsTitleLabel('Atividade'),
        TextField(
          decoration: CLEAN_TEXT_FIELD.copyWith(
            hintStyle: Theme.of(context).textTheme.display1,
            hintText: 'Nome da atividade',
          ),
        ),
      ],
    );
  }
}
