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
          sliverAppBar(context),
          roundCorners(context),
          taskSliverList(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Routes.openCreateTaskPage(context),
        tooltip: 'Nova atividade',
        child: const Icon(Icons.add),
      ),
    );
  }

  SliverToBoxAdapter roundCorners(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 16, left: 24),
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

  SliverAppBar sliverAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      expandedHeight: 150.0,
      textTheme: Theme.of(context).textTheme,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Ficar Leve',
        ),
      ),
    );
  }
}
