import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class TaskNameField extends StatelessWidget {
  final Function(String) onChanged;

  const TaskNameField({
    Key key,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FormsTitleLabel('Atividade'),
        TextField(
          style: Theme.of(context).textTheme.display1,
          decoration: CLEAN_TEXT_FIELD.copyWith(
            hintStyle: Theme.of(context).textTheme.display1,
            hintText: 'Nome da atividade',
          ),
          onChanged: this.onChanged,
        ),
      ],
    );
  }
}
