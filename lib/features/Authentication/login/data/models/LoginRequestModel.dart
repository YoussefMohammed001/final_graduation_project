/// apiStatus : true
/// data : {"userData":{"_id":"63fdeb2babb8431411131168","name":"Youssef Muhamed","Isverified":false,"email":"yoseffmohamed0011@gmail.com","uniqueString":590819,"isAdmin":false,"Notification":[],"seenNotification":[],"RandomNumber":"","city":"cairo","from":"Egypt","createdAt":"2023-02-28T11:53:15.416Z","updatedAt":"2023-02-28T11:53:53.511Z"},"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2M2ZkZWIyYmFiYjg0MzE0MTExMzExNjgiLCJpYXQiOjE2Nzc1ODUyMzN9.8CRhp4tR4YoRy8vHAcIgsmuHyubLwMxqTr22myWrZZQ"}
/// message : "Logged In"

class LoginRequestModel {

  LoginRequestModel({
      bool? apiStatus, 
      Data? data, 
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  LoginRequestModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  Data? _data;
  String? _message;
LoginRequestModel copyWith({  bool? apiStatus,
  Data? data,
  String? message,
}) => LoginRequestModel(  apiStatus: apiStatus ?? _apiStatus,
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

/// userData : {"_id":"63fdeb2babb8431411131168","name":"Youssef Muhamed","Isverified":false,"email":"yoseffmohamed0011@gmail.com","uniqueString":590819,"isAdmin":false,"Notification":[],"seenNotification":[],"RandomNumber":"","city":"cairo","from":"Egypt","createdAt":"2023-02-28T11:53:15.416Z","updatedAt":"2023-02-28T11:53:53.511Z"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2M2ZkZWIyYmFiYjg0MzE0MTExMzExNjgiLCJpYXQiOjE2Nzc1ODUyMzN9.8CRhp4tR4YoRy8vHAcIgsmuHyubLwMxqTr22myWrZZQ"

class Data {
  Data({
      UserData? userData, 
      String? token,}){
    _userData = userData;
    _token = token;
}

  Data.fromJson(dynamic json) {
    _userData = json['userData'] != null ? UserData.fromJson(json['userData']) : null;
    _token = json['token'];
  }
  UserData? _userData;
  String? _token;
Data copyWith({  UserData? userData,
  String? token,
}) => Data(  userData: userData ?? _userData,
  token: token ?? _token,
);
  UserData get userData => _userData ?? userData;
  String get token => _token ?? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_userData != null) {
      map['userData'] = _userData?.toJson();
    }
    map['token'] = _token;
    return map;
  }

}

/// _id : "63fdeb2babb8431411131168"
/// name : "Youssef Muhamed"
/// Isverified : false
/// email : "yoseffmohamed0011@gmail.com"
/// uniqueString : 590819
/// isAdmin : false
/// Notification : []
/// seenNotification : []
/// RandomNumber : ""
/// city : "cairo"
/// from : "Egypt"
/// createdAt : "2023-02-28T11:53:15.416Z"
/// updatedAt : "2023-02-28T11:53:53.511Z"

class UserData {
  UserData({
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

  UserData.fromJson(dynamic json) {
    _id = json['_id'];
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
UserData copyWith({  String? id,
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
}) => UserData(  id: id ?? _id,
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
  String get name => _name?? "";
  bool get isverified => _isverified?? false;
  String get email => _email?? "";
  num get uniqueString => _uniqueString ??0;
  bool get isAdmin => _isAdmin ?? false;
  List<dynamic> get notification => _notification ??[];
  List<dynamic> get seenNotification => _seenNotification??[];
  String get randomNumber => _randomNumber?? "";
  String get city => _city?? "";
  String get from => _from?? "";
  String get createdAt => _createdAt?? "";
  String get updatedAt => _updatedAt?? "";

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