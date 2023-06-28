class FavModel {
  var id;
  var patientName;
  var result;
  var rate;

  FavModel({
    required this.id,
    required this.patientName,
    required this.result,
    required this.rate,
  });

  FavModel.fromMap(Map<dynamic, dynamic> fromMap) {
    // image = fromMap['image'];
    id = fromMap['id'];
    result = fromMap['result'];
    rate = fromMap['rate'];
    patientName = fromMap['patientName'];
  }

  Map<String, Object?> toMap() {
    return {
      // 'image': image!,
      'id': id,
      'result': result,
      'rate': rate,
      'patientName': patientName,
    };
  }
}
