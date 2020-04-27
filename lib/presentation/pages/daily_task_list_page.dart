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

    List<Task> tasks = [
      new Task(id: 1, name: 'Flexão', startDate: DateTime.now(), endDate: DateTime.now(), recurrence: [Weekday.monday, Weekday.sunday, Weekday.saturday]),
      new Task(id: 1, name: 'Meditar', startDate: DateTime.now(), endDate: DateTime.now(), recurrence: [Weekday.monday]),
      new Task(id: 1, name: 'Brincar com o Cachorro', startDate: DateTime.now(), endDate: DateTime.now(), recurrence: [Weekday.saturday]),
      new Task(id: 1, name: 'Ler 10 páginas de um livro', startDate: DateTime.now(), endDate: DateTime.now(), recurrence: [Weekday.wednesday, Weekday.thursday]),
      new Task(id: 1, name: 'Jogar Vídeo game', startDate: DateTime.now(), endDate: DateTime.now(), recurrence: [Weekday.friday]),
      new Task(id: 1, name: 'Ligar para a Ana', startDate: DateTime.now(), endDate: DateTime.now(), recurrence: [Weekday.sunday, Weekday.saturday]),
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
              child: TaskCard(tasks.elementAt(index)));
        },
        childCount: tasks.length,
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
