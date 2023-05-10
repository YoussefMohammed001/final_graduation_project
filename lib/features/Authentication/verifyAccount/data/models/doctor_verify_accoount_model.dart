/// apiStatus : true
/// data : {"doctor":{"_id":"6457e2f2d244e3e1d8e9173c"},"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDU3ZTJlZGQyNDRlM2UxZDhlOTE3MzkiLCJpYXQiOjE2ODM0ODEzMjV9.VDwCpX4JnselO1T4T-o3XXOsgSvbkeCqVVSzbW8buW4"}
/// message : "verified"

class DoctorVerifyAccoountModel {
  DoctorVerifyAccoountModel({
      bool? apiStatus, 
      Data? data, 
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  DoctorVerifyAccoountModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  Data? _data;
  String? _message;

  bool get apiStatus => _apiStatus ?? false;
  Data get data => _data ?? Data();
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

/// doctor : {"_id":"6457e2f2d244e3e1d8e9173c"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDU3ZTJlZGQyNDRlM2UxZDhlOTE3MzkiLCJpYXQiOjE2ODM0ODEzMjV9.VDwCpX4JnselO1T4T-o3XXOsgSvbkeCqVVSzbW8buW4"

class Data {
  Data({
      Doctor? doctor, 
      String? token,}){
    _doctor = doctor;
    _token = token;
}

  Data.fromJson(dynamic json) {
    _doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    _token = json['token'];
  }
  Doctor? _doctor;
  String? _token;

  Doctor get doctor => _doctor ?? Doctor();
  String  get token => _token ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_doctor != null) {
      map['doctor'] = _doctor?.toJson();
    }
    map['token'] = _token;
    return map;
  }

}

/// _id : "6457e2f2d244e3e1d8e9173c"

class Doctor {
  Doctor({
      String? id,}){
    _id = id;
}

  Doctor.fromJson(dynamic json) {
    _id = json['_id'];
  }
  String? _id;

  String get id => _id ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    return map;
  }

}