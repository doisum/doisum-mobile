import 'package:flutter/material.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';
import 'package:healthy_routine_mobile/presentation/components/page_header.dart';

class DailyTaskListPage extends StatelessWidget {
  const DailyTaskListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          sliverAppBar(),
          addTaskButton(context),
          taskSliverList(),
        ],
      ),
    );
  }

  SliverToBoxAdapter addTaskButton(BuildContext context) {
    return SliverToBoxAdapter(
          child: Bullet(
            onPressed: () => Routes.openCreateTaskPage(context),
            color: PURPLE,
            child: Text(
              '+ Nova atividade',
              style: BOLD.copyWith(color: WHITE),
            ).padding(0, vertical: 4, horizontal: 10),
          ).padding(0, vertical: 20),
        );
  }

  SliverList taskSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return TaskCard();
        },
        childCount: 10,
      ),
    );
  }

  SliverAppBar sliverAppBar() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: ORANGE,
      expandedHeight: 150.0,
      shape: ROUNDED_HEADER_SHAPE,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Healthy Routine',
          style: BOLD.copyWith(
            color: WHITE,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
