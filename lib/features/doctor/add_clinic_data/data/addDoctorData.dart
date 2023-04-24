/// apiStatus : true
/// doctorData : {"practiceLicense":{"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"},"address":{"city":"10ofRamadan","city_ar":"العاشر من رمضان","placeNumber":"elshrqia 10ofRamadan street Ammar abn yas","placeNumber_ar":"محافظه الشرقيه العاشر من رمضان مجاوره الخامسه شارع عمار بن ياسر"},"geolocation":{"type":"Point","coordinates":[31.740758,30.287383]},"userId":{"profilePicture":{"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"},"_id":"64449f71d647c79c57d8d1b9","name":"Ahmed Osama","status":"pending","phone":78282823882},"specializeId":"64346c45565b50f6ec228ea7","ratingsQuantity":0,"createdAt":"2023-04-23T03:01:09.891Z","updatedAt":"2023-04-23T03:01:55.967Z","__v":0,"about":"Consultant of Neurology at neuropsychiatry Department in Police Hospitals MD in neuropsychaitry medicine Masters degree of Neurology and Psychiatry Specialists in treatment of knee osteoarthritis without surgery by hyaluronic acid intra-articular injection and PRP ","about_ar":"استشاري امراض المخ والاعصاب بقسم الطب النفسي العصبي بمستشفيات الشرطة دكتوراه طب الاعصاب ماجستير طب الاعصاب والطب النفسي متخصصون في علاج هشاشة العظام بدون جراحة عن طريق حقن حمض الهيالورونيك داخل المفصل و PRP","website":"https://www.facebook.com/dr.ahmed.rafeek/","experience":"3","waitingTime":"14","name_ar":"ساره محمد","id":"64449f75d647c79c57d8d1bc"}
/// message : "doctor Data added success"

class AddDoctorData {
  AddDoctorData({
      bool? apiStatus, 
      DoctorData? doctorData, 
      String? message,}){
    _apiStatus = apiStatus;
    _doctorData = doctorData;
    _message = message;
}

  AddDoctorData.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _doctorData = json['data'] != null ? DoctorData.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  DoctorData? _doctorData;
  String? _message;

  bool get apiStatus => _apiStatus ?? false;
  DoctorData get doctorData => _doctorData ?? doctorData ;
  String get message => _message ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_doctorData != null) {
      map['data'] = _doctorData?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// practiceLicense : {"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"}
/// address : {"city":"10ofRamadan","city_ar":"العاشر من رمضان","placeNumber":"elshrqia 10ofRamadan street Ammar abn yas","placeNumber_ar":"محافظه الشرقيه العاشر من رمضان مجاوره الخامسه شارع عمار بن ياسر"}
/// geolocation : {"type":"Point","coordinates":[31.740758,30.287383]}
/// userId : {"profilePicture":{"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"},"_id":"64449f71d647c79c57d8d1b9","name":"Ahmed Osama","status":"pending","phone":78282823882}
/// specializeId : "64346c45565b50f6ec228ea7"
/// ratingsQuantity : 0
/// createdAt : "2023-04-23T03:01:09.891Z"
/// updatedAt : "2023-04-23T03:01:55.967Z"
/// __v : 0
/// about : "Consultant of Neurology at neuropsychiatry Department in Police Hospitals MD in neuropsychaitry medicine Masters degree of Neurology and Psychiatry Specialists in treatment of knee osteoarthritis without surgery by hyaluronic acid intra-articular injection and PRP "
/// about_ar : "استشاري امراض المخ والاعصاب بقسم الطب النفسي العصبي بمستشفيات الشرطة دكتوراه طب الاعصاب ماجستير طب الاعصاب والطب النفسي متخصصون في علاج هشاشة العظام بدون جراحة عن طريق حقن حمض الهيالورونيك داخل المفصل و PRP"
/// website : "https://www.facebook.com/dr.ahmed.rafeek/"
/// experience : "3"
/// waitingTime : "14"
/// name_ar : "ساره محمد"
/// id : "64449f75d647c79c57d8d1bc"

class DoctorData {
  DoctorData({
      PracticeLicense? practiceLicense, 
      Address? address, 
      Geolocation? geolocation, 
      UserId? userId, 
      String? specializeId, 
      num? ratingsQuantity, 
      String? createdAt, 
      String? updatedAt, 
      num? v, 
      String? about, 
      String? aboutAr, 
      String? website, 
      String? experience, 
      String? waitingTime, 
      String? nameAr, 
      String? id,}){
    _practiceLicense = practiceLicense;
    _address = address;
    _geolocation = geolocation;
    _userId = userId;
    _specializeId = specializeId;
    _ratingsQuantity = ratingsQuantity;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _about = about;
    _aboutAr = aboutAr;
    _website = website;
    _experience = experience;
    _waitingTime = waitingTime;
    _nameAr = nameAr;
    _id = id;
}

  DoctorData.fromJson(dynamic json) {
    _practiceLicense = json['practiceLicense'] != null ? PracticeLicense.fromJson(json['practiceLicense']) : null;
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _geolocation = json['geolocation'] != null ? Geolocation.fromJson(json['geolocation']) : null;
    _userId = json['userId'] != null ? UserId.fromJson(json['userId']) : null;
    _specializeId = json['specializeId'];
    _ratingsQuantity = json['ratingsQuantity'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _about = json['about'];
    _aboutAr = json['about_ar'];
    _website = json['website'];
    _experience = json['experience'];
    _waitingTime = json['waitingTime'];
    _nameAr = json['name_ar'];
    _id = json['id'];
  }
  PracticeLicense? _practiceLicense;
  Address? _address;
  Geolocation? _geolocation;
  UserId? _userId;
  String? _specializeId;
  num? _ratingsQuantity;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  String? _about;
  String? _aboutAr;
  String? _website;
  String? _experience;
  String? _waitingTime;
  String? _nameAr;
  String? _id;

  PracticeLicense get practiceLicense => _practiceLicense ?? practiceLicense;
  Address get address => _address ?? address;
  Geolocation get geolocation => _geolocation ?? geolocation;
  UserId get userId => _userId?? userId;
  String get specializeId => _specializeId??"";
  num get ratingsQuantity => _ratingsQuantity?? 0;
  String get createdAt => _createdAt?? "";
  String get updatedAt => _updatedAt?? "";
  num get v => _v?? 0;
  String get about => _about?? "";
  String get aboutAr => _aboutAr?? "";
  String get website => _website?? "";
  String get experience => _experience?? "";
  String get waitingTime => _waitingTime?? "";
  String get nameAr => _nameAr ?? "";
  String get id => _id ?? "";

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
    if (_userId != null) {
      map['userId'] = _userId?.toJson();
    }
    map['specializeId'] = _specializeId;
    map['ratingsQuantity'] = _ratingsQuantity;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['about'] = _about;
    map['about_ar'] = _aboutAr;
    map['website'] = _website;
    map['experience'] = _experience;
    map['waitingTime'] = _waitingTime;
    map['name_ar'] = _nameAr;
    map['id'] = _id;
    return map;
  }

}

/// profilePicture : {"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"}
/// _id : "64449f71d647c79c57d8d1b9"
/// name : "Ahmed Osama"
/// status : "pending"
/// phone : 78282823882

class UserId {
  UserId({
      ProfilePicture? profilePicture, 
      String? id, 
      String? name, 
      String? status, 
      num? phone,}){
    _profilePicture = profilePicture;
    _id = id;
    _name = name;
    _status = status;
    _phone = phone;
}

  UserId.fromJson(dynamic json) {
    _profilePicture = json['profilePicture'] != null ? ProfilePicture.fromJson(json['profilePicture']) : null;
    _id = json['_id'];
    _name = json['name'];
    _status = json['status'];
    _phone = json['phone'];
  }
  ProfilePicture? _profilePicture;
  String? _id;
  String? _name;
  String? _status;
  num? _phone;

  ProfilePicture get profilePicture => _profilePicture ?? profilePicture;
  String get id => _id ?? "";
  String get name => _name ?? "";
  String get status => _status ?? "";
  num get phone => _phone ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_profilePicture != null) {
      map['profilePicture'] = _profilePicture?.toJson();
    }
    map['_id'] = _id;
    map['name'] = _name;
    map['status'] = _status;
    map['phone'] = _phone;
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

  String? get url => _url;

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

  String? get type => _type;
  List<num>? get coordinates => _coordinates;

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

  String? get city => _city;
  String? get cityAr => _cityAr;
  String? get placeNumber => _placeNumber;
  String? get placeNumberAr => _placeNumberAr;

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

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    return map;
  }

}