import 'dart:async';
import 'package:flutter/material.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class DailyTaskListPage extends StatelessWidget {
  final NotificationService notificationService;
  final Future<TaskDatabaseService> taskDatabase;

  const DailyTaskListPage({
    Key key,
    this.notificationService,
    @required this.taskDatabase,
  }) : super(key: key);

  Future<List<Task>> listTasks() async {
    var database = await taskDatabase;
    return database.listTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TwoColorBackground(
        child: content(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Routes.openCreateTaskPage(context),
        tooltip: 'Nova atividade',
        child: const Icon(Icons.add, size: 24),
      ),
    );
  }

  CustomScrollView content(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        sliverAppBar(context),
        roundCorners(context),
        FutureBuilder(
          future: listTasks(),
          builder: (context, projectSnap) {
            return taskSliverList(context, projectSnap.data);
          },
        )
      ],
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
          padding: EdgeInsets.only(top: 16),
        ),
      ),
    );
  }

  SliverList taskSliverList(BuildContext context, List<dynamic> tasks) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            child: TaskCard(
              tasks.elementAt(index),
            ).padding(0, horizontal: 20, vertical: 10),
          );
        },
        childCount: tasks?.length ?? 0,
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
        titlePadding: EdgeInsets.all(35),
      ),
      bottom: PreferredSize(
        child: Column(
          children: [
            Text(
              'segunda-feira',
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(height: 16),
          ],
        ),
        preferredSize: Size.fromHeight(20),
      ),
    );
  }
}
