import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'favirote_model.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDatabase();
      return _db!;
    } else {
      return _db!;
    }
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'FaviroteModel.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE FaviroteModel (id INTEGER PRIMARY KEY AUTOINCREMENT,patientName TEXT NOT NULL, result TEXT NOT NULL, rate DOUBLE NOT NULL, date TEXT NOT NULL)");
  }

  Future<FaviroteModel> insert(FaviroteModel faviroteModel) async {
    var dbClient = await db;
    await dbClient!.insert('faviroteModel', faviroteModel.toMap());
    return faviroteModel;
  }

  Future<List<FaviroteModel>> getCartList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> resQuery =
        await dbClient!.query('FaviroteModel');
    return resQuery.map((e) => FaviroteModel.fromMap(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;

    return await dbClient!.delete(
      'FaviroteModel',
      where: ' id = ?',
      whereArgs: [id],
    );
  }
}
