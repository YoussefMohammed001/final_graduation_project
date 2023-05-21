/// apiStatus : true
/// seenNotificationData : {"seenNotification":[{"type":"Reservation done","message":"your reservation is pending","data":{"reservationId":"646525a004833d8a7606c697"}},{"type":"Reservation done","message":"your reservation is pending","data":{"reservationId":"646525d604833d8a7606c6a7"}}]}
/// message : "all notification marked as read"

class GetNotificationDataModel {
  GetNotificationDataModel({
    SeenNotificationData? seenNotificationData,
    String? message,
  }) {

    _seenNotificationData = seenNotificationData;
    _message = message;
  }

  GetNotificationDataModel.fromJson(dynamic json) {
    _seenNotificationData = json['data'] != null
        ? SeenNotificationData.fromJson(json['data'])
        : null;
    _message = json['message'];
  }
  SeenNotificationData? _seenNotificationData;
  String? _message;
  GetNotificationDataModel copyWith({
    bool? apiStatus,
    SeenNotificationData? seenNotificationData,
    String? message,
  }) =>
      GetNotificationDataModel(
        seenNotificationData: seenNotificationData ?? _seenNotificationData,
        message: message ?? _message,
      );
  // ignore: recursive_getters
  SeenNotificationData get seenNotificationData => _seenNotificationData ?? SeenNotificationData();
  String get message => _message ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_seenNotificationData != null) {
      map['data'] = _seenNotificationData?.toJson();
    }
    map['message'] = _message;
    return map;
  }
}

class SeenNotificationData {
  SeenNotificationData({
    List<SeenNotification>? seenNotification,
  }) {
    _seenNotification = seenNotification;
  }

  SeenNotificationData.fromJson(dynamic json) {
    if (json['seenNotification'] != null) {
      _seenNotification = [];
      json['seenNotification'].forEach((v) {
        _seenNotification?.add(SeenNotification.fromJson(v));
      });
    }
  }
  List<SeenNotification>? _seenNotification;
  SeenNotificationData copyWith({
    List<SeenNotification>? seenNotification,
  }) =>
      SeenNotificationData(
        seenNotification: seenNotification ?? _seenNotification,
      );
  List<SeenNotification> get seenNotification => _seenNotification ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_seenNotification != null) {
      map['seenNotification'] =
          _seenNotification?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// type : "Reservation done"
/// message : "your reservation is pending"
/// data : {"reservationId":"646525a004833d8a7606c697"}

class SeenNotification {
  SeenNotification({
    String? type,
    String? message,
    Data? data,
  }) {
    _type = type;
    _message = message;
    _data = data;
  }

  SeenNotification.fromJson(dynamic json) {
    _type = json['type'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _type;
  String? _message;
  Data? _data;
  SeenNotification copyWith({
    String? type,
    String? message,
    Data? data,
  }) =>
      SeenNotification(
        type: type ?? _type,
        message: message ?? _message,
        data: data ?? _data,
      );
  String get type => _type ?? "";
  String get message => _message ?? "";
  Data? get data => _data;

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

/// reservationId : "646525a004833d8a7606c697"

class Data {
  Data({
    String? reservationId,
  }) {
    _reservationId = reservationId;
  }

  Data.fromJson(dynamic json) {
    _reservationId = json['reservationId'];
  }
  String? _reservationId;
  Data copyWith({
    String? reservationId,
  }) =>
      Data(
        reservationId: reservationId ?? _reservationId,
      );
  String get reservationId => _reservationId ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reservationId'] = _reservationId;
    return map;
  }
}
