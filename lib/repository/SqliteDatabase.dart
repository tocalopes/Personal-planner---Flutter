//sqlite database implementation
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDatabase{
  
  static final SqliteDatabase _instance = SqliteDatabase.internal();
  factory SqliteDatabase() => _instance;

  SqliteDatabase.internal();

  Database _db;
  
  Future<Database> get db async{
    if(_db != null){
      return _db;
    }else{
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async{
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "planner.db");
    return await openDatabase(
      path,
      version:1,
      onCreate: (Database db, int newerVersion) async {
        await.dbexecute(
          CREATE TABLE
        );
      }
    );
  }
  /*Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contactsnew.db");

    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute(
        "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT,"
            "$phoneColumn TEXT, $imgColumn TEXT)"
      );
    });
  }*/
}
