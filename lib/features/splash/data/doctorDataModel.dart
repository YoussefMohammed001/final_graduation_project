/// apiStatus : true
/// doctorProfileData : {"geolocation":{},"address":{},"name":"Mohamed Mohamed","id":"6439514f2965f300c4765f6d","profilePicture":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg","phone":1211829505,"status":"pending","timeslot":[],"specialize":"Pediatrics and New Born (Child)"}
/// message : "doctor profile"

class DoctorDataModel {
  DoctorDataModel({
      bool? apiStatus, 
      DoctorProfileData? doctorProfileData, 
      String? message,}){
    _apiStatus = apiStatus;
    _doctorProfileData = doctorProfileData;
    _message = message;
}

  DoctorDataModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _doctorProfileData = json['doctorData'] != null ? DoctorProfileData.fromJson(json['doctorData']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  DoctorProfileData? _doctorProfileData;
  String? _message;

  bool get apiStatus => _apiStatus ?? false;
  DoctorProfileData get doctorProfileData => _doctorProfileData ?? doctorProfileData;
  String get message => _message ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_doctorProfileData != null) {
      map['doctorData'] = _doctorProfileData?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// geolocation : {}
/// address : {}
/// name : "Mohamed Mohamed"
/// id : "6439514f2965f300c4765f6d"
/// profilePicture : "https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"
/// phone : 1211829505
/// status : "pending"
/// timeslot : []
/// specialize : "Pediatrics and New Born (Child)"

class DoctorProfileData {
  DoctorProfileData({
      dynamic geolocation, 
      dynamic address, 
      String? name, 
      String? id, 
      String? profilePicture, 
      num? phone, 
      String? status, 
      List<dynamic>? timeslot, 
      String? specialize,}){
    _geolocation = geolocation;
    _address = address;
    _name = name;
    _id = id;
    _profilePicture = profilePicture;
    _phone = phone;
    _status = status;
    _timeslot = timeslot;
    _specialize = specialize;
}

  DoctorProfileData.fromJson(dynamic json) {
    _geolocation = json['geolocation'];
    _address = json['address'];
    _name = json['name'];
    _id = json['id'];
    _profilePicture = json['profilePicture'];
    _phone = json['phone'];
    _status = json['status'];
    _specialize = json['specialize'];
  }
  dynamic _geolocation;
  dynamic _address;
  String? _name;
  String? _id;
  String? _profilePicture;
  num? _phone;
  String? _status;
  List<dynamic>? _timeslot;
  String? _specialize;

  dynamic get geolocation => _geolocation;
  dynamic get address => _address;
  String get name => _name ?? '';
  String get id => _id ?? "";
  String get profilePicture => _profilePicture ?? "";
  num get phone => _phone ?? 0;
  String get status => _status ?? "";
  List<dynamic> get timeslot => _timeslot ?? [];
  String get specialize => _specialize ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['geolocation'] = _geolocation;
    map['address'] = _address;
    map['name'] = _name;
    map['id'] = _id;
    map['profilePicture'] = _profilePicture;
    map['phone'] = _phone;
    map['status'] = _status;
    if (_timeslot != null) {
      map['timeslot'] = _timeslot?.map((v) => v.toJson()).toList();
    }
    map['specialize'] = _specialize;
    return map;
  }

}