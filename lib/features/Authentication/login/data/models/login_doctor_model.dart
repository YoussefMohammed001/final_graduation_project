/// apiStatus : true
/// doctor : {"practiceLicense":{"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"},"address":{"city":"10ofRamadan","city_ar":"العاشر من رمضان","placeNumber":"elshrqia 10ofRamadan street Ammar abn yas","placeNumber_ar":"محافظه الشرقيه العاشر من رمضان مجاوره الخامسه شارع عمار بن ياسر"},"geolocation":{"type":"Point","coordinates":[31.740758,30.287383]},"profilePicture":{"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"},"name":"Ahmed Osama","name_ar":"ساره محمد","status":"pending","phone":78282823882,"id":"6449bf2e749a91f51fe415bf","specializeId":"64346c45565b50f6ec228ea7","img":[{"public_id":"clinicImages/sfphp6xglc3jkx53mkja","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682555071/clinicImages/sfphp6xglc3jkx53mkja.jpg","_id":"6449c0c2749a91f51fe415e8"},{"public_id":"clinicImages/mudjxoqctyeqezieg9gv","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682555072/clinicImages/mudjxoqctyeqezieg9gv.jpg","_id":"6449c0c2749a91f51fe415e9"},{"public_id":"clinicImages/hyjwsfytnhiejslqwzrz","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682555072/clinicImages/hyjwsfytnhiejslqwzrz.jpg","_id":"6449c0c2749a91f51fe415ea"},{"public_id":"clinicImages/pjh9buhpxlnlf0rn47an","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682555073/clinicImages/pjh9buhpxlnlf0rn47an.jpg","_id":"6449c0c2749a91f51fe415eb"},{"public_id":"clinicImages/a5mfwev3refmutoqlv9k","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682555074/clinicImages/a5mfwev3refmutoqlv9k.jpg","_id":"6449c0c2749a91f51fe415ec"}],"about":"Consultant of Neurology at neuropsychiatry Department in Police Hospitals MD in neuropsychaitry medicine Masters degree of Neurology and Psychiatry Specialists in treatment of knee osteoarthritis without surgery by hyaluronic acid intra-articular injection and PRP ","about_ar":"استشاري امراض المخ والاعصاب بقسم الطب النفسي العصبي بمستشفيات الشرطة دكتوراه طب الاعصاب ماجستير طب الاعصاب والطب النفسي متخصصون في علاج هشاشة العظام بدون جراحة عن طريق حقن حمض الهيالورونيك داخل المفصل و PRP","experience":"3","website":"https://www.facebook.com/dr.ahmed.rafeek/","waitingTime":"14"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDQ5YmYyZTc0OWE5MWY1MWZlNDE1YmYiLCJpYXQiOjE2ODI1NTUxNjN9.YM9jhYYhe-M5-pk85hVMsRk1mCzwG1Dg_Hh2MfVIN7Q"
/// message : "Logged In"

class LoginDoctorModel {
  LoginDoctorModel({
      bool? apiStatus, 
      Doctor? doctor,
    bool? isDoctor,
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


  bool get isDoctor => _isDoctor ?? false;
  bool get apiStatus => _apiStatus ?? false;
  Doctor get doctor => _doctor ?? doctor;
  String get token => _token ?? "";
  String get message => _message ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    map['isDoctor'] = _apiStatus;
    if (_doctor != null) {
      map['doctor'] = _doctor?.toJson();
    }
    map['token'] = _token;
    map['message'] = _message;
    return map;
  }

}

/// practiceLicense : {"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"}
/// address : {"city":"10ofRamadan","city_ar":"العاشر من رمضان","placeNumber":"elshrqia 10ofRamadan street Ammar abn yas","placeNumber_ar":"محافظه الشرقيه العاشر من رمضان مجاوره الخامسه شارع عمار بن ياسر"}
/// geolocation : {"type":"Point","coordinates":[31.740758,30.287383]}
/// profilePicture : {"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"}
/// name : "Ahmed Osama"
/// name_ar : "ساره محمد"
/// status : "pending"
/// phone : 78282823882
/// id : "6449bf2e749a91f51fe415bf"
/// specializeId : "64346c45565b50f6ec228ea7"
/// img : [{"public_id":"clinicImages/sfphp6xglc3jkx53mkja","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682555071/clinicImages/sfphp6xglc3jkx53mkja.jpg","_id":"6449c0c2749a91f51fe415e8"},{"public_id":"clinicImages/mudjxoqctyeqezieg9gv","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682555072/clinicImages/mudjxoqctyeqezieg9gv.jpg","_id":"6449c0c2749a91f51fe415e9"},{"public_id":"clinicImages/hyjwsfytnhiejslqwzrz","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682555072/clinicImages/hyjwsfytnhiejslqwzrz.jpg","_id":"6449c0c2749a91f51fe415ea"},{"public_id":"clinicImages/pjh9buhpxlnlf0rn47an","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682555073/clinicImages/pjh9buhpxlnlf0rn47an.jpg","_id":"6449c0c2749a91f51fe415eb"},{"public_id":"clinicImages/a5mfwev3refmutoqlv9k","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682555074/clinicImages/a5mfwev3refmutoqlv9k.jpg","_id":"6449c0c2749a91f51fe415ec"}]
/// about : "Consultant of Neurology at neuropsychiatry Department in Police Hospitals MD in neuropsychaitry medicine Masters degree of Neurology and Psychiatry Specialists in treatment of knee osteoarthritis without surgery by hyaluronic acid intra-articular injection and PRP "
/// about_ar : "استشاري امراض المخ والاعصاب بقسم الطب النفسي العصبي بمستشفيات الشرطة دكتوراه طب الاعصاب ماجستير طب الاعصاب والطب النفسي متخصصون في علاج هشاشة العظام بدون جراحة عن طريق حقن حمض الهيالورونيك داخل المفصل و PRP"
/// experience : "3"
/// website : "https://www.facebook.com/dr.ahmed.rafeek/"
/// waitingTime : "14"

class Doctor {
  Doctor({
      PracticeLicense? practiceLicense, 
      Address? address, 
      Geolocation? geolocation, 
      ProfilePicture? profilePicture, 
      String? name, 
      String? nameAr, 
      String? status, 
      num? phone, 
      String? id, 
      String? specializeId, 
      List<Img>? img, 
      String? about, 
      String? aboutAr, 
      String? experience, 
      String? website, 
      String? waitingTime,}){
    _practiceLicense = practiceLicense;
    _address = address;
    _geolocation = geolocation;
    _profilePicture = profilePicture;
    _name = name;
    _nameAr = nameAr;
    _status = status;
    _phone = phone;
    _id = id;
    _specializeId = specializeId;
    _img = img;
    _about = about;
    _aboutAr = aboutAr;
    _experience = experience;
    _website = website;
    _waitingTime = waitingTime;
}

  Doctor.fromJson(dynamic json) {
    _practiceLicense = json['practiceLicense'] != null ? PracticeLicense.fromJson(json['practiceLicense']) : null;
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _geolocation = json['geolocation'] != null ? Geolocation.fromJson(json['geolocation']) : null;
    _profilePicture = json['profilePicture'] != null ? ProfilePicture.fromJson(json['profilePicture']) : null;
    _name = json['name'];
    _nameAr = json['name_ar'];
    _status = json['status'];
    _phone = json['phone'];
    _id = json['id'];
    _specializeId = json['specializeId'];
    if (json['img'] != null) {
      _img = [];
      json['img'].forEach((v) {
        _img?.add(Img.fromJson(v));
      });
    }
    _about = json['about'];
    _aboutAr = json['about_ar'];
    _experience = json['experience'];
    _website = json['website'];
    _waitingTime = json['waitingTime'];
  }
  PracticeLicense? _practiceLicense;
  Address? _address;
  Geolocation? _geolocation;
  ProfilePicture? _profilePicture;
  String? _name;
  String? _nameAr;
  String? _status;
  num? _phone;
  String? _id;
  String? _specializeId;
  List<Img>? _img;
  String? _about;
  String? _aboutAr;
  String? _experience;
  String? _website;
  String? _waitingTime;

  PracticeLicense get practiceLicense => _practiceLicense ?? practiceLicense;
  Address get address => _address ?? address;
  Geolocation get geolocation => _geolocation ?? geolocation;
  ProfilePicture get profilePicture => _profilePicture ?? profilePicture;
  String get name => _name ?? "name";
  String get nameAr => _nameAr ?? "";
  String get status => _status ?? "stat";
  num get phone => _phone ?? 0;
  String get id => _id ?? '';
  String get specializeId => _specializeId ?? "";
  List<Img> get img => _img ?? [];
  String get about => _about ?? "";
  String get aboutAr => _aboutAr ?? "";
  String get experience => _experience ?? "";
  String get website => _website ?? "";
  String get waitingTime => _waitingTime ?? "";

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
    if (_profilePicture != null) {
      map['profilePicture'] = _profilePicture?.toJson();
    }
    map['name'] = _name;
    map['name_ar'] = _nameAr;
    map['status'] = _status;
    map['phone'] = _phone;
    map['id'] = _id;
    map['specializeId'] = _specializeId;
    if (_img != null) {
      map['img'] = _img?.map((v) => v.toJson()).toList();
    }
    map['about'] = _about;
    map['about_ar'] = _aboutAr;
    map['experience'] = _experience;
    map['website'] = _website;
    map['waitingTime'] = _waitingTime;
    return map;
  }

}

/// public_id : "clinicImages/sfphp6xglc3jkx53mkja"
/// url : "https://res.cloudinary.com/dlivgib8n/image/upload/v1682555071/clinicImages/sfphp6xglc3jkx53mkja.jpg"
/// _id : "6449c0c2749a91f51fe415e8"

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

/// type : "Point"
/// coordinates : [31.740758,30.287383]

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

/// city : "10ofRamadan"
/// city_ar : "العاشر من رمضان"
/// placeNumber : "elshrqia 10ofRamadan street Ammar abn yas"
/// placeNumber_ar : "محافظه الشرقيه العاشر من رمضان مجاوره الخامسه شارع عمار بن ياسر"

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

/// url : "https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"

class PracticeLicense {
  PracticeLicense({
      String? url,}){
    _url = url;
}

  PracticeLicense.fromJson(dynamic json) {
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