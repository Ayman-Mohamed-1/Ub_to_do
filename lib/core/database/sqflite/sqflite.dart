import 'package:sqflite/sqflite.dart';
import 'package:up_to_do/features/task/data/model/taskModel.dart';

class SqfliteHelper {
  late Database db;
  //!1 create DB
  //!2. create table
  //!3. CRUD => create - read - update - delete
  Future<Database> intiDB() async {
    return await openDatabase(
      "task.dp",
      version: 2,
      onCreate: (db, version) async {
        return await db
            .execute('''
          CREATE TABLE Tasks (
          id INTEGER PRIMARY KEY AUTOINCREMENT ,
          title TEXT,
          task TEXT,
          date TEXT,
          startTime TEXT,
          endTime TEXT,
          color INTEGER,
          isCompleted INTEGER )
        ''')
            .then((value) => print(" DB created sucsses"));
      },
      onOpen: (db) => print("database open"),
    ).then((value) => db = value);
  }

  //?3. CRUD => create - read - update - delete
  // get
  Future<List<Map<String, Object?>>> getFromDB() async {
    return await db.rawQuery('SELECT * FROM  Tasks');
  }
  // Future<List<TaskModel>> getFromDB() async {
  //   final result = await db.rawQuery('SELECT * FROM Tasks');
  //   return result.map((e) => TaskModel.fromMap(e)).toList();
  // }
  // insert

  Future<int> insert(TaskModel model) async {
    return await db.rawInsert('''
        INSERT INTO Tasks(
            title ,task ,date ,startTime ,endTime ,color ,isCompleted )
        VALUES
          ('${model.title}','${model.task}','${model.date}','${model.startTime}',
          '${model.endTime}','${model.color}','${model.isComplete}')
        ''');
  }

  // updete
  Future<int> updateDb(int id) async {
    return await db.rawUpdate(
      '''
    UPDATE Tasks
    SET isCompleted = ?
    WHERE id = ?
   ''',
      [1, id],
    );
  }

  // delete
  Future<int> deleteDb(int id) async {
    return await db.rawDelete('''DELETE FROM Tasks WHERE id = ?''', [id]);
  }
}
