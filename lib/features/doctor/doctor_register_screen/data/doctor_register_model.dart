/// apiStatus : true
/// doctor : {"name":"youssef","status":"pending","Isverified":false,"email":"ym@gmail.com","isAdmin":false,"isDoctor":true,"phone":1211829505,"profilePicture":{"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"},"_id":"6435e5e5eaaa4c2f3521b708","createdAt":"2023-04-11T22:57:41.497Z","updatedAt":"2023-04-11T22:57:47.602Z","uniqueString":2397}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDM1ZTVlNWVhYWE0YzJmMzUyMWI3MDgiLCJpYXQiOjE2ODEyNTM4NjF9.n0t-TF1mNkgfD3H6MW0MWTAkm0iEv4G67ONK4aei_Xc"
/// massage : "doctor added success"

class DoctorRegisterModel {
  DoctorRegisterModel({
      bool? apiStatus, 
      Doctor? doctor, 
      String? token, 
      String? massage,}){
    _apiStatus = apiStatus;
    _doctor = doctor;
    _token = token;
    _massage = massage;
}

  DoctorRegisterModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    _token = json['token'];
    _massage = json['massage'];
  }
  bool? _apiStatus;
  Doctor? _doctor;
  String? _token;
  String? _massage;

  bool get apiStatus => _apiStatus ?? false;
  Doctor get doctor => _doctor ?? doctor;
  String get token => _token ?? "";
  String get massage => _massage ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_doctor != null) {
      map['doctor'] = _doctor?.toJson();
    }
    map['token'] = _token;
    map['massage'] = _massage;
    return map;
  }

}

/// name : "youssef"
/// status : "pending"
/// Isverified : false
/// email : "ym@gmail.com"
/// isAdmin : false
/// isDoctor : true
/// phone : 1211829505
/// profilePicture : {"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"}
/// _id : "6435e5e5eaaa4c2f3521b708"
/// createdAt : "2023-04-11T22:57:41.497Z"
/// updatedAt : "2023-04-11T22:57:47.602Z"
/// uniqueString : 2397

class Doctor {
  Doctor({
      String? name, 
      String? status, 
      bool? isverified, 
      String? email, 
      bool? isAdmin, 
      bool? isDoctor, 
      num? phone, 
      ProfilePicture? profilePicture, 
      String? id, 
      String? createdAt, 
      String? updatedAt, 
      num? uniqueString,}){
    _name = name;
    _status = status;
    _isverified = isverified;
    _email = email;
    _isAdmin = isAdmin;
    _isDoctor = isDoctor;
    _phone = phone;
    _profilePicture = profilePicture;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _uniqueString = uniqueString;
}

  Doctor.fromJson(dynamic json) {
    _name = json['name'];
    _status = json['status'];
    _isverified = json['Isverified'];
    _email = json['email'];
    _isAdmin = json['isAdmin'];
    _isDoctor = json['isDoctor'];
    _phone = json['phone'];
    _profilePicture = json['profilePicture'] != null ? ProfilePicture.fromJson(json['profilePicture']) : null;
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _uniqueString = json['uniqueString'];
  }
  String? _name;
  String? _status;
  bool? _isverified;
  String? _email;
  bool? _isAdmin;
  bool? _isDoctor;
  num? _phone;
  ProfilePicture? _profilePicture;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  num? _uniqueString;

  String get name => _name ?? "";
  String get status => _status ?? "";
  bool get isverified => _isverified ?? false;
  String get email => _email ?? "";
  bool get isAdmin => _isAdmin ?? false;
  bool get isDoctor => _isDoctor ?? false;
  num get phone => _phone ?? 0;
  ProfilePicture get profilePicture => _profilePicture ?? profilePicture;
  String get id => _id ?? "";
  String get createdAt => _createdAt ?? "";
  String get updatedAt => _updatedAt ?? "";
  num get uniqueString => _uniqueString ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['status'] = _status;
    map['Isverified'] = _isverified;
    map['email'] = _email;
    map['isAdmin'] = _isAdmin;
    map['isDoctor'] = _isDoctor;
    map['phone'] = _phone;
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

  String get url => _url ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    return map;
  }

}