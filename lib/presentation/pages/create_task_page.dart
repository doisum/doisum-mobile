import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';
import 'package:healthy_routine_mobile/presentation/components/dismissable_scaffold.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissableScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: form(),
      ).padding(16),
    );
  }

  List<Widget> form() {
    return [
      TaskNameField(onChanged: (name) => Presenter.taskName = name),
      Divider(),
      CategoryChooser(onChanged: (category) => Presenter.category = category),
      WeekdayChooser(onChanged: Presenter.selectListWeekDay),
      SizedBox(),
      FieldPicker(
          icon: Icons.timer,
          label: 'Início',
          child: Text('10:00AM'),
          type: FieldPickerType.time,
          onChange: (time) => Presenter.startTime = time),
      FieldPicker(
          icon: Icons.timer,
          label: 'Fim',
          child: Text('10:30AM'),
          type: FieldPickerType.time,
          onChange: (time) => print(time)),
      FieldPicker(
          icon: Icons.repeat,
          label: 'Repetir semanalmente',
          child: FieldSwitch(
              isSwitched: false, onChanged: (t) => Presenter.repeat = t),
          type: FieldPickerType.repeat,
          onChange: (time) => print(time)),
      FieldPicker(
          icon: Icons.notifications_none,
          label: 'Lembrar',
          child: Text('5 minutos antes'),
          type: FieldPickerType.reminder,
          onChange: (time) => print(time)),
      RoundedButton(
        title: 'Criar atividade',
        onPressed: Presenter.saveTask,
      ).padding(0, top: 30)
    ].padding(0, top: 16);
  }
}