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
          padding: EdgeInsets.only(top: 16),
        ),
      ),
    );
  }

  SliverList taskSliverList(BuildContext context) {
    List<Task> list = [
      Task(
        name: "Pensar na Vida",
        status: TaskStatus.pending,
        type: CategoryType.mindfulness,
        recurrence: [Weekday.monday],
        startTime: TimeOfDay(hour: 12, minute: 00),
        endTime: TimeOfDay(hour: 17, minute: 00),
      ),
      Task(
        name: "Academia",
        status: TaskStatus.pending,
        type: CategoryType.exercise,
        recurrence: [Weekday.monday],
        startTime: TimeOfDay(hour: 12, minute: 00),
        endTime: TimeOfDay(hour: 17, minute: 00),
      ),
      Task(
        name: "Estudar GIT",
        status: TaskStatus.pending,
        type: CategoryType.learning,
        recurrence: [Weekday.monday],
        startTime: TimeOfDay(hour: 12, minute: 00),
        endTime: TimeOfDay(hour: 17, minute: 00),
      ),
      Task(
        name: "Almoço",
        status: TaskStatus.pending,
        type: CategoryType.selfCare,
        recurrence: [Weekday.monday],
        startTime: TimeOfDay(hour: 12, minute: 00),
        endTime: TimeOfDay(hour: 17, minute: 00),
      ),
      Task(
        name: "Estudar Flutter",
        status: TaskStatus.pending,
        type: CategoryType.learning,
        recurrence: [Weekday.monday],
        startTime: TimeOfDay(hour: 12, minute: 00),
        endTime: TimeOfDay(hour: 17, minute: 00),
      ),
      Task(
        name: "Meditar",
        status: TaskStatus.pending,
        type: CategoryType.mindfulness,
        recurrence: [Weekday.monday],
        startTime: TimeOfDay(hour: 12, minute: 00),
        endTime: TimeOfDay(hour: 17, minute: 00),
      ),
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            child: TaskCard(task: list[index]),
          );
        },
        childCount: list.length,
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
