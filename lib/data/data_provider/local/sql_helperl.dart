import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';

import '../../Models/notes_model.dart';

class SqlHelper {
  static Database? _db;

  //getter to initialize database if there's no initial database
  static Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  //initialize DB
  static initialDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "FavModel.db");
    print(path);
    var myDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return myDB;
  }

  //Create DB
  static _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE FavModel (id INTEGER PRIMARY KEY,patientName TEXT NOT NULL,result TEXT NOT NULL,rate DOUBLE NOT NULL)');
  }

  //Insert in DB
  static insertDB(Map<String, dynamic> data) async {
    Database? dbClient = await db;
    var result = await dbClient!.insert("FavModel", data);
    print(result);
    return result;
  }

  //Delete all of DB
  static deleteDB(int id) async {
    Database? dbClient = await db;
    var result = await dbClient!.delete("DELETE FROM FavModel WHERE id = $id");
    // rawUpdate("DELETE FROM FavModel WHERE ID = $id");
    print(result);
    return result;
  }

  // //Update in DB
  // static updateDB(int id, String title, String description, String date) async {
  //   Database? dbClient = await db;
  //   var result = await dbClient?.rawUpdate(
  //       "Update Notes SET Title = '$title', Description = '$description', Date = '$date' Where ID = $id");
  //   print(result);
  //   return result;
  // }

  // //Get only one row in DB by id & title
  // static getOneRowDB(int id, String title, String description) async {
  //   Database? dbClient = await db;
  //   var result = await dbClient!.query("Notes", where: "ID = $id");
  //   print(result);
  //   return result;
  // }

  //Get all rows in DB
  static getAllDB() async {
    List<FavModel> FavList = [];
    Database? dbClient = await db;
    var result = await dbClient!.query("FavModel");
    for (var i in result) {
      FavList.add(FavModel(
          id: i["id"],
          patientName: i["patientName"],
          result: i["result"],
          rate: i["rate"]));
    }
    print(FavList);
    return FavList;
  }
}
