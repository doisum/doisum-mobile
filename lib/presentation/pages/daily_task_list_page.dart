import 'package:flutter/material.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class DailyTaskListPage extends StatelessWidget {
  const DailyTaskListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PURPLE,
      body: CustomScrollView(
        slivers: <Widget>[
          sliverAppBar(),
          roundCorners(context),
          taskSliverList(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Routes.openCreateTaskPage(context),
        tooltip: 'Nova atividade',
        child: const Icon(Icons.add),
        backgroundColor: PURPLE,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
      ),
    );
  }

  SliverToBoxAdapter roundCorners(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        child: Container(
          padding: EdgeInsets.only(top: 16, left: 24, bottom: 0),
          child: Text(
            'Hoje',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: PURPLE,
            ),
          ),
        ),
      ),
    );
  }

  SliverList taskSliverList(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
              child: TaskCard());
        },
        childCount: 10,
      ),
    );
  }

  SliverAppBar sliverAppBar() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: PURPLE,
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
