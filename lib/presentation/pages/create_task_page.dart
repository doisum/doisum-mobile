import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({Key key}) : super(key: key);

  final taskSuggestions = const [
    Bullet(
      child: Text('Meditação', style: WHITE_FONT),
      color: CategoryColors.LIGHT_BLUE,
    ),
    Bullet(
      child: Text('Alongar', style: WHITE_FONT),
      color: CategoryColors.GREEN,
    ),
    Bullet(
      child: Text('Caminhada', style: WHITE_FONT),
      color: CategoryColors.ORANGE,
    ),
    Bullet(
      child: Text('Ouvir música', style: WHITE_FONT),
      color: CategoryColors.PINK,
    ),

    Bullet(
      child: Text('Ouvir música', style: WHITE_FONT),
      color: CategoryColors.RED,
    ),

    Bullet(
      child: Text('Ouvir música', style: WHITE_FONT),
      color: CategoryColors.WATER_BLUE,
    ),

    Bullet(
      child: Text('Ouvir música', style: WHITE_FONT),
      color: CategoryColors.BLUE,
    ),
  ];

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
          child: Column(
        children: [
          RoundedTextField(
            placeholder: 'Meditar',
          ).padding(16),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            children: taskSuggestions,
          ),
          
        ],
      )),
    );
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
