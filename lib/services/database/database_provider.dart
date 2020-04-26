import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static Future<Database> database() async {
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'tasks_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, status TEXT, frequence TEXT, startDate TEXT, endDate TEXT)",
        );
      },
      version: 1,
    );
    return database;
  }
}
