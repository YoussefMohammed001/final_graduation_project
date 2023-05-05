/// apiStatus : true
/// data : {"patientName":"soha","email":"soha@gmail.com","patientNote":"beatiful"}
/// message : "massage send successfully"

class ContactUsModel {
  ContactUsModel({
      bool? apiStatus, 
      Data? data, 
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  ContactUsModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  Data? _data;
  String? _message;

  bool? get apiStatus => _apiStatus;
  Data? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// patientName : "soha"
/// email : "soha@gmail.com"
/// patientNote : "beatiful"

class Data {
  Data({
      String? patientName, 
      String? email, 
      String? patientNote,}){
    _patientName = patientName;
    _email = email;
    _patientNote = patientNote;
}

  Data.fromJson(dynamic json) {
    _patientName = json['patientName'];
    _email = json['email'];
    _patientNote = json['patientNote'];
  }
  String? _patientName;
  String? _email;
  String? _patientNote;

  String get patientName => _patientName ?? "";
  String get email => _email ?? "";
  String get patientNote => _patientNote ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['patientName'] = _patientName;
    map['email'] = _email;
    map['patientNote'] = _patientNote;
    return map;
  }

}