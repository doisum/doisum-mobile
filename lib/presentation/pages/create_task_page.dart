import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';
import 'package:healthy_routine_mobile/presentation/components/dismissable_scaffold.dart';

class CreateTaskPage extends StatelessWidget {
  final TaskDatabaseService database;

  CreateTaskPage({Key key, this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissableScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: form(context),
      ).padding(16),
    );
  }

  List<Widget> form(BuildContext context) {
    return [
      TaskNameField(onChanged: (name) => CreateTaskPresenter.taskName = name),
      Divider(),
      CategoryChooser(onChanged: (category) => CreateTaskPresenter.category = category),
      WeekdayChooser(onChanged: CreateTaskPresenter.selectListWeekDay),
      SizedBox(),
        FieldPicker(icon: Icons.timer, label: 'Início', child: Text('10:00AM'), type: FieldPickerType.time, onChange: (time) => CreateTaskPresenter.startTime = time),
      FieldPicker(icon: Icons.timer, label: 'Fim', child: Text('10:30AM'), type: FieldPickerType.time, onChange: (time) => CreateTaskPresenter.endTime = time),
      FieldPicker(icon: Icons.repeat, label: 'Repetir semanalmente', child: FieldSwitch(isSwitched: false, onChanged: (t) => CreateTaskPresenter.repeat = t), type: FieldPickerType.repeat, onChange: (time) => print(time)),
      FieldPicker(icon: Icons.notifications_none, label: 'Lembrar', child: Text('5 minutos antes'), type: FieldPickerType.reminder, onChange: (time) => print(time)),
      RoundedButton(
        title: 'Criar atividade',
        onPressed: () => CreateTaskPresenter.saveTask(context, database),
      ).padding(0, top: 30)
    ].padding(0, top: 16);
  }
}