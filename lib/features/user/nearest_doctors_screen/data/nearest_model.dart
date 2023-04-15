/// apiStatus : true
/// nearestData : [{"name":"Adel Mohamed","specialize":"Neurology (Brain & Nerves)","profilePicture":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg","distance":{"calculated":0},"id":"6437341d4955aafd31f20628"},{"name":"Khaled Asem","specialize":"Orthopedics (Bones)","profilePicture":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681400483/userImages/bhab0pqgiaic2vmyamjv.png","distance":{"calculated":0.2943100539466473},"id":"6438229ee3e064ca2e1e88d7"},{"name":"Salah Naem","specialize":"Orthopedics (Bones)","rating":4,"profilePicture":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg","distance":{"calculated":0.2943100539466473},"id":"6437348a4955aafd31f20639"},{"name":"Mohamed Ahmed","specialize":"Cardiology and Vascular Disease (Heart)","profilePicture":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg","distance":{"calculated":0.364598400658455},"id":"643733944955aafd31f20617"},{"name":"Ahmed Osama","specialize":"Pediatrics and New Born (Child)","profilePicture":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg","distance":{"calculated":1.1166708290144172},"id":"643732894955aafd31f20603"}]
/// message : "doctors fetched successfully"

class NearestModel {
  NearestModel({
      bool? apiStatus, 
      List<NearestData>? nearestData, 
      String? message,}){
    _apiStatus = apiStatus;
    _nearestData = nearestData;
    _message = message;
}

  NearestModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    if (json['data'] != null) {
      _nearestData = [];
      json['data'].forEach((v) {
        _nearestData?.add(NearestData.fromJson(v));
      });
    }
    _message = json['message'];
  }
  bool? _apiStatus;
  List<NearestData>? _nearestData;
  String? _message;

  bool get apiStatus => _apiStatus ?? false;
  List<NearestData> get nearestData => _nearestData ?? [];
  String get message => _message ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_nearestData != null) {
      map['data'] = _nearestData?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// name : "Adel Mohamed"
/// specialize : "Neurology (Brain & Nerves)"
/// profilePicture : "https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"
/// distance : {"calculated":0}
/// id : "6437341d4955aafd31f20628"

class NearestData {
  NearestData({
      String? name, 
      String? specialize, 
      String? profilePicture, 
      Distance? distance, 
      String? id,}){
    _name = name;
    _specialize = specialize;
    _profilePicture = profilePicture;
    _distance = distance;
    _id = id;
}

  NearestData.fromJson(dynamic json) {
    _name = json['name'];
    _specialize = json['specialize'];
    _profilePicture = json['profilePicture'];
    _distance = json['distance'] != null ? Distance.fromJson(json['distance']) : null;
    _id = json['id'];
  }
  String? _name;
  String? _specialize;
  String? _profilePicture;
  Distance? _distance;
  String? _id;

  String get name => _name ?? "";
  String  get specialize => _specialize ?? "";
  String  get profilePicture => _profilePicture ??"";
  Distance get distance => _distance ?? distance;
  String get id => _id ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['specialize'] = _specialize;
    map['profilePicture'] = _profilePicture;
    if (_distance != null) {
      map['distance'] = _distance?.toJson();
    }
    map['id'] = _id;
    return map;
  }

}

/// calculated : 0

class Distance {
  Distance({
      num? calculated,}){
    _calculated = calculated;
}

  Distance.fromJson(dynamic json) {
    _calculated = json['calculated'];
  }
  num? _calculated;

  num get calculated => _calculated ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['calculated'] = _calculated;
    return map;
  }

}