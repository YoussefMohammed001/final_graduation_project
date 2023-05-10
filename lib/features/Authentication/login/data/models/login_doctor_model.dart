/// apiStatus : true
/// isDoctor : true
/// doctor : {"practiceLicense":{"public_id":"doctorImages/a8oikdwnkny8wr33zpqy","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683628258/doctorImages/a8oikdwnkny8wr33zpqy.jpg"},"address":{"city":"location","city_ar":"caior","placeNumber":"wgyp[te","placeNumber_ar":"12"},"geolocation":{"type":"Point","coordinates":[31.7,30.28]},"ratingAverage":1,"profilePicture":{"public_id":"userImages/e8pnr5yggyzkxvv1uqtc","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683628212/userImages/e8pnr5yggyzkxvv1uqtc.jpg"},"name":"Youssef","name_ar":"youssef mohasmed naeem","status":"accept","phone":1211829505,"id":"645a20b474598ee11c1a5e80","ratingsQuantity":1,"specializeId":{"_id":"6437317a22b79fdc2f9cd7d0","name":"Pediatrics and New Born (Child)","name_ar":"اطفال وحديثي الولاده"},"img":[{"public_id":"clinicImages/keh5d5lxkmgxs6qg3gpd","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683628403/clinicImages/keh5d5lxkmgxs6qg3gpd.jpg","_id":"645a217874598ee11c1a5e9a"},{"public_id":"clinicImages/ntrnlsieea0vcvx7otau","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683628404/clinicImages/ntrnlsieea0vcvx7otau.jpg","_id":"645a217874598ee11c1a5e9b"},{"public_id":"clinicImages/agudsogkawqhwwq9gfmy","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683628405/clinicImages/agudsogkawqhwwq9gfmy.jpg","_id":"645a217874598ee11c1a5e9c"},{"public_id":"clinicImages/farmdoy9idy8mtvctbko","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683628406/clinicImages/farmdoy9idy8mtvctbko.jpg","_id":"645a217874598ee11c1a5e9d"},{"public_id":"clinicImages/bffzbepggionbplgag4v","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683628407/clinicImages/bffzbepggionbplgag4v.jpg","_id":"645a217874598ee11c1a5e9e"}],"about":"about doctor","about_ar":"about doctor","experience":"12 years","waitingTime":"waiting time"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDVhMjBiMDc0NTk4ZWUxMWMxYTVlN2QiLCJpYXQiOjE2ODM2MzQ2NjZ9.r0x6huKiQVW9k8qeB5UuMtju0QuuGiZsTGSymObhw5g"
/// message : "Logged In"

class LoginDoctorModel {
  LoginDoctorModel({
      bool? apiStatus, 
      bool? isDoctor, 
      Doctor? doctor, 
      String? token, 
      String? message,}){
    _apiStatus = apiStatus;
    _isDoctor = isDoctor;
    _doctor = doctor;
    _token = token;
    _message = message;
}

  LoginDoctorModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _isDoctor = json['isDoctor'];
    _doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    _token = json['token'];
    _message = json['message'];
  }
  bool? _apiStatus;
  bool? _isDoctor;
  Doctor? _doctor;
  String? _token;
  String? _message;

  bool get apiStatus => _apiStatus ?? false;
  bool get isDoctor => _isDoctor ?? false;
  Doctor get doctor => _doctor ?? Doctor();
  String get token => _token ?? "";
  String get message => _message ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    map['isDoctor'] = _isDoctor;
    if (_doctor != null) {
      map['doctor'] = _doctor?.toJson();
    }
    map['token'] = _token;
    map['message'] = _message;
    return map;
  }

}



class Doctor {
  Doctor({
      PracticeLicense? practiceLicense, 
      Address? address, 
      Geolocation? geolocation, 
      num? ratingAverage, 
      ProfilePicture? profilePicture, 
      String? name, 
      String? nameAr, 
      String? status, 
      num? phone, 
      String? id, 
      num? ratingsQuantity, 
      SpecializeId? specializeId, 
      List<Img>? img, 
      String? about, 
      String? aboutAr, 
      String? experience, 
      String? waitingTime,}){
    _practiceLicense = practiceLicense;
    _address = address;
    _geolocation = geolocation;
    _ratingAverage = ratingAverage;
    _profilePicture = profilePicture;
    _name = name;
    _nameAr = nameAr;
    _status = status;
    _phone = phone;
    _id = id;
    _ratingsQuantity = ratingsQuantity;
    _specializeId = specializeId;
    _img = img;
    _about = about;
    _aboutAr = aboutAr;
    _experience = experience;
    _waitingTime = waitingTime;
}

  Doctor.fromJson(dynamic json) {
    _practiceLicense = json['practiceLicense'] != null ? PracticeLicense.fromJson(json['practiceLicense']) : null;
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _geolocation = json['geolocation'] != null ? Geolocation.fromJson(json['geolocation']) : null;
    _ratingAverage = json['ratingAverage'];
    _profilePicture = json['profilePicture'] != null ? ProfilePicture.fromJson(json['profilePicture']) : null;
    _name = json['name'];
    _nameAr = json['name_ar'];
    _status = json['status'];
    _phone = json['phone'];
    _id = json['id'];
    _ratingsQuantity = json['ratingsQuantity'];
    _specializeId = json['specializeId'] != null ? SpecializeId.fromJson(json['specializeId']) : null;
    if (json['img'] != null) {
      _img = [];
      json['img'].forEach((v) {
        _img?.add(Img.fromJson(v));
      });
    }
    _about = json['about'];
    _aboutAr = json['about_ar'];
    _experience = json['experience'];
    _waitingTime = json['waitingTime'];
  }
  PracticeLicense? _practiceLicense;
  Address? _address;
  Geolocation? _geolocation;
  num? _ratingAverage;
  ProfilePicture? _profilePicture;
  String? _name;
  String? _nameAr;
  String? _status;
  num? _phone;
  String? _id;
  num? _ratingsQuantity;
  SpecializeId? _specializeId;
  List<Img>? _img;
  String? _about;
  String? _aboutAr;
  String? _experience;
  String? _waitingTime;

  PracticeLicense get practiceLicense => _practiceLicense ?? PracticeLicense();
  Address get address => _address ?? Address();
  Geolocation get geolocation => _geolocation ?? Geolocation();
  num get ratingAverage => _ratingAverage ?? 0;
  ProfilePicture get profilePicture => _profilePicture ?? ProfilePicture();
  String get name => _name ?? "";
  String get nameAr => _nameAr ??"";
  String get status => _status ?? "";
  num get phone => _phone ?? 0;
  String get id => _id ?? "";
  num get ratingsQuantity => _ratingsQuantity ?? 0;
  SpecializeId get specializeId => _specializeId ?? SpecializeId();
  List<Img> get img => _img ?? [];
  String get about => _about ??"";
  String get aboutAr => _aboutAr??"";
  String get experience => _experience??"";
  String get waitingTime => _waitingTime??"";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_practiceLicense != null) {
      map['practiceLicense'] = _practiceLicense?.toJson();
    }
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    if (_geolocation != null) {
      map['geolocation'] = _geolocation?.toJson();
    }
    map['ratingAverage'] = _ratingAverage;
    if (_profilePicture != null) {
      map['profilePicture'] = _profilePicture?.toJson();
    }
    map['name'] = _name;
    map['name_ar'] = _nameAr;
    map['status'] = _status;
    map['phone'] = _phone;
    map['id'] = _id;
    map['ratingsQuantity'] = _ratingsQuantity;
    if (_specializeId != null) {
      map['specializeId'] = _specializeId?.toJson();
    }
    if (_img != null) {
      map['img'] = _img?.map((v) => v.toJson()).toList();
    }
    map['about'] = _about;
    map['about_ar'] = _aboutAr;
    map['experience'] = _experience;
    map['waitingTime'] = _waitingTime;
    return map;
  }

}

/// public_id : "clinicImages/keh5d5lxkmgxs6qg3gpd"
/// url : "https://res.cloudinary.com/dlivgib8n/image/upload/v1683628403/clinicImages/keh5d5lxkmgxs6qg3gpd.jpg"
/// _id : "645a217874598ee11c1a5e9a"

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
  String get url => _url ?? '';
  String get id => _id ??"";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['public_id'] = _publicId;
    map['url'] = _url;
    map['_id'] = _id;
    return map;
  }

}


class SpecializeId {
  SpecializeId({
      String? id, 
      String? name, 
      String? nameAr,}){
    _id = id;
    _name = name;
    _nameAr = nameAr;
}

  SpecializeId.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _nameAr = json['name_ar'];
  }
  String? _id;
  String? _name;
  String? _nameAr;

  String get id => _id ?? "";
  String get name => _name ?? "";
  String get nameAr => _nameAr ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['name_ar'] = _nameAr;
    return map;
  }

}

/// public_id : "userImages/e8pnr5yggyzkxvv1uqtc"
/// url : "https://res.cloudinary.com/dlivgib8n/image/upload/v1683628212/userImages/e8pnr5yggyzkxvv1uqtc.jpg"

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
/// coordinates : [31.7,30.28]

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

/// city : "location"
/// city_ar : "caior"
/// placeNumber : "wgyp[te"
/// placeNumber_ar : "12"

class Address {
  Address({
      String? city, 
      String? cityAr, 
      String? placeNumber, 
      String? placeNumberAr,}){
    _city = city;
    _cityAr = cityAr;
    _placeNumber = placeNumber;
    _placeNumberAr = placeNumberAr;
}

  Address.fromJson(dynamic json) {
    _city = json['city'];
    _cityAr = json['city_ar'];
    _placeNumber = json['placeNumber'];
    _placeNumberAr = json['placeNumber_ar'];
  }
  String? _city;
  String? _cityAr;
  String? _placeNumber;
  String? _placeNumberAr;

  String get city => _city ?? "";
  String get cityAr => _cityAr ?? "";
  String get placeNumber => _placeNumber ?? "";
  String get placeNumberAr => _placeNumberAr ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = _city;
    map['city_ar'] = _cityAr;
    map['placeNumber'] = _placeNumber;
    map['placeNumber_ar'] = _placeNumberAr;
    return map;
  }

}

/// public_id : "doctorImages/a8oikdwnkny8wr33zpqy"
/// url : "https://res.cloudinary.com/dlivgib8n/image/upload/v1683628258/doctorImages/a8oikdwnkny8wr33zpqy.jpg"

class PracticeLicense {
  PracticeLicense({
      String? publicId, 
      String? url,}){
    _publicId = publicId;
    _url = url;
}

  PracticeLicense.fromJson(dynamic json) {
    _publicId = json['public_id'];
    _url = json['url'];
  }
  String? _publicId;
  String? _url;

  String? get publicId => _publicId;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['public_id'] = _publicId;
    map['url'] = _url;
    return map;
  }

}