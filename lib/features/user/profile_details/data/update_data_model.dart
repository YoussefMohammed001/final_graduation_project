/// apiStatus : true
/// date : {"_id":"642d9a57e1acb93a4cac044e","name":"Youssef Mohamed","Isverified":true,"email":"youssefdev3011@gmail.com","isAdmin":false,"isDoctor":false,"RandomNumber":"","phone":1008451421,"createdAt":"2023-04-05T15:57:11.917Z","updatedAt":"2023-04-05T18:37:29.228Z","uniqueString":3610}
/// message : "user data updated"

class UpdateDataModel {
  UpdateDataModel({
      bool? apiStatus, 
      Date? date, 
      String? message,}){
    _apiStatus = apiStatus;
    _date = date;
    _message = message;
}

  UpdateDataModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _date = json['date'] != null ? Date.fromJson(json['date']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  Date? _date;
  String? _message;

  bool get apiStatus => _apiStatus ?? false;
  Date get date => _date ?? date;
  String get message => _message ??"" ;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_date != null) {
      map['date'] = _date?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}


class Date {
  Date({
      String? id, 
      String? name, 
      bool? isverified, 
      String? email, 
      bool? isAdmin, 
      bool? isDoctor, 
      String? randomNumber, 
      num? phone, 
      String? createdAt, 
      String? updatedAt, 
      num? uniqueString,}){
    _id = id;
    _name = name;
    _isverified = isverified;
    _email = email;
    _isAdmin = isAdmin;
    _isDoctor = isDoctor;
    _randomNumber = randomNumber;
    _phone = phone;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _uniqueString = uniqueString;
}

  Date.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _isverified = json['Isverified'];
    _email = json['email'];
    _isAdmin = json['isAdmin'];
    _isDoctor = json['isDoctor'];
    _randomNumber = json['RandomNumber'];
    _phone = json['phone'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _uniqueString = json['uniqueString'];
  }
  String? _id;
  String? _name;
  bool? _isverified;
  String? _email;
  bool? _isAdmin;
  bool? _isDoctor;
  String? _randomNumber;
  num? _phone;
  String? _createdAt;
  String? _updatedAt;
  num? _uniqueString;

  String get id => _id ?? "";
  String get name => _name ?? "";
  bool get isverified => _isverified ?? false;
  String get email => _email ?? "";
  bool get isAdmin => _isAdmin ?? false;
  bool get isDoctor => _isDoctor ?? false;
  String get randomNumber => _randomNumber ?? "";
  num get phone => _phone ?? 0;
  String get createdAt => _createdAt ?? "";
  String get updatedAt => _updatedAt ?? "";
  num get uniqueString => _uniqueString ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['Isverified'] = _isverified;
    map['email'] = _email;
    map['isAdmin'] = _isAdmin;
    map['isDoctor'] = _isDoctor;
    map['RandomNumber'] = _randomNumber;
    map['phone'] = _phone;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['uniqueString'] = _uniqueString;
    return map;
  }

}