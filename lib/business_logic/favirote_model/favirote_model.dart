import 'dart:io';

class FaviroteModel {
  dynamic id;
  String? patientName;
  String? result;
  double? rate;
  String? date;
  // File? image;

  FaviroteModel({
    this.id,
    required this.patientName,
    required this.result,
    required this.rate,
    required this.date,
    // required this.image,
  });

  FaviroteModel.fromMap(Map<dynamic, dynamic> fromMap) {
    id = fromMap['id'];
    patientName = fromMap['patientName'];
    result = fromMap['result'];
    rate = fromMap['rate'];
    date = fromMap['date'];
    // image = fromMap['image'];
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'patientName': patientName,
      'result': result,
      'rate': rate,
      'date': date,
      // 'image': image,
    };
  }
}
