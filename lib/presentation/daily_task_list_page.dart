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
      body: Center(
          child: Column(children: [
        RaisedButton(
          onPressed: saveTask,
          child: const Text('Save Task', style: TextStyle(fontSize: 20)),
        ),
        RaisedButton(
          onPressed: listAll,
          child: const Text(
            'Print all Tasks from database',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ])),
    );
  }
}
