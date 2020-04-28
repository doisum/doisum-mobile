import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TRANSPARENT,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TRANSPARENT,
      ),
      body: RoundedBodyContent(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: form(),
          ).padding(16),
        ),
      ),
    );
  }

  List<Widget> form() {
    return [
      TaskNameField(onChanged: (name) => Presenter.taskName = name),
      Divider(),
      CategoryChooser(onChanged: (category) => Presenter.category = category),
      WeekdayChooser(onChanged: (w, s) => Presenter.selectListWeekDay(w, s)),
      SizedBox(),
      FieldPicker(icon: Icons.timer, label: 'Início', child: Text('10:00AM'), type: FieldPickerType.time, onChange: (time) => Presenter.startTime = time),
      FieldPicker(icon: Icons.timer, label: 'Fim', child: Text('10:30AM'), type: FieldPickerType.time, onChange: (time) => print(time)),
      FieldPicker(icon: Icons.repeat, label: 'Repetir semanalmente', child: FieldSwitch(isSwitched: false, onChanged: (t) => Presenter.repeat = t), type: FieldPickerType.repeat, onChange: (time) => print(time)),
      FieldPicker(icon: Icons.notifications_none, label: 'Lembrar', child: Text('5 minutos antes'), type: FieldPickerType.reminder, onChange: (time) => print(time)),
      RoundedButton(
        title: 'Criar atividade',
        onPressed: () => Presenter.saveTask(),
      ).padding(0, top: 30)
    ].padding(0, top: 16);
  }
}

class RoundedBodyContent extends StatelessWidget {
  final Widget child;
  const RoundedBodyContent({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Container(
              decoration: roundDecoration(
                color: BACKGROUND_GRAY,
                radius: 30,
              ),
              child: this.child,
            ),
          ),
        );
      },
    );
  }
}

class RoundedTextField extends StatelessWidget {
  final String placeholder;
  const RoundedTextField({Key key, this.placeholder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelStyle: BOLD,
        labelText: this.placeholder,
      ),
    );
  }
}
