/// apiStatus : true
/// data : {"user":{"name":"youssef","Isverified":false,"email":"yousef@gmail.com","isAdmin":false,"Notification":[],"seenNotification":[],"RandomNumber":"","city":"cairo","from":"future city","_id":"63fb9637f37f58ff3062e563","createdAt":"2023-02-26T17:26:15.387Z","updatedAt":"2023-02-26T17:26:15.387Z"}}
/// message : "user Added successfully"

class RegisterRequestModel {
  RegisterRequestModel({
      bool? apiStatus, 
      Data? data, 
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  RegisterRequestModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  Data? _data;
  String? _message;
RegisterRequestModel copyWith({  bool? apiStatus,
  Data? data,
  String? message,
}) => RegisterRequestModel(  apiStatus: apiStatus ?? _apiStatus,
  data: data ?? _data,
  message: message ?? _message,
);
  bool get apiStatus => _apiStatus ?? apiStatus;
  Data get data => _data ?? data;
  String get message => _message ??"";

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

/// user : {"name":"youssef","Isverified":false,"email":"yousef@gmail.com","isAdmin":false,"Notification":[],"seenNotification":[],"RandomNumber":"","city":"cairo","from":"future city","_id":"63fb9637f37f58ff3062e563","createdAt":"2023-02-26T17:26:15.387Z","updatedAt":"2023-02-26T17:26:15.387Z"}

class Data {
  Data({
      User? user,}){
    _user = user;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? _user;
Data copyWith({  User? user,
}) => Data(  user: user ?? _user,
);
  User get user => _user ?? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// name : "youssef"
/// Isverified : false
/// email : "yousef@gmail.com"
/// isAdmin : false
/// Notification : []
/// seenNotification : []
/// RandomNumber : ""
/// city : "cairo"
/// from : "future city"
/// _id : "63fb9637f37f58ff3062e563"
/// createdAt : "2023-02-26T17:26:15.387Z"
/// updatedAt : "2023-02-26T17:26:15.387Z"

class User {
  User({
      String? name, 
      bool? isverified, 
      String? email, 
      bool? isAdmin, 
      List<dynamic>? notification, 
      List<dynamic>? seenNotification, 
      String? randomNumber, 
      String? city, 
      String? from, 
      String? id, 
      String? createdAt, 
      String? updatedAt,}){
    _name = name;
    _isverified = isverified;
    _email = email;
    _isAdmin = isAdmin;
    _notification = notification;
    _seenNotification = seenNotification;
    _randomNumber = randomNumber;
    _city = city;
    _from = from;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _name = json['name'];
    _isverified = json['Isverified'];
    _email = json['email'];
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
      //  _seenNotification?.add(Dynamic.fromJson(v));
      });
    }
    _randomNumber = json['RandomNumber'];
    _city = json['city'];
    _from = json['from'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _name;
  bool? _isverified;
  String? _email;
  bool? _isAdmin;
  List<dynamic>? _notification;
  List<dynamic>? _seenNotification;
  String? _randomNumber;
  String? _city;
  String? _from;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
User copyWith({  String? name,
  bool? isverified,
  String? email,
  bool? isAdmin,
  List<dynamic>? notification,
  List<dynamic>? seenNotification,
  String? randomNumber,
  String? city,
  String? from,
  String? id,
  String? createdAt,
  String? updatedAt,
}) => User(  name: name ?? _name,
  isverified: isverified ?? _isverified,
  email: email ?? _email,
  isAdmin: isAdmin ?? _isAdmin,
  notification: notification ?? _notification,
  seenNotification: seenNotification ?? _seenNotification,
  randomNumber: randomNumber ?? _randomNumber,
  city: city ?? _city,
  from: from ?? _from,
  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String get name => _name ?? "";
  bool get isverified => _isverified ?? false;
  String get email => _email ?? "";
  bool get isAdmin => _isAdmin ?? false;
  List<dynamic> get notification => _notification ?? [];
  List<dynamic> get seenNotification => _seenNotification ?? [];
  String get randomNumber => _randomNumber ?? "";
  String get city => _city ?? "";
  String get from => _from?? "";
  String get id => _id?? "";
  String get createdAt => _createdAt?? "";
  String get updatedAt => _updatedAt?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['Isverified'] = _isverified;
    map['email'] = _email;
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
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}