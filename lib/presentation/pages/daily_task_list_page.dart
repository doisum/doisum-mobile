import 'package:flutter/material.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class DailyTaskListPage extends StatelessWidget {
  const DailyTaskListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          sliverAppBar(),
          taskSliverList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Routes.openCreateTaskPage(context),
          tooltip: 'Nova atividade',
          child: const Icon(Icons.add),
          backgroundColor: PURPLE,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))
          ),
      ),
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
      backgroundColor: PURPLE.withOpacity(0.9),
      expandedHeight: 150.0,
      // shape: ROUNDED_HEADER_SHAPE,
      // bottom: PreferredSize(child: PageHeader(), preferredSize: Size.fromHeight(90),),
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
