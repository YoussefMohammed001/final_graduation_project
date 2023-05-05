/// apiStatus : true
/// doctorRegisterData : {"name":"Khaled Atia","email":"khaledj@gmail.com","phone":1027372920,"isDoctor":true,"status":"pending","specializeId":"643ea0b6c3e7c17700a92e09","profilePicture":{"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"},"id":"6450119a5ae6ea7af6ab88cf"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDUwMTE5NzVhZTZlYTdhZjZhYjg4Y2MiLCJpYXQiOjE2ODI5Njg5ODN9.1i8jd9a9oTYLLkc9rOzx-omplLJtvJcgyvwQ9hBdgO0"
/// massage : "doctor added success"

class DoctorRegisterModel {
  DoctorRegisterModel({
      bool? apiStatus, 
      DoctorRegisterData? doctorRegisterData, 
      String? token, 
      String? massage,}){
    _apiStatus = apiStatus;
    _doctorRegisterData = doctorRegisterData;
    _token = token;
    _massage = massage;
}

  DoctorRegisterModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _doctorRegisterData = json['return'] != null ? DoctorRegisterData.fromJson(json['return']) : null;
    _token = json['token'];
    _massage = json['massage'];
  }
  bool? _apiStatus;
  DoctorRegisterData? _doctorRegisterData;
  String? _token;
  String? _massage;

  bool get apiStatus => _apiStatus ?? false;
  DoctorRegisterData get doctorRegisterData => _doctorRegisterData ?? doctorRegisterData;
  String get token => _token ??"";
  String get massage => _massage ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_doctorRegisterData != null) {
      map['return'] = _doctorRegisterData?.toJson();
    }
    map['token'] = _token;
    map['massage'] = _massage;
    return map;
  }

}

/// name : "Khaled Atia"
/// email : "khaledj@gmail.com"
/// phone : 1027372920
/// isDoctor : true
/// status : "pending"
/// specializeId : "643ea0b6c3e7c17700a92e09"
/// profilePicture : {"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"}
/// id : "6450119a5ae6ea7af6ab88cf"

class DoctorRegisterData {
  DoctorRegisterData({
      String? name, 
      String? email, 
      num? phone, 
      bool? isDoctor, 
      String? status, 
      String? specializeId, 
      ProfilePicture? profilePicture, 
      String? id,}){
    _name = name;
    _email = email;
    _phone = phone;
    _isDoctor = isDoctor;
    _status = status;
    _specializeId = specializeId;
    _profilePicture = profilePicture;
    _id = id;
}

  DoctorRegisterData.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _isDoctor = json['isDoctor'];
    _status = json['status'];
    _specializeId = json['specializeId'];
    _profilePicture = json['profilePicture'] != null ? ProfilePicture.fromJson(json['profilePicture']) : null;
    _id = json['id'];
  }
  String? _name;
  String? _email;
  num? _phone;
  bool? _isDoctor;
  String? _status;
  String? _specializeId;
  ProfilePicture? _profilePicture;
  String? _id;

  String get name => _name ?? "";
  String get email => _email ?? "";
  num get phone => _phone ?? 0;
  bool get isDoctor => _isDoctor ?? false;
  String get status => _status ??"";
  String get specializeId => _specializeId ?? "";
  ProfilePicture get profilePicture => _profilePicture ?? profilePicture;
  String get id => _id ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['isDoctor'] = _isDoctor;
    map['status'] = _status;
    map['specializeId'] = _specializeId;
    if (_profilePicture != null) {
      map['profilePicture'] = _profilePicture?.toJson();
    }
    map['id'] = _id;
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