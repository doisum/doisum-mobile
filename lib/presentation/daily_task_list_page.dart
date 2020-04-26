import 'package:flutter/material.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';
import 'package:sqflite/sqflite.dart';

class DailyTaskListPage extends StatelessWidget {
  const DailyTaskListPage({Key key}) : super(key: key);

  void saveTask() async {
    print('save task');
    Task t = Task(
      name: 'Elias',
      status: TaskStatus.done,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      recurrence: [Weekday.sunday, Weekday.monday],
    );
    Database db = await DatabaseProvider.database();
    TaskDatabaseService service = TaskDatabaseService(database: db);
    int created = await service.addTask(t);
    print(created);
  }

  void listAll() async {
    print('list tasks');
    Database db = await DatabaseProvider.database();
    TaskDatabaseService service = TaskDatabaseService(database: db);
    print(await service.listTasks());
  }

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
