import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Healthy Routine',
          style: BOLD.copyWith(color: WHITE, fontSize: 30),
        ).padding(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Bullet(
              color: WHITE,
              child: Text(
                '+ Nova atividade',
                style: BOLD.copyWith(color: GREEN),
              ).padding(0, horizontal: 10),
            ),
          ],
        )
      ],
    ).padding(10);
  }
}
