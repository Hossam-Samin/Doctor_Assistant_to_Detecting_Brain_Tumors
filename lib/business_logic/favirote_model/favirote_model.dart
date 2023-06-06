class FaviroteModel {
  String? patientName;
  String? result;
  String? rate;
  // String? image;
  String? date;
  String? time;

  FaviroteModel(
      {required this.result,
      required this.rate,
      required this.patientName,
      // required this.image,
      required this.date,
      required this.time});

  FaviroteModel.fromMap(Map<String, dynamic> fromMap) {
    result = fromMap['label'];
    rate = fromMap['rate'];
    patientName = fromMap['patientName'];
    date = fromMap['date'];
    time = fromMap['time'];
  }

  Map<String, Object> toMap() {
    return {
      'label': result!,
      'rate': rate!,
      'patientName': patientName!,
      'date': date!,
      'time': time!,
    };
  }
}


 


// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// // part 'favirote_model.g.dart';

// @HiveType(typeId: 0)
// class FaviroteModel extends HiveObject {
//   // final String patientName;
//   @HiveField(0)
//   final String label;
//   @HiveField(1)
//   final String rate;
//   @HiveField(2)
//   final String image;
//   @HiveField(3)
//   final String date;
//   @HiveField(4)
//   final String time;

//   FaviroteModel(
//       {required this.label,
//       required this.rate,
//       required this.image,
//       required this.date,
//       required this.time});
// }
