/// apiStatus : true
/// data : {"practiceLicense":{"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"},"address":{"city":"10ofRamadan","city_ar":"العاشر من رمضان","placeNumber":"elshrqia 10ofRamadan street Ammar abn yas","placeNumber_ar":"محافظه الشرقيه العاشر من رمضان مجاوره الخامسه شارع عمار بن ياسر"},"geolocation":{"type":"Point","coordinates":[31.740758,30.287383]},"_id":"6444adfbd647c79c57d8d24d","userId":{"profilePicture":{"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"},"_id":"6444adf7d647c79c57d8d24a","name":"Ahmed Osama","status":"pending","phone":78282823882},"specializeId":"64346c45565b50f6ec228ea7","ratingsQuantity":0,"img":[{"public_id":"clinicImages/xclqfsp84gt9wakt3bni","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682222956/clinicImages/xclqfsp84gt9wakt3bni.jpg","_id":"6444af6fd647c79c57d8d25e"},{"public_id":"clinicImages/tjdd3v0e6wx2wkux3kdz","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682222956/clinicImages/tjdd3v0e6wx2wkux3kdz.png","_id":"6444af6fd647c79c57d8d25f"},{"public_id":"clinicImages/asymsi6jkziso1943xp7","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682222957/clinicImages/asymsi6jkziso1943xp7.jpg","_id":"6444af6fd647c79c57d8d260"},{"public_id":"clinicImages/aslfiiqbrsrfithf13pp","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682222958/clinicImages/aslfiiqbrsrfithf13pp.jpg","_id":"6444af6fd647c79c57d8d261"},{"public_id":"clinicImages/vehypxkdfodqvfgmft6t","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682222958/clinicImages/vehypxkdfodqvfgmft6t.jpg","_id":"6444af6fd647c79c57d8d262"}],"createdAt":"2023-04-23T04:03:07.831Z","updatedAt":"2023-04-23T04:09:19.142Z","__v":1,"about":"Consultant of Neurology at neuropsychiatry Department in Police Hospitals MD in neuropsychaitry medicine Masters degree of Neurology and Psychiatry Specialists in treatment of knee osteoarthritis without surgery by hyaluronic acid intra-articular injection and PRP ","about_ar":"استشاري امراض المخ والاعصاب بقسم الطب النفسي العصبي بمستشفيات الشرطة دكتوراه طب الاعصاب ماجستير طب الاعصاب والطب النفسي متخصصون في علاج هشاشة العظام بدون جراحة عن طريق حقن حمض الهيالورونيك داخل المفصل و PRP","experience":"3","name_ar":"ساره محمد","waitingTime":"14","website":"https://www.facebook.com/dr.ahmed.rafeek/"}
/// message : "clinic images uploaded"

class AddClinicImagesModel {
  AddClinicImagesModel({
      bool? apiStatus, 
      Data? data, 
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  AddClinicImagesModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  Data? _data;
  String? _message;

  bool get apiStatus => _apiStatus ?? false;
  Data get data => _data ?? data;
  String get message => _message ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// practiceLicense : {"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"}
/// address : {"city":"10ofRamadan","city_ar":"العاشر من رمضان","placeNumber":"elshrqia 10ofRamadan street Ammar abn yas","placeNumber_ar":"محافظه الشرقيه العاشر من رمضان مجاوره الخامسه شارع عمار بن ياسر"}
/// geolocation : {"type":"Point","coordinates":[31.740758,30.287383]}
/// _id : "6444adfbd647c79c57d8d24d"
/// userId : {"profilePicture":{"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"},"_id":"6444adf7d647c79c57d8d24a","name":"Ahmed Osama","status":"pending","phone":78282823882}
/// specializeId : "64346c45565b50f6ec228ea7"
/// ratingsQuantity : 0
/// img : [{"public_id":"clinicImages/xclqfsp84gt9wakt3bni","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682222956/clinicImages/xclqfsp84gt9wakt3bni.jpg","_id":"6444af6fd647c79c57d8d25e"},{"public_id":"clinicImages/tjdd3v0e6wx2wkux3kdz","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682222956/clinicImages/tjdd3v0e6wx2wkux3kdz.png","_id":"6444af6fd647c79c57d8d25f"},{"public_id":"clinicImages/asymsi6jkziso1943xp7","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682222957/clinicImages/asymsi6jkziso1943xp7.jpg","_id":"6444af6fd647c79c57d8d260"},{"public_id":"clinicImages/aslfiiqbrsrfithf13pp","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682222958/clinicImages/aslfiiqbrsrfithf13pp.jpg","_id":"6444af6fd647c79c57d8d261"},{"public_id":"clinicImages/vehypxkdfodqvfgmft6t","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682222958/clinicImages/vehypxkdfodqvfgmft6t.jpg","_id":"6444af6fd647c79c57d8d262"}]
/// createdAt : "2023-04-23T04:03:07.831Z"
/// updatedAt : "2023-04-23T04:09:19.142Z"
/// __v : 1
/// about : "Consultant of Neurology at neuropsychiatry Department in Police Hospitals MD in neuropsychaitry medicine Masters degree of Neurology and Psychiatry Specialists in treatment of knee osteoarthritis without surgery by hyaluronic acid intra-articular injection and PRP "
/// about_ar : "استشاري امراض المخ والاعصاب بقسم الطب النفسي العصبي بمستشفيات الشرطة دكتوراه طب الاعصاب ماجستير طب الاعصاب والطب النفسي متخصصون في علاج هشاشة العظام بدون جراحة عن طريق حقن حمض الهيالورونيك داخل المفصل و PRP"
/// experience : "3"
/// name_ar : "ساره محمد"
/// waitingTime : "14"
/// website : "https://www.facebook.com/dr.ahmed.rafeek/"

class Data {
  Data({
      PracticeLicense? practiceLicense, 
      Address? address, 
      Geolocation? geolocation, 
      String? id, 
      UserId? userId, 
      String? specializeId, 
      num? ratingsQuantity, 
      List<Img>? img, 
      String? createdAt, 
      String? updatedAt, 
      num? v, 
      String? about, 
      String? aboutAr, 
      String? experience, 
      String? nameAr, 
      String? waitingTime, 
      String? website,}){
    _practiceLicense = practiceLicense;
    _address = address;
    _geolocation = geolocation;
    _id = id;
    _userId = userId;
    _specializeId = specializeId;
    _ratingsQuantity = ratingsQuantity;
    _img = img;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _about = about;
    _aboutAr = aboutAr;
    _experience = experience;
    _nameAr = nameAr;
    _waitingTime = waitingTime;
    _website = website;
}

  Data.fromJson(dynamic json) {
    _practiceLicense = json['practiceLicense'] != null ? PracticeLicense.fromJson(json['practiceLicense']) : null;
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _geolocation = json['geolocation'] != null ? Geolocation.fromJson(json['geolocation']) : null;
    _id = json['_id'];
    _userId = json['userId'] != null ? UserId.fromJson(json['userId']) : null;
    _specializeId = json['specializeId'];
    _ratingsQuantity = json['ratingsQuantity'];
    if (json['img'] != null) {
      _img = [];
      json['img'].forEach((v) {
        _img?.add(Img.fromJson(v));
      });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _about = json['about'];
    _aboutAr = json['about_ar'];
    _experience = json['experience'];
    _nameAr = json['name_ar'];
    _waitingTime = json['waitingTime'];
    _website = json['website'];
  }
  PracticeLicense? _practiceLicense;
  Address? _address;
  Geolocation? _geolocation;
  String? _id;
  UserId? _userId;
  String? _specializeId;
  num? _ratingsQuantity;
  List<Img>? _img;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  String? _about;
  String? _aboutAr;
  String? _experience;
  String? _nameAr;
  String? _waitingTime;
  String? _website;

  PracticeLicense get practiceLicense => _practiceLicense ?? practiceLicense;
  Address get address => _address ?? address;
  Geolocation get geolocation => _geolocation ?? geolocation;
  String get id => _id ?? "";
  UserId get userId => _userId ?? userId;
  String get specializeId => _specializeId ?? "";
  num get ratingsQuantity => _ratingsQuantity ?? 0;
  List<Img> get img => _img ?? [];
  String get createdAt => _createdAt ?? "";
  String get updatedAt => _updatedAt ?? "";
  num get v => _v ?? 0;
  String get about => _about ?? "";
  String get aboutAr => _aboutAr ?? "";
  String get experience => _experience ?? "";
  String get nameAr => _nameAr ?? "";
  String get waitingTime => _waitingTime ?? "";
  String get website => _website ?? "";

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
    map['_id'] = _id;
    if (_userId != null) {
      map['userId'] = _userId?.toJson();
    }
    map['specializeId'] = _specializeId;
    map['ratingsQuantity'] = _ratingsQuantity;
    if (_img != null) {
      map['img'] = _img?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['about'] = _about;
    map['about_ar'] = _aboutAr;
    map['experience'] = _experience;
    map['name_ar'] = _nameAr;
    map['waitingTime'] = _waitingTime;
    map['website'] = _website;
    return map;
  }

}

/// public_id : "clinicImages/xclqfsp84gt9wakt3bni"
/// url : "https://res.cloudinary.com/dlivgib8n/image/upload/v1682222956/clinicImages/xclqfsp84gt9wakt3bni.jpg"
/// _id : "6444af6fd647c79c57d8d25e"

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

/// profilePicture : {"url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681133143/th_yjukuo.jpg"}
/// _id : "6444adf7d647c79c57d8d24a"
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
  String? get id => _id ?? "";
  String? get name => _name ?? "";
  String? get status => _status ?? "";
  num? get phone => _phone ?? 0;

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