/// apiStatus : true
/// data : [{"img":{"public_id":"specializeImgs/szavdrllvtzkjd9i8ita","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681157190/specializeImgs/szavdrllvtzkjd9i8ita.png"},"_id":"64346c45565b50f6ec228ea7","name":"Dentistry (teeth)","name_ar":"اسنان","userId":"64345948c77bed9955bd15a5","createdAt":"2023-04-10T20:06:30.752Z","updatedAt":"2023-04-10T20:06:30.752Z","__v":0},{"img":{"public_id":"specializeImgs/ghgo0tyw77oi62tfdq2o","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681158392/specializeImgs/ghgo0tyw77oi62tfdq2o.png"},"_id":"643470f814649b678e0d25b6","name":"Cardiology and Vascular Disease (Heart)","name_ar":"امراض القلب","userId":"64345948c77bed9955bd15a5","createdAt":"2023-04-10T20:26:33.310Z","updatedAt":"2023-04-10T20:26:33.310Z","__v":0}]
/// message : "all specialize fetched success"

class SpecializedModel {
  SpecializedModel({
      bool? apiStatus, 
      List<SpecializedData>? data,
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  SpecializedModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(SpecializedData.fromJson(v));
      });
    }
    _message = json['message'];
  }
  bool? _apiStatus;
  List<SpecializedData>? _data;
  String? _message;

  bool get apiStatus => _apiStatus ?? false;
  List<SpecializedData> get data => _data ?? data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// img : {"public_id":"specializeImgs/szavdrllvtzkjd9i8ita","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681157190/specializeImgs/szavdrllvtzkjd9i8ita.png"}
/// _id : "64346c45565b50f6ec228ea7"
/// name : "Dentistry (teeth)"
/// name_ar : "اسنان"
/// userId : "64345948c77bed9955bd15a5"
/// createdAt : "2023-04-10T20:06:30.752Z"
/// updatedAt : "2023-04-10T20:06:30.752Z"
/// __v : 0

class SpecializedData {
  SpecializedData({
      Img? img, 
      String? id, 
      String? name, 
      String? nameAr, 
      String? userId, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _img = img;
    _id = id;
    _name = name;
    _nameAr = nameAr;
    _userId = userId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  SpecializedData.fromJson(dynamic json) {
    _img = json['img'] != null ? Img.fromJson(json['img']) : null;
    _id = json['_id'];
    _name = json['name'];
    _nameAr = json['name_ar'];
    _userId = json['userId'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  Img? _img;
  String? _id;
  String? _name;
  String? _nameAr;
  String? _userId;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  Img get img => _img ?? img;
  String get id => _id ?? "";
  String get name => _name ?? "";
  String get nameAr => _nameAr ?? "";
  String get userId => _userId ?? "";
  String get createdAt => _createdAt ?? "";
  String get updatedAt => _updatedAt ?? "";
  num? get v => _v ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_img != null) {
      map['img'] = _img?.toJson();
    }
    map['_id'] = _id;
    map['name'] = _name;
    map['name_ar'] = _nameAr;
    map['userId'] = _userId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

/// public_id : "specializeImgs/szavdrllvtzkjd9i8ita"
/// url : "https://res.cloudinary.com/dlivgib8n/image/upload/v1681157190/specializeImgs/szavdrllvtzkjd9i8ita.png"

class Img {
  Img({
      String? publicId, 
      String? url,}){
    _publicId = publicId;
    _url = url;
}

  Img.fromJson(dynamic json) {
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