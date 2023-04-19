/// apiStatus : "true"
/// predicted : "You have Diabetes, please consult a Doctor."

class DiabetesPredictionModel {
  DiabetesPredictionModel({
      String? apiStatus, 
      String? predicted,}){
    _apiStatus = apiStatus;
    _predicted = predicted;
}

  DiabetesPredictionModel.fromJson(dynamic json) {
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