/// apiStatus : true
/// data : {"Patient":{"name":"Youssef Mohamed","Isverified":false,"email":"yousseffdev3011@gmail.com","isAdmin":false,"isDoctor":false,"phone":1211829500,"isPatient":true,"profilePicture":{"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"},"_id":"643573141f026e9eaed9e603","createdAt":"2023-04-11T14:47:48.091Z","updatedAt":"2023-04-11T14:47:52.122Z","uniqueString":1869},"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDM1NzMxNDFmMDI2ZTllYWVkOWU2MDMiLCJpYXQiOjE2ODEyMjQ0Njh9.KdbVIuiPx2JVBYt00uVazIuas3GIAko4-rpcwpJF3Q8"}
/// massage : "patient added success"

class UserRegisterRequestModel {
  UserRegisterRequestModel({
      bool? apiStatus, 
      Data? data, 
      String? massage,}){
    _apiStatus = apiStatus;
    _data = data;
    _massage = massage;
}

  UserRegisterRequestModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _massage = json['massage'];
  }
  bool? _apiStatus;
  Data? _data;
  String? _massage;

  bool get apiStatus => _apiStatus ?? true;
  Data get data => _data ?? Data();
  String get massage => _massage ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['massage'] = _massage;
    return map;
  }

}

/// Patient : {"name":"Youssef Mohamed","Isverified":false,"email":"yousseffdev3011@gmail.com","isAdmin":false,"isDoctor":false,"phone":1211829500,"isPatient":true,"profilePicture":{"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"},"_id":"643573141f026e9eaed9e603","createdAt":"2023-04-11T14:47:48.091Z","updatedAt":"2023-04-11T14:47:52.122Z","uniqueString":1869}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDM1NzMxNDFmMDI2ZTllYWVkOWU2MDMiLCJpYXQiOjE2ODEyMjQ0Njh9.KdbVIuiPx2JVBYt00uVazIuas3GIAko4-rpcwpJF3Q8"

class Data {
  Data({
      Patient? patient, 
      String? token,}){
    _patient = patient;
    _token = token;
}

  Data.fromJson(dynamic json) {
    _patient = json['Patient'] != null ? Patient.fromJson(json['Patient']) : null;
    _token = json['token'];
  }
  Patient? _patient;
  String? _token;

  Patient get patient => _patient ?? patient;
  String get token => _token ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_patient != null) {
      map['Patient'] = _patient?.toJson();
    }
    map['token'] = _token;
    return map;
  }

}

/// name : "Youssef Mohamed"
/// Isverified : false
/// email : "yousseffdev3011@gmail.com"
/// isAdmin : false
/// isDoctor : false
/// phone : 1211829500
/// isPatient : true
/// profilePicture : {"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"}
/// _id : "643573141f026e9eaed9e603"
/// createdAt : "2023-04-11T14:47:48.091Z"
/// updatedAt : "2023-04-11T14:47:52.122Z"
/// uniqueString : 1869

class Patient {
  Patient({
      String? name, 
      bool? isverified, 
      String? email, 
      bool? isAdmin, 
      bool? isDoctor, 
      num? phone, 
      bool? isPatient, 
      ProfilePicture? profilePicture, 
      String? id, 
      String? createdAt, 
      String? updatedAt, 
      num? uniqueString,}){
    _name = name;
    _isverified = isverified;
    _email = email;
    _isAdmin = isAdmin;
    _isDoctor = isDoctor;
    _phone = phone;
    _isPatient = isPatient;
    _profilePicture = profilePicture;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _uniqueString = uniqueString;
}

  Patient.fromJson(dynamic json) {
    _name = json['name'];
    _isverified = json['Isverified'];
    _email = json['email'];
    _isAdmin = json['isAdmin'];
    _isDoctor = json['isDoctor'];
    _phone = json['phone'];
    _isPatient = json['isPatient'];
    _profilePicture = json['profilePicture'] != null ? ProfilePicture.fromJson(json['profilePicture']) : null;
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _uniqueString = json['uniqueString'];
  }
  String? _name;
  bool? _isverified;
  String? _email;
  bool? _isAdmin;
  bool? _isDoctor;
  num? _phone;
  bool? _isPatient;
  ProfilePicture? _profilePicture;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  num? _uniqueString;

  String get name => _name ?? "";
  bool get isverified => _isverified ?? false;
  String get email => _email ?? "";
  bool get isAdmin => _isAdmin ?? false;
  bool get isDoctor => _isDoctor ?? false;
  num get phone => _phone ?? 0;
  bool get isPatient => _isPatient ?? false;
  ProfilePicture get profilePicture => _profilePicture ?? profilePicture;
  String get id => _id ?? "";
  String get createdAt => _createdAt ?? "";
  String get updatedAt => _updatedAt ?? "";
  num get uniqueString => _uniqueString ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['Isverified'] = _isverified;
    map['email'] = _email;
    map['isAdmin'] = _isAdmin;
    map['isDoctor'] = _isDoctor;
    map['phone'] = _phone;
    map['isPatient'] = _isPatient;
    if (_profilePicture != null) {
      map['profilePicture'] = _profilePicture?.toJson();
    }
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['uniqueString'] = _uniqueString;
    return map;
  }

}

/// url : "https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"

class ProfilePicture {
  ProfilePicture({
      String? url,}){
    _url = url;
}

  ProfilePicture.fromJson(dynamic json) {
    _url = json['url'];
  }
  String? _url;

  String get url => _url ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    return map;
  }

}