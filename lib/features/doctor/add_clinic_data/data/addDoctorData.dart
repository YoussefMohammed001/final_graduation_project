/// apiStatus : true
/// data : {"practiceLicense":{"public_id":"doctorImages/vzwxrgptkk4pgsanfx3l","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682980697/doctorImages/vzwxrgptkk4pgsanfx3l.jpg"},"address":{"city":"10ofRamadan","city_ar":"العاشر من رمضان","placeNumber":"elshrqia 10ofRamadan street Ammar abn yas","placeNumber_ar":"محافظه الشرقيه العاشر من رمضان مجاوره الخامسه شارع عمار بن ياسر"},"geolocation":{"type":"Point","coordinates":[31.740757,30.287382]},"_id":"644d1bffa6ea9bbfd66c2a92","userId":{"profilePicture":{"public_id":"userImages/e5xhyqpprfqh38u7ql1u","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682775040/userImages/e5xhyqpprfqh38u7ql1u.jpg"},"_id":"644d1bffa6ea9bbfd66c2a8f","name":"Khaled Atia","status":"pending","Notification":[],"phone":1027372920},"specializeId":{"_id":"64346c45565b50f6ec228ea7","name":"Dentistry (teeth)","name_ar":"اسنان"},"ratingAverage":1,"ratingsQuantity":0,"img":[{"public_id":"doctorImages/bqxuuldsp7qgxgmduuwp","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682776328/doctorImages/bqxuuldsp7qgxgmduuwp.jpg","_id":"644d20a8bcd079eba56ee53e"},{"public_id":"clinicImages/xmnizgx4nkv1io9x1jhr","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682776225/clinicImages/xmnizgx4nkv1io9x1jhr.jpg","_id":"644d20a8bcd079eba56ee53f"},{"public_id":"clinicImages/eu5fmvwodt7rb3s5ylgl","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682776227/clinicImages/eu5fmvwodt7rb3s5ylgl.jpg","_id":"644d20a8bcd079eba56ee540"},{"public_id":"clinicImages/we4a2tabghuxhmzbzbfm","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682776230/clinicImages/we4a2tabghuxhmzbzbfm.jpg","_id":"644d20a8bcd079eba56ee541"},{"public_id":"clinicImages/gv98uwyuew6apcombklk","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407908/clinicImages/gv98uwyuew6apcombklk.jpg","_id":"6456c4269db73674ee159ae1"},{"public_id":"clinicImages/j2k9p0vlhztskx4fxtd8","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407908/clinicImages/j2k9p0vlhztskx4fxtd8.jpg","_id":"6456c4269db73674ee159ae2"},{"public_id":"clinicImages/k4h5k9lznvq1p7fwdwqo","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407909/clinicImages/k4h5k9lznvq1p7fwdwqo.jpg","_id":"6456c4269db73674ee159ae3"},{"public_id":"clinicImages/etfekzzurrkeelqjyq0a","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407909/clinicImages/etfekzzurrkeelqjyq0a.jpg","_id":"6456c4269db73674ee159ae4"},{"public_id":"clinicImages/hnm1rsbzme6jyhspijx3","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407910/clinicImages/hnm1rsbzme6jyhspijx3.jpg","_id":"6456c4269db73674ee159ae5"}],"createdAt":"2023-04-29T13:30:42.103Z","updatedAt":"2023-05-06T21:19:04.251Z","__v":2,"about":"Consultant of Neurology at neuropsychiatry Department in Police Hospitals MD in neuropsychaitry medicine Masters degree of Neurology and Psychiatry Specialists in treatment of knee osteoarthritis without surgery by hyaluronic acid intra-articular injection and PRP ","about_ar":"استشاري امراض المخ والاعصاب بقسم الطب النفسي العصبي بمستشفيات الشرطة دكتوراه طب الاعصاب ماجستير طب الاعصاب والطب النفسي متخصصون في علاج هشاشة العظام بدون جراحة عن طريق حقن حمض الهيالورونيك داخل المفصل و PRP","experience":"3","feesPerCunsaltation":200,"name_ar":"خالد محمد ","waitingTime":"14","website":"https://www.facebook.com/dr.ahmed.rafeek/","id":"644d1bffa6ea9bbfd66c2a92"}
/// message : "doctor Data added success"

class AddDoctorData {
  AddDoctorData({
      bool? apiStatus, 
      Data? data, 
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  AddDoctorData.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  Data? _data;
  String? _message;

  bool get apiStatus => _apiStatus ?? false;
  Data get data => _data ?? Data();
  String get message => _message ?? '';

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


class Data {
  Data({
      PracticeLicense? practiceLicense, 
      Address? address, 
      Geolocation? geolocation, 
      String? id, 

      num? ratingAverage, 
      num? ratingsQuantity, 

      String? createdAt, 
      String? updatedAt, 
      num? v, 
      String? about, 
      String? aboutAr, 
      String? experience, 
      num? feesPerCunsaltation, 
      String? nameAr, 
      String? waitingTime, 
      String? website, 
      String? Doctorid,}){
    _practiceLicense = practiceLicense;
    _address = address;
    _geolocation = geolocation;
    _id = id;

    _ratingAverage = ratingAverage;
    _ratingsQuantity = ratingsQuantity;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _about = about;
    _aboutAr = aboutAr;
    _experience = experience;
    _feesPerCunsaltation = feesPerCunsaltation;
    _nameAr = nameAr;
    _waitingTime = waitingTime;
    _website = website;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _practiceLicense = json['practiceLicense'] != null ? PracticeLicense.fromJson(json['practiceLicense']) : null;
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _geolocation = json['geolocation'] != null ? Geolocation.fromJson(json['geolocation']) : null;
    _id = json['_id'];
      _ratingAverage = json['ratingAverage'];
    _ratingsQuantity = json['ratingsQuantity'];

    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _about = json['about'];
    _aboutAr = json['about_ar'];
    _experience = json['experience'];
    _feesPerCunsaltation = json['feesPerCunsaltation'];
    _nameAr = json['name_ar'];
    _waitingTime = json['waitingTime'];
    _website = json['website'];
    _Doctorid = json['id'];
  }
  PracticeLicense? _practiceLicense;
  Address? _address;
  Geolocation? _geolocation;
  String? _id;

  num? _ratingAverage;
  num? _ratingsQuantity;

  String? _createdAt;
  String? _updatedAt;
  num? _v;
  String? _about;
  String? _aboutAr;
  String? _experience;
  num? _feesPerCunsaltation;
  String? _nameAr;
  String? _waitingTime;
  String? _website;
  String? _Doctorid;

  PracticeLicense get practiceLicense => _practiceLicense ?? PracticeLicense();
  Address get address => _address ?? Address();
  Geolocation get geolocation => _geolocation ?? Geolocation();
  String get id => _id ?? "";

  num get ratingAverage => _ratingAverage ?? 0;
  num get ratingsQuantity => _ratingsQuantity ?? 0;
  String get createdAt => _createdAt ?? "";
  String get updatedAt => _updatedAt ?? "";
  num get v => _v ?? 0;
  String get about => _about ?? "";
  String get aboutAr => _aboutAr ?? "";
  String get experience => _experience  ?? '';
  num get feesPerCunsaltation => _feesPerCunsaltation ?? 0;
  String get nameAr => _nameAr ?? '';
  String get waitingTime => _waitingTime ?? "";
  String get website => _website  ?? "";
  String get Doctorid => _id  ?? "";

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
    map['ratingAverage'] = _ratingAverage;
    map['ratingsQuantity'] = _ratingsQuantity;

    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['about'] = _about;
    map['about_ar'] = _aboutAr;
    map['experience'] = _experience;
    map['feesPerCunsaltation'] = _feesPerCunsaltation;
    map['name_ar'] = _nameAr;
    map['waitingTime'] = _waitingTime;
    map['website'] = _website;
    map['id'] = _id;
    return map;
  }

}
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

  String get city => _city ?? '';
  String get cityAr => _cityAr ?? "";
  String get placeNumber => _placeNumber ?? '';
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

/// public_id : "doctorImages/vzwxrgptkk4pgsanfx3l"
/// url : "https://res.cloudinary.com/dlivgib8n/image/upload/v1682980697/doctorImages/vzwxrgptkk4pgsanfx3l.jpg"

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

  String get publicId => _publicId ?? '';
  String get url => _url ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['public_id'] = _publicId;
    map['url'] = _url;
    return map;
  }

}