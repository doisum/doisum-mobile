import 'package:flutter/material.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class DailyTaskListPage extends StatelessWidget {
  const DailyTaskListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          sliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return TaskCard();
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar sliverAppBar() {
    return SliverAppBar(
        pinned: true,
        backgroundColor: GREEN,
        expandedHeight: 140.0,
        shape: ROUNDED_HEADER_SHAPE,
        bottom: PreferredSize(
          child: Column(
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
                    ).padding(0, left: 10, right: 10),
                  ),
                ],
              )
            ],
          ).padding(10),
          preferredSize: Size.square(40),
        ));
  }
}
