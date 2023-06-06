import 'package:flutter_application_1/business_logic/favirote_model/favirote_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'FaviroteModel.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("Create Table Cart (ID primary Keym Product ID)");
  }

  join(String path, String s) {}
  Future<FaviroteModel> insert(FaviroteModel faviroteModel) async {
    var dbClient = await db;
    await dbClient!.insert('faviroteModel', faviroteModel.toMap());
    return faviroteModel;
  }
}
