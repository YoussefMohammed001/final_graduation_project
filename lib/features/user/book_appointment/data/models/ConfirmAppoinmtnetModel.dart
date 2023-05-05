/// apiStatus : true
/// data : {"doctorName":"Mohamed Ahmed","patientName":"Soha Ahmed","patientPhone":"01554176096","from":"10","to":"10.5","doctorImg":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682454542/doctorImages/bsqz98e0h73wd0oncevi.jpg"}
/// message : "success"

class ConfirmAppoinmtnetModel {
  ConfirmAppoinmtnetModel({
      bool? apiStatus, 
      Data? data, 
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  ConfirmAppoinmtnetModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  Data? _data;
  String? _message;

  bool get apiStatus => _apiStatus ?? false;
  Data get data => _data ?? data;
  String get message => _message ?? "";

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

/// doctorName : "Mohamed Ahmed"
/// patientName : "Soha Ahmed"
/// patientPhone : "01554176096"
/// from : "10"
/// to : "10.5"
/// doctorImg : "https://res.cloudinary.com/dlivgib8n/image/upload/v1682454542/doctorImages/bsqz98e0h73wd0oncevi.jpg"

class Data {
  Data({
      String? doctorName, 
      String? patientName, 
      String? patientPhone, 
      String? from, 
      String? to, 
      String? doctorImg,}){
    _doctorName = doctorName;
    _patientName = patientName;
    _patientPhone = patientPhone;
    _from = from;
    _to = to;
    _doctorImg = doctorImg;
}

  Data.fromJson(dynamic json) {
    _doctorName = json['doctorName'];
    _patientName = json['patientName'];
    _patientPhone = json['patientPhone'];
    _from = json['from'];
    _to = json['to'];
    _doctorImg = json['doctorImg'];
  }
  String? _doctorName;
  String? _patientName;
  String? _patientPhone;
  String? _from;
  String? _to;
  String? _doctorImg;

  String get doctorName => _doctorName ?? "";
  String get patientName => _patientName ?? "";
  String get patientPhone => _patientPhone ?? "";
  String get from => _from ?? "";
  String get to => _to ?? "";
  String get doctorImg => _doctorImg ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctorName'] = _doctorName;
    map['patientName'] = _patientName;
    map['patientPhone'] = _patientPhone;
    map['from'] = _from;
    map['to'] = _to;
    map['doctorImg'] = _doctorImg;
    return map;
  }

}