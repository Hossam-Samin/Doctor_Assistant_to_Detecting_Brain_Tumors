import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavProvider with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  String _result = "";
  String get result => _result;

  String _rate = "";
  String get rate => _rate;

  String _image = "";
  String get image => _image;

  String _date = "";
  String get date => _date;

  String _time = "";
  String get time => _time;

  void _setPrefItems() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getInt(_counter.toString());
    preferences.getString(_result);
    preferences.getString(_rate);
    preferences.getString(_image);
    preferences.getString(_date);
    preferences.getString(_time);
  }

  void _getPrefItems() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _counter = preferences.getInt('counter_Items') ?? 0;
    _result = preferences.getString('result_MRI') ?? "";
    _rate = preferences.getString('rate_MRI') ?? "";
    _image = preferences.getString('image_MRI') ?? "";
    _date = preferences.getString('date_MRI') ?? "";
    _time = preferences.getString('time_MRI') ?? "";
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

  // Result
  void addResult(String result) {
    _result = result;
    _setPrefItems();
    notifyListeners();
  }

  void removeResult(String result) {
    _result = result;
    _setPrefItems();
    notifyListeners();
  }

  String getResult() {
    _getPrefItems();
    return _result;
  }

  // Rate
  void addRate(String rate) {
    _rate = rate;
    _setPrefItems();
    notifyListeners();
  }

  void removeRate(String rate) {
    _rate = rate;
    _setPrefItems();
    notifyListeners();
  }

  String getRate() {
    _getPrefItems();
    return _rate;
  }

  // Image
  void addImage(String image) {
    _image = image;
    _setPrefItems();
    notifyListeners();
  }

  void removeImage(String image) {
    _image = image;
    _setPrefItems();
    notifyListeners();
  }

  String getImage() {
    _getPrefItems();
    return _image;
  }

  // Date
  void addDate(String date) {
    _date = date;
    _setPrefItems();
    notifyListeners();
  }

  void removeDate(String date) {
    _date = date;
    _setPrefItems();
    notifyListeners();
  }

  String getDate() {
    _getPrefItems();
    return _date;
  }

  // Time
  void addTime(String time) {
    _time = time;
    _setPrefItems();
    notifyListeners();
  }

  void removeTime(String time) {
    _time = time;
    _setPrefItems();
    notifyListeners();
  }

  String getTime() {
    _getPrefItems();
    return _time;
  }
}
