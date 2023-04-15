/// apiStatus : true
/// doctors : [{"id":"6437328a4955aafd31f20606","name":"Ahmed Osama","profile":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg","specialize":"Pediatrics and New Born (Child)","rating":0},{"id":"643733944955aafd31f2061a","name":"Mohamed Ahmed","profile":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg","specialize":"Cardiology and Vascular Disease (Heart)","rating":0},{"id":"6437341d4955aafd31f2062b","name":"Adel Mohamed","profile":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg","specialize":"Neurology (Brain & Nerves)","rating":0},{"id":"6437348a4955aafd31f2063c","name":"Salah Naem","profile":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg","specialize":"Orthopedics (Bones)","rating":4}]
/// disease : []
/// specializes : [{"id":"64346c45565b50f6ec228ea7","name":"Dentistry (teeth)","img":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681157190/specializeImgs/szavdrllvtzkjd9i8ita.png","number_of_doctors":0},{"id":"643470f814649b678e0d25b6","name":"Cardiology and Vascular Disease (Heart)","img":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681158392/specializeImgs/ghgo0tyw77oi62tfdq2o.png","number_of_doctors":1},{"id":"6437317a22b79fdc2f9cd7d0","name":"Pediatrics and New Born (Child)","img":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681157190/specializeImgs/szavdrllvtzkjd9i8ita.png","number_of_doctors":1},{"id":"643731a622b79fdc2f9cd7d5","name":"Neurology (Brain & Nerves)","img":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681157190/specializeImgs/szavdrllvtzkjd9i8ita.png","number_of_doctors":1},{"id":"643731c122b79fdc2f9cd7da","name":"Orthopedics (Bones)","img":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681157190/specializeImgs/szavdrllvtzkjd9i8ita.png","number_of_doctors":1}]
/// message : "all data fetched success"

class HomeModel {
  HomeModel({
      bool? apiStatus, 
      List<Doctors>? doctors, 
      List<dynamic>? disease, 
      List<Specializes>? specializes, 
      String? message,}){
    _apiStatus = apiStatus;
    _doctors = doctors;
    _disease = disease;
    _specializes = specializes;
    _message = message;
}

  HomeModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    if (json['doctors'] != null) {
      _doctors = [];
      json['doctors'].forEach((v) {
        _doctors?.add(Doctors.fromJson(v));
      });
    }
    // if (json['disease'] != null) {
    //   _disease = [];
    //   json['disease'].forEach((v) {
    //     _disease?.add(Dynamic.fromJson(v));
    //   });
    // }
    if (json['specializes'] != null) {
      _specializes = [];
      json['specializes'].forEach((v) {
        _specializes?.add(Specializes.fromJson(v));
      });
    }
    _message = json['message'];
  }
  bool? _apiStatus;
  List<Doctors>? _doctors;
  List<dynamic>? _disease;
  List<Specializes>? _specializes;
  String? _message;

  bool get apiStatus => _apiStatus ?? false;
  List<Doctors> get doctors => _doctors ?? [];
  List<dynamic> get disease => _disease ?? [];
  List<Specializes> get specializes => _specializes ?? [];
  String get message => _message ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_doctors != null) {
      map['doctors'] = _doctors?.map((v) => v.toJson()).toList();
    }
    if (_disease != null) {
      map['disease'] = _disease?.map((v) => v.toJson()).toList();
    }
    if (_specializes != null) {
      map['specializes'] = _specializes?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// id : "64346c45565b50f6ec228ea7"
/// name : "Dentistry (teeth)"
/// img : "https://res.cloudinary.com/dlivgib8n/image/upload/v1681157190/specializeImgs/szavdrllvtzkjd9i8ita.png"
/// number_of_doctors : 0

class Specializes {
  Specializes({
      String? id, 
      String? name, 
      String? img, 
      num? numberOfDoctors,}){
    _id = id;
    _name = name;
    _img = img;
    _numberOfDoctors = numberOfDoctors;
}

  Specializes.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _img = json['img'];
    _numberOfDoctors = json['number_of_doctors'];
  }
  String? _id;
  String? _name;
  String? _img;
  num? _numberOfDoctors;

  String get id => _id ?? "";
  String get name => _name ?? "";
  String get img => _img ?? "";
  num get numberOfDoctors => _numberOfDoctors ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['img'] = _img;
    map['number_of_doctors'] = _numberOfDoctors;
    return map;
  }

}

/// id : "6437328a4955aafd31f20606"
/// name : "Ahmed Osama"
/// profile : "https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"
/// specialize : "Pediatrics and New Born (Child)"
/// rating : 0

class Doctors {
  Doctors({
      String? id, 
      String? name, 
      String? profile, 
      String? specialize, 
      num? rating,}){
    _id = id;
    _name = name;
    _profile = profile;
    _specialize = specialize;
    _rating = rating;
}

  Doctors.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _profile = json['profile'];
    _specialize = json['specialize'];
    _rating = json['rating'];
  }
  String? _id;
  String? _name;
  String? _profile;
  String? _specialize;
  num? _rating;

  String get id => _id ?? "";
  String get name => _name ?? "";
  String get profile => _profile ?? "";
  String get specialize => _specialize ?? "";
  num get rating => _rating ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['profile'] = _profile;
    map['specialize'] = _specialize;
    map['rating'] = _rating;
    return map;
  }

}