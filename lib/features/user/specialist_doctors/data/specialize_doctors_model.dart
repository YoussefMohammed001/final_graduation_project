/// apiStatus : true
/// data : [{"name":"Salah Naem","specialize":"Orthopedics (Bones)","rating":4,"profilePicture":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg","id":"6437348a4955aafd31f20639"},{"name":"Khaled Asem","specialize":"Orthopedics (Bones)","profilePicture":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681400483/userImages/bhab0pqgiaic2vmyamjv.png","id":"6438229ee3e064ca2e1e88d7"}]
/// message : "doctors fetched successfully"

class SpecializeDoctorsModel {
  SpecializeDoctorsModel({
      bool? apiStatus, 
      List<SpecializeDoctorData>? data,
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  SpecializeDoctorsModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(SpecializeDoctorData.fromJson(v));
      });
    }
    _message = json['message'];
  }
  bool? _apiStatus;
  List<SpecializeDoctorData>? _data;
  String? _message;

  bool get apiStatus => _apiStatus ?? false;
  List<SpecializeDoctorData> get data => _data ?? [];
  String get message => _message ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// name : "Salah Naem"
/// specialize : "Orthopedics (Bones)"
/// rating : 4
/// profilePicture : "https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"
/// id : "6437348a4955aafd31f20639"

class SpecializeDoctorData {
  SpecializeDoctorData({
      String? name, 
      String? specialize, 
      num? rating, 
      String? profilePicture, 
      String? id,}){
    _name = name;
    _specialize = specialize;
    _rating = rating;
    _profilePicture = profilePicture;
    _id = id;
}

  SpecializeDoctorData.fromJson(dynamic json) {
    _name = json['name'];
    _specialize = json['specialize'];
    _rating = json['rating'];
    _profilePicture = json['profilePicture'];
    _id = json['id'];
  }
  String? _name;
  String? _specialize;
  num? _rating;
  String? _profilePicture;
  String? _id;

  String get name => _name ?? "";
  String get specialize => _specialize ?? "";
  num get rating => _rating ?? 0;
  String get profilePicture => _profilePicture ?? "";
  String get id => _id ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['specialize'] = _specialize;
    map['rating'] = _rating;
    map['profilePicture'] = _profilePicture;
    map['id'] = _id;
    return map;
  }

}