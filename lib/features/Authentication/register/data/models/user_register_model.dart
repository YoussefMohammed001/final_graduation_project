/// apiStatus : true
/// data : {"Patient":{"name":"nohaaa","Isverified":false,"email":"yoseffmohamed001@gmail.com","isAdmin":false,"isDoctor":false,"RandomNumber":"","phone":10101010,"isPatient":true,"profilePicture":{"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"},"_id":"645f71b51f6a27198eb0d999","createdAt":"2023-05-13T11:17:09.560Z","updatedAt":"2023-05-13T11:17:14.196Z","uniqueString":5410},"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDVmNzFiNTFmNmEyNzE5OGViMGQ5OTkiLCJpYXQiOjE2ODM5NzY2Mjl9.Y8TdoJrBpyZlgLHDOIsLyVgBhFs0wYU8vcw5CtiQ0B0"}
/// massage : "patient added success"

class UserRegisterModel {
  UserRegisterModel({
      bool? apiStatus, 
      Data? data, 
      String? massage,}){
    _apiStatus = apiStatus;
    _data = data;
    _massage = massage;
}

  UserRegisterModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _massage = json['massage'];
  }
  bool? _apiStatus;
  Data? _data;
  String? _massage;

  bool get apiStatus => _apiStatus ?? false;
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

/// Patient : {"name":"nohaaa","Isverified":false,"email":"yoseffmohamed001@gmail.com","isAdmin":false,"isDoctor":false,"RandomNumber":"","phone":10101010,"isPatient":true,"profilePicture":{"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"},"_id":"645f71b51f6a27198eb0d999","createdAt":"2023-05-13T11:17:09.560Z","updatedAt":"2023-05-13T11:17:14.196Z","uniqueString":5410}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDVmNzFiNTFmNmEyNzE5OGViMGQ5OTkiLCJpYXQiOjE2ODM5NzY2Mjl9.Y8TdoJrBpyZlgLHDOIsLyVgBhFs0wYU8vcw5CtiQ0B0"

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

  Patient get patient => _patient ?? Patient();
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

/// name : "nohaaa"
/// Isverified : false
/// email : "yoseffmohamed001@gmail.com"
/// isAdmin : false
/// isDoctor : false
/// RandomNumber : ""
/// phone : 10101010
/// isPatient : true
/// profilePicture : {"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"}
/// _id : "645f71b51f6a27198eb0d999"
/// createdAt : "2023-05-13T11:17:09.560Z"
/// updatedAt : "2023-05-13T11:17:14.196Z"
/// uniqueString : 5410

class Patient {
  Patient({
      String? name, 
      bool? isverified, 
      String? email, 
      bool? isAdmin, 
      bool? isDoctor, 
      String? randomNumber, 
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
    _randomNumber = randomNumber;
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
    _randomNumber = json['RandomNumber'];
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
  String? _randomNumber;
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
  String get randomNumber => _randomNumber ?? "";
  num get phone => _phone ?? 0;
  bool get isPatient => _isPatient ?? false;
  ProfilePicture get profilePicture => _profilePicture ?? ProfilePicture();
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
    map['RandomNumber'] = _randomNumber;
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