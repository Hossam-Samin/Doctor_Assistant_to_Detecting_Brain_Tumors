import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'db_helper.dart';
import 'favirote_model.dart';

class FavProvider with ChangeNotifier {
  DBHelper dbHelper = DBHelper();
  int _counter = 0;
  int get counter => _counter;

  late Future<List<FaviroteModel>> _cart;
  Future<List<FaviroteModel>> get cart => _cart;
  Future<List<FaviroteModel>> getData() async {
    _cart = dbHelper.getCartList();
    return _cart;
  }

  void _setPrefItems() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('counter', _counter);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _counter = preferences.getInt('counter') ?? 0;
    notifyListeners();
  }

  // Counter
  void addCounter() {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefItems();
    return _counter;
  }
}
