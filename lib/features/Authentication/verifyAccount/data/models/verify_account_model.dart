/// apiStatus : true
/// data : {"user":{"name":"Youssef Mohamed","Isverified":false,"email":"mohamedahmed2020303010@gmail.com","uniqueString":202137,"isAdmin":false,"Notification":[],"seenNotification":[],"RandomNumber":"","city":"cairo","from":"el shourok","_id":"63fe2fce16ba18ac8634465f","createdAt":"2023-02-28T16:46:06.975Z","updatedAt":"2023-02-28T16:46:06.975Z"}}
/// message : "user Added successfully"

class VerifyAccountModel {
  VerifyAccountModel({
      bool? apiStatus, 
      Data? data, 
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  VerifyAccountModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  Data? _data;
  String? _message;
VerifyAccountModel copyWith({  bool? apiStatus,
  Data? data,
  String? message,
}) => VerifyAccountModel(  apiStatus: apiStatus ?? _apiStatus,
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

/// user : {"name":"Youssef Mohamed","Isverified":false,"email":"mohamedahmed2020303010@gmail.com","uniqueString":202137,"isAdmin":false,"Notification":[],"seenNotification":[],"RandomNumber":"","city":"cairo","from":"el shourok","_id":"63fe2fce16ba18ac8634465f","createdAt":"2023-02-28T16:46:06.975Z","updatedAt":"2023-02-28T16:46:06.975Z"}

class Data {
  Data({
      User? user,
    String? token,
  }){
    _user = user;
    _token = token;

  }

  Data.fromJson(dynamic json) {
    _token = json['token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? _user;
  String? _token;

  Data copyWith({  User? user,   String? token,
}) => Data(  user: user ?? _user,
    token: token ?? _token,

  );
  User get user => _user ?? user;
  String get token => _token ?? "";


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
      map['token'] = _token;
    }
    return map;
  }

}

class User {
  User({
      String? name, 
      bool? isverified, 
      String? email, 
      num? uniqueString, 
      bool? isAdmin, 
      List<dynamic>? notification, 
      List<dynamic>? seenNotification, 
      String? randomNumber, 
      int? phone,
      String? id,
      String? createdAt, 
      String? updatedAt,}){
    _name = name;
    _isverified = isverified;
    _email = email;
    _uniqueString = uniqueString;
    _isAdmin = isAdmin;
    _notification = notification;
    _seenNotification = seenNotification;
    _randomNumber = randomNumber;
    _phone = phone;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _name = json['name'];
    _isverified = json['Isverified'];
    _email = json['email'];
    _uniqueString = json['uniqueString'];
    _isAdmin = json['isAdmin'];
    if (json['Notification'] != null) {
      _notification = [];
      json['Notification'].forEach((v) {
       // _notification?.add(Dynamic.fromJson(v));
      });
    }
    if (json['seenNotification'] != null) {
      _seenNotification = [];
      json['seenNotification'].forEach((v) {
       // _seenNotification?.add(Dynamic.fromJson(v));
      });
    }
    _randomNumber = json['RandomNumber'];
    _phone = json['phone'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _name;
  bool? _isverified;
  String? _email;
  num? _uniqueString;
  bool? _isAdmin;
  List<dynamic>? _notification;
  List<dynamic>? _seenNotification;
  String? _randomNumber;
  int? _phone;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
User copyWith({  String? name,
  bool? isverified,
  String? email,
  num? uniqueString,
  bool? isAdmin,
  List<dynamic>? notification,
  List<dynamic>? seenNotification,
  String? randomNumber,
  int? phone,
  String? id,
  String? createdAt,
  String? updatedAt,
}) => User(  name: name ?? _name,
  isverified: isverified ?? _isverified,
  email: email ?? _email,
  uniqueString: uniqueString ?? _uniqueString,
  isAdmin: isAdmin ?? _isAdmin,
  notification: notification ?? _notification,
  seenNotification: seenNotification ?? _seenNotification,
  randomNumber: randomNumber ?? _randomNumber,
  phone: phone ?? _phone,
  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String get name => _name ?? "";
  bool get isverified => _isverified ?? false;
  String get email => _email ?? "";
  num get uniqueString => _uniqueString ?? 0;
  bool get isAdmin => _isAdmin ?? false;
  List<dynamic> get notification => _notification ??[];
  List<dynamic> get seenNotification => _seenNotification ??[];
  String get randomNumber => _randomNumber?? "";
  int get phone => _phone ?? 0;
  String get id => _id?? "";
  String get createdAt => _createdAt?? "";
  String get updatedAt => _updatedAt ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
    map['phone'] = _phone;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}