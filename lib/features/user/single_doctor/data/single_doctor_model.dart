/// apiStatus : true
/// doctorData : {"id":"643733944955aafd31f2061a","name":"Mohamed Ahmed","img":[{"public_id":"doctorImages/gsqgmzc3rmprbshognc7","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682555437/doctorImages/gsqgmzc3rmprbshognc7.jpg","_id":"6448b537ebf958889f8fc834"},{"public_id":"clinicImages/fnenrxtuof115r4vhefb","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682486581/clinicImages/fnenrxtuof115r4vhefb.jpg","_id":"6448b537ebf958889f8fc835"},{"public_id":"doctorImages/spzunnrwnzjqxvnhszsb","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682486872/doctorImages/spzunnrwnzjqxvnhszsb.jpg","_id":"6448b537ebf958889f8fc836"},{"public_id":"clinicImages/afho5gjjddpmz0ltsjxj","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682486582/clinicImages/afho5gjjddpmz0ltsjxj.jpg","_id":"6448b537ebf958889f8fc837"}],"specialize":"Cardiology and Vascular Disease (Heart)","rating":1,"city":"cairo","placeNumber":"elshrouk","Consultation":300,"about":"PhD and Consultant of Oral and Dental Surgery higly specialized in full mouth rehabilitation and reconstruction with over 35 years of experience besides her passion in becoming an artist and drawing the prettiest smiles on her patients faces making her one of the elite dental care providers not only in egypt but in the middle east region Her honesty professionalism and dedication for her patient's satisfaction made her well known among her patients","geolocation":{"type":"Point","coordinates":[31.548219,30.16628]},"profilePicture":{"public_id":"doctorImages/bsqz98e0h73wd0oncevi","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682454542/doctorImages/bsqz98e0h73wd0oncevi.jpg"},"ratingsQuantity":0}
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
  String get message => _message ?? '';

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

/// id : "643733944955aafd31f2061a"
/// name : "Mohamed Ahmed"
/// img : [{"public_id":"doctorImages/gsqgmzc3rmprbshognc7","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682555437/doctorImages/gsqgmzc3rmprbshognc7.jpg","_id":"6448b537ebf958889f8fc834"},{"public_id":"clinicImages/fnenrxtuof115r4vhefb","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682486581/clinicImages/fnenrxtuof115r4vhefb.jpg","_id":"6448b537ebf958889f8fc835"},{"public_id":"doctorImages/spzunnrwnzjqxvnhszsb","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682486872/doctorImages/spzunnrwnzjqxvnhszsb.jpg","_id":"6448b537ebf958889f8fc836"},{"public_id":"clinicImages/afho5gjjddpmz0ltsjxj","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682486582/clinicImages/afho5gjjddpmz0ltsjxj.jpg","_id":"6448b537ebf958889f8fc837"}]
/// specialize : "Cardiology and Vascular Disease (Heart)"
/// rating : 1
/// city : "cairo"
/// placeNumber : "elshrouk"
/// Consultation : 300
/// about : "PhD and Consultant of Oral and Dental Surgery higly specialized in full mouth rehabilitation and reconstruction with over 35 years of experience besides her passion in becoming an artist and drawing the prettiest smiles on her patients faces making her one of the elite dental care providers not only in egypt but in the middle east region Her honesty professionalism and dedication for her patient's satisfaction made her well known among her patients"
/// geolocation : {"type":"Point","coordinates":[31.548219,30.16628]}
/// profilePicture : {"public_id":"doctorImages/bsqz98e0h73wd0oncevi","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682454542/doctorImages/bsqz98e0h73wd0oncevi.jpg"}
/// ratingsQuantity : 0

class DoctorData {
  DoctorData({
      String? id, 
      String? name, 
      List<Img>? img, 
      String? specialize, 
      num? rating, 
      String? city, 
      String? placeNumber, 
      num? consultation, 
      String? about, 
      Geolocation? geolocation, 
      ProfilePicture? profilePicture, 
      num? ratingsQuantity,}){
    _id = id;
    _name = name;
    _img = img;
    _specialize = specialize;
    _rating = rating;
    _city = city;
    _placeNumber = placeNumber;
    _consultation = consultation;
    _about = about;
    _geolocation = geolocation;
    _profilePicture = profilePicture;
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
    _city = json['city'];
    _placeNumber = json['placeNumber'];
    _consultation = json['Consultation'];
    _about = json['about'];
    _geolocation = json['geolocation'] != null ? Geolocation.fromJson(json['geolocation']) : null;
    _profilePicture = json['profilePicture'] != null ? ProfilePicture.fromJson(json['profilePicture']) : null;
    _ratingsQuantity = json['ratingsQuantity'];
  }
  String? _id;
  String? _name;
  List<Img>? _img;
  String? _specialize;
  num? _rating;
  String? _city;
  String? _placeNumber;
  num? _consultation;
  String? _about;
  Geolocation? _geolocation;
  ProfilePicture? _profilePicture;
  num? _ratingsQuantity;

  String get id => _id ?? "";
  String get name => _name ?? "";
  List<Img> get img => _img ?? [];
  String get specialize => _specialize ?? "";
  num get rating => _rating ?? 0;
  String get city => _city ?? "";
  String get placeNumber => _placeNumber ?? '';
  num get consultation => _consultation ?? 0;
  String get about => _about ?? '';
  Geolocation get geolocation => _geolocation ?? geolocation;
  ProfilePicture get profilePicture => _profilePicture ?? profilePicture;
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
    map['city'] = _city;
    map['placeNumber'] = _placeNumber;
    map['Consultation'] = _consultation;
    map['about'] = _about;
    if (_geolocation != null) {
      map['geolocation'] = _geolocation?.toJson();
    }
    if (_profilePicture != null) {
      map['profilePicture'] = _profilePicture?.toJson();
    }
    map['ratingsQuantity'] = _ratingsQuantity;
    return map;
  }

}

/// public_id : "doctorImages/bsqz98e0h73wd0oncevi"
/// url : "https://res.cloudinary.com/dlivgib8n/image/upload/v1682454542/doctorImages/bsqz98e0h73wd0oncevi.jpg"

class ProfilePicture {
  ProfilePicture({
      String? publicId, 
      String? url,}){
    _publicId = publicId;
    _url = url;
}

  ProfilePicture.fromJson(dynamic json) {
    _publicId = json['public_id'];
    _url = json['url'];
  }
  String? _publicId;
  String? _url;

  String get publicId => _publicId ?? "";
  String get url => _url ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['public_id'] = _publicId;
    map['url'] = _url;
    return map;
  }

}

/// type : "Point"
/// coordinates : [31.548219,30.16628]

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

/// public_id : "doctorImages/gsqgmzc3rmprbshognc7"
/// url : "https://res.cloudinary.com/dlivgib8n/image/upload/v1682555437/doctorImages/gsqgmzc3rmprbshognc7.jpg"
/// _id : "6448b537ebf958889f8fc834"

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

  String get publicId => _publicId ?? '';
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