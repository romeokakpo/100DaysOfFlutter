import 'package:day7/app/models/list_model.dart';
import 'package:day7/app/models/task_model.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class DBService {
  Database? _db;
  final int _version = 1;
  final String _dbfile = "todo.db";
  final String _listTable = "lists";
  final String _taskTable = "tasks";

  Future<Database?> get db async {
    _db ??= await initDb();
    return _db;
  }

  _onConfigure(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON");
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $_listTable(list_id INTEGER NOT NULL PRIMARY KEY, title VARCHAR(50) NOT NULL, l_date DATE NOT NULL,color BIGINT NOT NULL, status VARCHAR(30) DEFAULT \'PENDING\');');
    await db.execute(
        'CREATE TABLE $_taskTable(task_id INTEGER NOT NULL PRIMARY KEY,list_id INTEGER, title VARCHAR(150) NOT NULL, status VARCHAR(30) DEFAULT \'DONE\',FOREIGN KEY (list_id) REFERENCES $_listTable (list_id)  ON DELETE CASCADE   ON UPDATE NO ACTION);');
  }

  Future<Database?> initDb() async {
    try {
      String path = '${await getDatabasesPath()}$_dbfile';
      _db = await openDatabase(path,
          version: _version, onConfigure: _onConfigure, onCreate: _onCreate);
      print("DB: Database created !");
    } catch (e) {
      print('DB: initDb Method Error! = $e');
    }
    return _db;
  }

  //Get all list in database
  Future<List<ListModel>> getLists() async {
    Database? mydb = await db;

    var biglist = await mydb!.query(_listTable);

    List<TaskModel> tasks; //List of Lists of Task
    List<ListModel> lists = []; //List of Lists of Task

    for (var e in biglist) {
      var bigtasks =
          await mydb.query(_taskTable, where: "task_id = ${e['list_id']}");

      tasks = [];
      for (var task in bigtasks) {
        tasks.add(TaskModel.fromMap(task));
      }

      lists.add(ListModel.fromMap({...e, "tasks": tasks}));
    }
    return lists;
  }

  //Insert new record of lists in database
  Future<int> insertList(ListModel list) async {
    Database? mydb = await db;

    return await mydb!.insert(_listTable, list.toMap());
  }
}
