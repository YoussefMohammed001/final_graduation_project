/// apiStatus : "true"
/// predicted : "You have heart disease, please consult a Doctor."

class HeartDiseaseModel {
  HeartDiseaseModel({
      String? apiStatus, 
      String? predicted,}){
    _apiStatus = apiStatus;
    _predicted = predicted;
}

  HeartDiseaseModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _predicted = json['predicted'];
  }
  String? _apiStatus;
  String? _predicted;

  String get apiStatus => _apiStatus ?? "";
  String get predicted => _predicted ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    map['predicted'] = _predicted;
    return map;
  }

}