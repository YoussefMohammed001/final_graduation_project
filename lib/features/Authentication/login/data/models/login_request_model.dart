/// apiStatus : true
/// data : {"userData":{"profilePicture":{"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"},"_id":"6435738a1f026e9eaed9e60c","name":"Youssef Mohamed","Isverified":false,"email":"youssefffdev3011@gmail.com","isAdmin":false,"isDoctor":true,"RandomNumber":"","phone":1211829500,"createdAt":"2023-04-11T14:49:46.531Z","updatedAt":"2023-04-11T14:55:05.867Z"},"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDM1NzM4YTFmMDI2ZTllYWVkOWU2MGMiLCJpYXQiOjE2ODEyMjQ5MDV9.47IM85KaThkRmY4KMoOTqu9dnSa-_CkxvwKzMlPNrh0"}
/// message : "Logged In"

class LoginRequestModel {
  LoginRequestModel({
      bool? apiStatus, 
      Data? data, 
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  LoginRequestModel.fromJson(dynamic json) {
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

/// userData : {"profilePicture":{"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"},"_id":"6435738a1f026e9eaed9e60c","name":"Youssef Mohamed","Isverified":false,"email":"youssefffdev3011@gmail.com","isAdmin":false,"isDoctor":true,"RandomNumber":"","phone":1211829500,"createdAt":"2023-04-11T14:49:46.531Z","updatedAt":"2023-04-11T14:55:05.867Z"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDM1NzM4YTFmMDI2ZTllYWVkOWU2MGMiLCJpYXQiOjE2ODEyMjQ5MDV9.47IM85KaThkRmY4KMoOTqu9dnSa-_CkxvwKzMlPNrh0"

class Data {
  Data({
      UserData? userData, 
      String? token,}){
    _userData = userData;
    _token = token;
}

  Data.fromJson(dynamic json) {
    _userData = json['userData'] != null ? UserData.fromJson(json['userData']) : null;
    _token = json['token'];
  }
  UserData? _userData;
  String? _token;

  UserData get userData => _userData ?? userData;
  String get token => _token ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_userData != null) {
      map['userData'] = _userData?.toJson();
    }
    map['token'] = _token;
    return map;
  }

}

/// profilePicture : {"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"}
/// _id : "6435738a1f026e9eaed9e60c"
/// name : "Youssef Mohamed"
/// Isverified : false
/// email : "youssefffdev3011@gmail.com"
/// isAdmin : false
/// isDoctor : true
/// RandomNumber : ""
/// phone : 1211829500
/// createdAt : "2023-04-11T14:49:46.531Z"
/// updatedAt : "2023-04-11T14:55:05.867Z"

class UserData {
  UserData({
      ProfilePicture? profilePicture, 
      String? id, 
      String? name, 
      bool? isverified, 
      String? email, 
      bool? isAdmin, 
      bool? isDoctor, 
      String? randomNumber, 
      num? phone, 
      String? createdAt, 
      String? updatedAt,}){
    _profilePicture = profilePicture;
    _id = id;
    _name = name;
    _isverified = isverified;
    _email = email;
    _isAdmin = isAdmin;
    _isDoctor = isDoctor;
    _randomNumber = randomNumber;
    _phone = phone;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  UserData.fromJson(dynamic json) {
    _profilePicture = json['profilePicture'] != null ? ProfilePicture.fromJson(json['profilePicture']) : null;
    _id = json['_id'];
    _name = json['name'];
    _isverified = json['Isverified'];
    _email = json['email'];
    _isAdmin = json['isAdmin'];
    _isDoctor = json['isDoctor'];
    _randomNumber = json['RandomNumber'];
    _phone = json['phone'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  ProfilePicture? _profilePicture;
  String? _id;
  String? _name;
  bool? _isverified;
  String? _email;
  bool? _isAdmin;
  bool? _isDoctor;
  String? _randomNumber;
  num? _phone;
  String? _createdAt;
  String? _updatedAt;

  ProfilePicture get profilePicture => _profilePicture ?? profilePicture;
  String get id => _id ?? "";
  String get name => _name ?? "";
  bool get isverified => _isverified ?? false;
  String get email => _email ?? "";
  bool get isAdmin => _isAdmin ?? false;
  bool get isDoctor => _isDoctor ?? false;
  String get randomNumber => _randomNumber ?? "";
  num get phone => _phone ?? 0;
  String get createdAt => _createdAt ?? "";
  String get updatedAt => _updatedAt ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_profilePicture != null) {
      map['profilePicture'] = _profilePicture?.toJson();
    }
    map['_id'] = _id;
    map['name'] = _name;
    map['Isverified'] = _isverified;
    map['email'] = _email;
    map['isAdmin'] = _isAdmin;
    map['isDoctor'] = _isDoctor;
    map['RandomNumber'] = _randomNumber;
    map['phone'] = _phone;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
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

  String get url => _url ??"";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    return map;
  }

}