/// apiStatus : true
/// data : {"address":{"city":"10ofRamadan","city_ar":"العاشر من رمضان","placeNumber":"elshrqia 10ofRamadan street Ammar abn yas","placeNumber_ar":"محافظه الشرقيه العاشر من رمضان مجاوره الخامسه شارع عمار بن ياسر"},"geolocation":{"type":"Point","coordinates":[31.740757,30.287382]},"_id":"644d1bffa6ea9bbfd66c2a92","ratingAverage":1,"ratingsQuantity":0,"about":"Consultant of Neurology at neuropsychiatry Department in Police Hospitals MD in neuropsychaitry medicine Masters degree of Neurology and Psychiatry Specialists in treatment of knee osteoarthritis without surgery by hyaluronic acid intra-articular injection and PRP ","about_ar":"استشاري امراض المخ والاعصاب بقسم الطب النفسي العصبي بمستشفيات الشرطة دكتوراه طب الاعصاب ماجستير طب الاعصاب والطب النفسي متخصصون في علاج هشاشة العظام بدون جراحة عن طريق حقن حمض الهيالورونيك داخل المفصل و PRP","experience":"3","feesPerCunsaltation":200,"name_ar":"خالد محمد ","waitingTime":"14"}
/// message : "doctor Data added success"

class AddDoctorDataModel {
  AddDoctorDataModel({
      bool? apiStatus, 
      Data? data, 
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  AddDoctorDataModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  Data? _data;
  String? _message;

  bool get apiStatus => _apiStatus ?? false;
  Data get data => _data ?? data;
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

/// address : {"city":"10ofRamadan","city_ar":"العاشر من رمضان","placeNumber":"elshrqia 10ofRamadan street Ammar abn yas","placeNumber_ar":"محافظه الشرقيه العاشر من رمضان مجاوره الخامسه شارع عمار بن ياسر"}
/// geolocation : {"type":"Point","coordinates":[31.740757,30.287382]}
/// _id : "644d1bffa6ea9bbfd66c2a92"
/// ratingAverage : 1
/// ratingsQuantity : 0
/// about : "Consultant of Neurology at neuropsychiatry Department in Police Hospitals MD in neuropsychaitry medicine Masters degree of Neurology and Psychiatry Specialists in treatment of knee osteoarthritis without surgery by hyaluronic acid intra-articular injection and PRP "
/// about_ar : "استشاري امراض المخ والاعصاب بقسم الطب النفسي العصبي بمستشفيات الشرطة دكتوراه طب الاعصاب ماجستير طب الاعصاب والطب النفسي متخصصون في علاج هشاشة العظام بدون جراحة عن طريق حقن حمض الهيالورونيك داخل المفصل و PRP"
/// experience : "3"
/// feesPerCunsaltation : 200
/// name_ar : "خالد محمد "
/// waitingTime : "14"

class Data {
  Data({
      Address? address, 
      Geolocation? geolocation, 
      String? id, 
      num? ratingAverage, 
      num? ratingsQuantity, 
      String? about, 
      String? aboutAr, 
      String? experience, 
      num? feesPerCunsaltation, 
      String? nameAr, 
      String? waitingTime,}){
    _address = address;
    _geolocation = geolocation;
    _id = id;
    _ratingAverage = ratingAverage;
    _ratingsQuantity = ratingsQuantity;
    _about = about;
    _aboutAr = aboutAr;
    _experience = experience;
    _feesPerCunsaltation = feesPerCunsaltation;
    _nameAr = nameAr;
    _waitingTime = waitingTime;
}

  Data.fromJson(dynamic json) {
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _geolocation = json['geolocation'] != null ? Geolocation.fromJson(json['geolocation']) : null;
    _id = json['_id'];
    _ratingAverage = json['ratingAverage'];
    _ratingsQuantity = json['ratingsQuantity'];
    _about = json['about'];
    _aboutAr = json['about_ar'];
    _experience = json['experience'];
    _feesPerCunsaltation = json['feesPerCunsaltation'];
    _nameAr = json['name_ar'];
    _waitingTime = json['waitingTime'];
  }
  Address? _address;
  Geolocation? _geolocation;
  String? _id;
  num? _ratingAverage;
  num? _ratingsQuantity;
  String? _about;
  String? _aboutAr;
  String? _experience;
  num? _feesPerCunsaltation;
  String? _nameAr;
  String? _waitingTime;

  Address get address => _address ?? address;
  Geolocation get geolocation => _geolocation ?? geolocation;
  String get id => _id ?? "";
  num get ratingAverage => _ratingAverage ?? 0;
  num get ratingsQuantity => _ratingsQuantity ?? 0;
  String get about => _about ?? "";
  String get aboutAr => _aboutAr ?? '';
  String get experience => _experience ?? '';
  num get feesPerCunsaltation => _feesPerCunsaltation ?? 0;
  String get nameAr => _nameAr ?? '';
  String get waitingTime => _waitingTime ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    if (_geolocation != null) {
      map['geolocation'] = _geolocation?.toJson();
    }
    map['_id'] = _id;
    map['ratingAverage'] = _ratingAverage;
    map['ratingsQuantity'] = _ratingsQuantity;
    map['about'] = _about;
    map['about_ar'] = _aboutAr;
    map['experience'] = _experience;
    map['feesPerCunsaltation'] = _feesPerCunsaltation;
    map['name_ar'] = _nameAr;
    map['waitingTime'] = _waitingTime;
    return map;
  }

}

/// type : "Point"
/// coordinates : [31.740757,30.287382]

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