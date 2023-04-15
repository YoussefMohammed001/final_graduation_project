/// apiStatus : true
/// doctorData : {"id":"6437348a4955aafd31f2063c","name":"Salah Naem","img":[{"public_id":"clinicImages/qzfq4webjbgyz4wde5nj","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681356036/clinicImages/qzfq4webjbgyz4wde5nj.jpg","_id":"6437750840decf5f2aa3beca"},{"public_id":"clinicImages/wxhxs2krvfykglyi3kjc","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681356037/clinicImages/wxhxs2krvfykglyi3kjc.jpg","_id":"6437750840decf5f2aa3becb"},{"public_id":"clinicImages/dumtu2z3ux1t7lhnzqwa","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681356038/clinicImages/dumtu2z3ux1t7lhnzqwa.jpg","_id":"6437750840decf5f2aa3becc"},{"public_id":"clinicImages/khx7ietmiiin0txmfczu","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681356039/clinicImages/khx7ietmiiin0txmfczu.jpg","_id":"6437750840decf5f2aa3becd"},{"public_id":"clinicImages/q2fmnnn5hejv2wudg6zt","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681356040/clinicImages/q2fmnnn5hejv2wudg6zt.jpg","_id":"6437750840decf5f2aa3bece"}],"specialize":"Orthopedics (Bones)","rating":4,"Consultation":200,"about":"PhD and Consultant of Oral and Dental Surgery higly specialized in full mouth rehabilitation and reconstruction with over 35 years of experience besides her passion in becoming an artist and drawing the prettiest smiles on her patients faces making her one of the elite dental care providers not only in egypt but in the middle east region Her honesty professionalism and dedication for her patient's satisfaction made her well known among her patients","geolocation":{"type":"Point","coordinates":[31.548224,30.166284]},"ratingsQuantity":5}
/// message : "doctor data fetched success"

class SingleDoctorModel {
  SingleDoctorModel({
      bool? apiStatus, 
      DoctorData? doctorData, 
      String? message,}){
    _apiStatus = apiStatus;
    _doctorData = doctorData;
    _message = message;
}

  SingleDoctorModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _doctorData = json['doctorData'] != null ? DoctorData.fromJson(json['doctorData']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  DoctorData? _doctorData;
  String? _message;

  bool get apiStatus => _apiStatus ?? false;
  DoctorData get doctorData => _doctorData ?? doctorData;
  String get message => _message ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_doctorData != null) {
      map['doctorData'] = _doctorData?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// id : "6437348a4955aafd31f2063c"
/// name : "Salah Naem"
/// img : [{"public_id":"clinicImages/qzfq4webjbgyz4wde5nj","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681356036/clinicImages/qzfq4webjbgyz4wde5nj.jpg","_id":"6437750840decf5f2aa3beca"},{"public_id":"clinicImages/wxhxs2krvfykglyi3kjc","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681356037/clinicImages/wxhxs2krvfykglyi3kjc.jpg","_id":"6437750840decf5f2aa3becb"},{"public_id":"clinicImages/dumtu2z3ux1t7lhnzqwa","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681356038/clinicImages/dumtu2z3ux1t7lhnzqwa.jpg","_id":"6437750840decf5f2aa3becc"},{"public_id":"clinicImages/khx7ietmiiin0txmfczu","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681356039/clinicImages/khx7ietmiiin0txmfczu.jpg","_id":"6437750840decf5f2aa3becd"},{"public_id":"clinicImages/q2fmnnn5hejv2wudg6zt","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681356040/clinicImages/q2fmnnn5hejv2wudg6zt.jpg","_id":"6437750840decf5f2aa3bece"}]
/// specialize : "Orthopedics (Bones)"
/// rating : 4
/// Consultation : 200
/// about : "PhD and Consultant of Oral and Dental Surgery higly specialized in full mouth rehabilitation and reconstruction with over 35 years of experience besides her passion in becoming an artist and drawing the prettiest smiles on her patients faces making her one of the elite dental care providers not only in egypt but in the middle east region Her honesty professionalism and dedication for her patient's satisfaction made her well known among her patients"
/// geolocation : {"type":"Point","coordinates":[31.548224,30.166284]}
/// ratingsQuantity : 5

class DoctorData {
  DoctorData({
      String? id, 
      String? name, 
      List<Img>? img, 
      String? specialize, 
      num? rating, 
      num? consultation, 
      String? about, 
      Geolocation? geolocation, 
      num? ratingsQuantity,}){
    _id = id;
    _name = name;
    _img = img;
    _specialize = specialize;
    _rating = rating;
    _consultation = consultation;
    _about = about;
    _geolocation = geolocation;
    _ratingsQuantity = ratingsQuantity;
}

  DoctorData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    if (json['img'] != null) {
      _img = [];
      json['img'].forEach((v) {
        _img?.add(Img.fromJson(v));
      });
    }
    _specialize = json['specialize'];
    _rating = json['rating'];
    _consultation = json['Consultation'];
    _about = json['about'];
    _geolocation = json['geolocation'] != null ? Geolocation.fromJson(json['geolocation']) : null;
    _ratingsQuantity = json['ratingsQuantity'];
  }
  String? _id;
  String? _name;
  List<Img>? _img;
  String? _specialize;
  num? _rating;
  num? _consultation;
  String? _about;
  Geolocation? _geolocation;
  num? _ratingsQuantity;

  String get id => _id ?? "";
  String get name => _name ?? "";
  List<Img> get img => _img ?? [];
  String get specialize => _specialize ?? "";
  num get rating => _rating ?? 0;
  num get consultation => _consultation ?? 0;
  String get about => _about ?? "";
  Geolocation get geolocation => _geolocation ?? geolocation;
  num get ratingsQuantity => _ratingsQuantity ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_img != null) {
      map['img'] = _img?.map((v) => v.toJson()).toList();
    }
    map['specialize'] = _specialize;
    map['rating'] = _rating;
    map['Consultation'] = _consultation;
    map['about'] = _about;
    if (_geolocation != null) {
      map['geolocation'] = _geolocation?.toJson();
    }
    map['ratingsQuantity'] = _ratingsQuantity;
    return map;
  }

}

/// type : "Point"
/// coordinates : [31.548224,30.166284]

class Geolocation {
  Geolocation({
      String? type, 
      List<num>? coordinates,}){
    _type = type;
    _coordinates = coordinates;
}

  Geolocation.fromJson(dynamic json) {
    _type = json['type'];
    _coordinates = json['coordinates'] != null ? json['coordinates'].cast<num>() : [];
  }
  String? _type;
  List<num>? _coordinates;

  String get type => _type ?? "";
  List<num> get coordinates => _coordinates ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['coordinates'] = _coordinates;
    return map;
  }

}

/// public_id : "clinicImages/qzfq4webjbgyz4wde5nj"
/// url : "https://res.cloudinary.com/dlivgib8n/image/upload/v1681356036/clinicImages/qzfq4webjbgyz4wde5nj.jpg"
/// _id : "6437750840decf5f2aa3beca"

class Img {
  Img({
      String? publicId, 
      String? url, 
      String? id,}){
    _publicId = publicId;
    _url = url;
    _id = id;
}

  Img.fromJson(dynamic json) {
    _publicId = json['public_id'];
    _url = json['url'];
    _id = json['_id'];
  }
  String? _publicId;
  String? _url;
  String? _id;

  String get publicId => _publicId ?? "";
  String get url => _url ?? "";
  String get id => _id ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['public_id'] = _publicId;
    map['url'] = _url;
    map['_id'] = _id;
    return map;
  }

}