/// apiStatus : true
/// data : {"_id":"64146f07042c88ada34ece8c","name":"youssef mohamed","Isverified":false,"email":"yoseffmohamed001@gmail.com","isAdmin":false,"isDoctor":false,"Notification":[],"seenNotification":[],"RandomNumber":"","phone":1211829505,"uniqueString":9332,"createdAt":"2023-03-17T13:45:43.055Z","updatedAt":"2023-03-17T13:46:43.226Z"}
/// message : "password updated"

class ChangePass {
  ChangePass({
      bool? apiStatus, 
      Data? data, 
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  ChangePass.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  Data? _data;
  String? _message;
ChangePass copyWith({  bool? apiStatus,
  Data? data,
  String? message,
}) => ChangePass(  apiStatus: apiStatus ?? _apiStatus,
  data: data ?? _data,
  message: message ?? _message,
);
  bool get apiStatus => _apiStatus ?? false;
  Data get data => _data ?? Data();
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

/// _id : "64146f07042c88ada34ece8c"
/// name : "youssef mohamed"
/// Isverified : false
/// email : "yoseffmohamed001@gmail.com"
/// isAdmin : false
/// isDoctor : false
/// Notification : []
/// seenNotification : []
/// RandomNumber : ""
/// phone : 1211829505
/// uniqueString : 9332
/// createdAt : "2023-03-17T13:45:43.055Z"
/// updatedAt : "2023-03-17T13:46:43.226Z"

class Data {
  Data({
      String? id, 
      String? name, 
      bool? isverified, 
      String? email, 
      bool? isAdmin, 
      bool? isDoctor, 
      List<dynamic>? notification, 
      List<dynamic>? seenNotification, 
      String? randomNumber, 
      num? phone, 
      num? uniqueString, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _isverified = isverified;
    _email = email;
    _isAdmin = isAdmin;
    _isDoctor = isDoctor;
    _notification = notification;
    _seenNotification = seenNotification;
    _randomNumber = randomNumber;
    _phone = phone;
    _uniqueString = uniqueString;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _isverified = json['Isverified'];
    _email = json['email'];
    _isAdmin = json['isAdmin'];
    _isDoctor = json['isDoctor'];
    if (json['Notification'] != null) {
      _notification = [];
      json['Notification'].forEach((v) {
     //   _notification?.add(Dynamic.fromJson(v));
      });
    }
    if (json['seenNotification'] != null) {
      _seenNotification = [];
      json['seenNotification'].forEach((v) {
      //  _seenNotification?.add(Dynamic.fromJson(v));
      });
    }
    _randomNumber = json['RandomNumber'];
    _phone = json['phone'];
    _uniqueString = json['uniqueString'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _name;
  bool? _isverified;
  String? _email;
  bool? _isAdmin;
  bool? _isDoctor;
  List<dynamic>? _notification;
  List<dynamic>? _seenNotification;
  String? _randomNumber;
  num? _phone;
  num? _uniqueString;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  String? id,
  String? name,
  bool? isverified,
  String? email,
  bool? isAdmin,
  bool? isDoctor,
  List<dynamic>? notification,
  List<dynamic>? seenNotification,
  String? randomNumber,
  num? phone,
  num? uniqueString,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  isverified: isverified ?? _isverified,
  email: email ?? _email,
  isAdmin: isAdmin ?? _isAdmin,
  isDoctor: isDoctor ?? _isDoctor,
  notification: notification ?? _notification,
  seenNotification: seenNotification ?? _seenNotification,
  randomNumber: randomNumber ?? _randomNumber,
  phone: phone ?? _phone,
  uniqueString: uniqueString ?? _uniqueString,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String get id => _id ?? "";
  String get name => _name ?? "";
  bool get isverified => _isverified ?? false;
  String get email => _email ?? "";
  bool get isAdmin => _isAdmin ?? false;
  bool get isDoctor => _isDoctor ?? false;
  List<dynamic> get notification => _notification ?? [];
  List<dynamic> get seenNotification => _seenNotification ?? [];
  String get randomNumber => _randomNumber ?? "";
  num get phone => _phone ?? 0;
  num get uniqueString => _uniqueString ?? 0;
  String get createdAt => _createdAt ?? "";
  String get updatedAt => _updatedAt ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['Isverified'] = _isverified;
    map['email'] = _email;
    map['isAdmin'] = _isAdmin;
    map['isDoctor'] = _isDoctor;
    if (_notification != null) {
      map['Notification'] = _notification?.map((v) => v.toJson()).toList();
    }
    if (_seenNotification != null) {
      map['seenNotification'] = _seenNotification?.map((v) => v.toJson()).toList();
    }
    map['RandomNumber'] = _randomNumber;
    map['phone'] = _phone;
    map['uniqueString'] = _uniqueString;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}