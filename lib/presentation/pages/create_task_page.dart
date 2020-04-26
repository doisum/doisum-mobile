import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ORANGE,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TRANSPARENT,
        title: Text('Criar nova atividade'),
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
      TaskNameField(),
      Divider(),
      CategoryChooser(),
      RoundedCheckbox(isSelected: false),
      RoundedCheckbox(isSelected: true),
      RoundedButton(
        title: 'Criar atividade',
        onPressed: () {},
      ).padding(0, top: 30)
    ];
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
