import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class PageHeader extends StatelessWidget {
  final VoidCallback onCreateTask;

  const PageHeader({
    Key key,
    this.onCreateTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Healthy Routine',
          style: BOLD.copyWith(color: WHITE, fontSize: 40),
        ).padding(0, vertical: 10),
        Row(
          children: [
            Bullet(
              onPressed: () => Routes.openCreateTaskPage(context),
              color: WHITE,
              child: Text(
                '+ Nova atividade',
                style: BOLD.copyWith(color: GREEN),
              ).padding(0, horizontal: 10),
            ).padding(0, bottom: 10),
          ],
        )
      ],
    ).padding(10, left: 30);
  }
}
