/// apiStatus : true
/// notifications : [{"type":"Reservation done","message":"your reservation is pending","data":{"reservationId":"64652ce7611ed28bf5ae51a2"}}]
/// message : "all notification marked as read"

class GetNotificationsModel {
  GetNotificationsModel({
      bool? apiStatus, 
      List<Notifications>? notifications, 
      String? message,}){
    _apiStatus = apiStatus;
    _notifications = notifications;
    _message = message;
}

  GetNotificationsModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    if (json['data'] != null) {
      _notifications = [];
      json['data'].forEach((v) {
        _notifications?.add(Notifications.fromJson(v));
      });
    }
    _message = json['message'];
  }
  bool? _apiStatus;
  List<Notifications>? _notifications;
  String? _message;
GetNotificationsModel copyWith({  bool? apiStatus,
  List<Notifications>? notifications,
  String? message,
}) => GetNotificationsModel(  apiStatus: apiStatus ?? _apiStatus,
  notifications: notifications ?? _notifications,
  message: message ?? _message,
);
  bool get apiStatus => _apiStatus ?? false;
  List<Notifications> get notifications => _notifications ?? [];
  String get message => _message ?? "";


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_notifications != null) {
      map['data'] = _notifications?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// type : "Reservation done"
/// message : "your reservation is pending"
/// data : {"reservationId":"64652ce7611ed28bf5ae51a2"}

class Notifications {
  Notifications({
      String? type, 
      String? message, 
      Data? data,}){
    _type = type;
    _message = message;
    _data = data;
}

  Notifications.fromJson(dynamic json) {
    _type = json['type'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _type;
  String? _message;
  Data? _data;
Notifications copyWith({  String? type,
  String? message,
  Data? data,
}) => Notifications(  type: type ?? _type,
  message: message ?? _message,
  data: data ?? _data,
);
  String get type => _type ?? "";
  String get message => _message ?? "";
  Data get data => _data ?? Data();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// reservationId : "64652ce7611ed28bf5ae51a2"

class Data {
  Data({
      String? reservationId,}){
    _reservationId = reservationId;
}

  Data.fromJson(dynamic json) {
    _reservationId = json['reservationId'];
  }
  String? _reservationId;
Data copyWith({  String? reservationId,
}) => Data(  reservationId: reservationId ?? _reservationId,
);
  String get reservationId => _reservationId ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reservationId'] = _reservationId;
    return map;
  }

}