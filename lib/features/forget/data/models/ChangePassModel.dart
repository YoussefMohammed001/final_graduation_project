/// apiStatus : true
/// data : {"_id":"63fe3d95f90984f8c9fcbefa","name":"youssef","Isverified":true,"email":"yoseffmohamed001@gmail.com","uniqueString":137198,"isAdmin":false,"Notification":[],"seenNotification":[],"RandomNumber":"8c2ce4","city":"Cairo","from":"egypt","createdAt":"2023-02-28T17:44:53.447Z","updatedAt":"2023-03-02T13:08:10.277Z"}
/// message : "verified"

class ChangePassModel {
  ChangePassModel({
      bool? apiStatus, 
      Data? data, 
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  ChangePassModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  Data? _data;
  String? _message;
ChangePassModel copyWith({  bool? apiStatus,
  Data? data,
  String? message,
}) => ChangePassModel(  apiStatus: apiStatus ?? _apiStatus,
  data: data ?? _data,
  message: message ?? _message,
);
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

/// _id : "63fe3d95f90984f8c9fcbefa"
/// name : "youssef"
/// Isverified : true
/// email : "yoseffmohamed001@gmail.com"
/// uniqueString : 137198
/// isAdmin : false
/// Notification : []
/// seenNotification : []
/// RandomNumber : "8c2ce4"
/// city : "Cairo"
/// from : "egypt"
/// createdAt : "2023-02-28T17:44:53.447Z"
/// updatedAt : "2023-03-02T13:08:10.277Z"

class Data {
  Data({
      String? id, 
      String? name, 
      bool? isverified, 
      String? email, 
      num? uniqueString, 
      bool? isAdmin, 
      List<dynamic>? notification, 
      List<dynamic>? seenNotification, 
      String? randomNumber, 
      String? city, 
      String? from, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _isverified = isverified;
    _email = email;
    _uniqueString = uniqueString;
    _isAdmin = isAdmin;
    _notification = notification;
    _seenNotification = seenNotification;
    _randomNumber = randomNumber;
    _city = city;
    _from = from;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _isverified = json['Isverified'];
    _email = json['email'];
    _uniqueString = json['uniqueString'];
    _isAdmin = json['isAdmin'];
    if (json['Notification'] != null) {
      _notification = [];
      json['Notification'].forEach((v) {
      //  _notification?.add(Dynamic.fromJson(v));
      });
    }
    if (json['seenNotification'] != null) {
      _seenNotification = [];
      json['seenNotification'].forEach((v) {
       // _seenNotification?.add(Dynamic.fromJson(v));
      });
    }
    _randomNumber = json['RandomNumber'];
    _city = json['city'];
    _from = json['from'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _name;
  bool? _isverified;
  String? _email;
  num? _uniqueString;
  bool? _isAdmin;
  List<dynamic>? _notification;
  List<dynamic>? _seenNotification;
  String? _randomNumber;
  String? _city;
  String? _from;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  String? id,
  String? name,
  bool? isverified,
  String? email,
  num? uniqueString,
  bool? isAdmin,
  List<dynamic>? notification,
  List<dynamic>? seenNotification,
  String? randomNumber,
  String? city,
  String? from,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  isverified: isverified ?? _isverified,
  email: email ?? _email,
  uniqueString: uniqueString ?? _uniqueString,
  isAdmin: isAdmin ?? _isAdmin,
  notification: notification ?? _notification,
  seenNotification: seenNotification ?? _seenNotification,
  randomNumber: randomNumber ?? _randomNumber,
  city: city ?? _city,
  from: from ?? _from,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String get id => _id ?? "";
  String get name => _name ?? "";
  bool get isverified => _isverified ?? false;
  String get email => _email ?? '';
  num get uniqueString => _uniqueString ?? 0;
  bool get isAdmin => _isAdmin ?? false;
  List<dynamic> get notification => _notification ?? [];
  List<dynamic> get seenNotification => _seenNotification ?? [];
  String get randomNumber => _randomNumber ?? "";
  String get city => _city ?? "";
  String get from => _from ?? "";
  String get createdAt => _createdAt ?? "";
  String get updatedAt => _updatedAt ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['Isverified'] = _isverified;
    map['email'] = _email;
    map['uniqueString'] = _uniqueString;
    map['isAdmin'] = _isAdmin;
    if (_notification != null) {
      map['Notification'] = _notification?.map((v) => v.toJson()).toList();
    }
    if (_seenNotification != null) {
      map['seenNotification'] = _seenNotification?.map((v) => v.toJson()).toList();
    }
    map['RandomNumber'] = _randomNumber;
    map['city'] = _city;
    map['from'] = _from;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}