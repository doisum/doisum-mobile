import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({Key key}) : super(key: key);

  /// MOCKS
  final taskSuggestions = const [
    Bullet(
      child: Text('Meditação', style: WHITE_FONT),
      color: LIGHT_GRAY,
    ),
    Bullet(
      child: Text('Alongar', style: WHITE_FONT),
      color: CategoryColors.PINK,
    ),
    Bullet(
      child: Text('Caminhada', style: WHITE_FONT),
      color: LIGHT_GRAY,
    ),
    Bullet(
      child: Text('Ouvir música', style: WHITE_FONT),
      color: LIGHT_GRAY,
    ),
    Bullet(
      child: Text('Ouvir música', style: WHITE_FONT),
      color: LIGHT_GRAY,
    ),
    Bullet(
      child: Text('Ouvir música', style: WHITE_FONT),
      color: LIGHT_GRAY,
    ),
    Bullet(
      child: Text('Ouvir música', style: WHITE_FONT),
      color: LIGHT_GRAY,
    ),
  ];

  List<Bullet> weekdaysBullets() {
    final weekdays = ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'];
    return weekdays.map((letter) {
      return Bullet(
        child: Text(letter, style: WHITE_FONT),
        color: PURPLE.withOpacity(0.9),
      );
    }).toList();
  }

  /// MOCKS

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
    final titleStyle = BOLD.copyWith(fontSize: 24);
    return [
      Text(
        'Nome da atividade',
        style: titleStyle,
      ),
      RoundedTextField(
        placeholder: 'Meditar',
      ).padding(16),
      Text(
        'Sugestões',
        style: titleStyle,
      ),
      Wrap(
        alignment: WrapAlignment.start,
        spacing: 10,
        children: taskSuggestions,
      ),
      Text(
        'Recorrência',
        style: titleStyle,
      ),
      checkBoxField('Dia da semana'),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: weekdaysBullets(),
      ),
      checkBoxField('Número de dias na semana'),
      checkBoxField('Número de dias por mês'),
      checkBoxField('A cada x dias'),
      Text(
        'Categoria',
        style: titleStyle,
      ),
      Wrap(
        alignment: WrapAlignment.start,
        spacing: 10,
        children: taskSuggestions,
      ),
      Bullet(
        color: PURPLE,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'Criar Atividade',
                textAlign: TextAlign.center,
                style: WHITE_FONT,
              ).padding(12),
            ),
          ],
        ),
      ).padding(0, top: 30)
    ];
  }

  Padding checkBoxField(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        color: DARK_GRAY.withAlpha(70),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: BOLD.copyWith(fontSize: 16),
              ).padding(16),
            ),
          ],
        ),
      ),
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
