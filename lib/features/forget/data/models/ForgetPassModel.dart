/// apiStatus : true
/// data : {"acknowledged":true,"modifiedCount":1,"upsertedId":null,"upsertedCount":0,"matchedCount":1}
/// message : "check your inbox of mail and reset your password."

class ForgetPassModel {
  ForgetPassModel({
      bool? apiStatus, 
      Data? data, 
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  ForgetPassModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  Data? _data;
  String? _message;
ForgetPassModel copyWith({  bool? apiStatus,
  Data? data,
  String? message,
}) => ForgetPassModel(  apiStatus: apiStatus ?? _apiStatus,
  data: data ?? _data,
  message: message ?? _message,
);
  bool get apiStatus => _apiStatus ?? false;
  Data? get data => _data ?? data;
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

/// acknowledged : true
/// modifiedCount : 1
/// upsertedId : null
/// upsertedCount : 0
/// matchedCount : 1

class Data {
  Data({
      bool? acknowledged, 
      num? modifiedCount, 
      dynamic upsertedId, 
      num? upsertedCount, 
      num? matchedCount,}){
    _acknowledged = acknowledged;
    _modifiedCount = modifiedCount;
    _upsertedId = upsertedId;
    _upsertedCount = upsertedCount;
    _matchedCount = matchedCount;
}

  Data.fromJson(dynamic json) {
    _acknowledged = json['acknowledged'];
    _modifiedCount = json['modifiedCount'];
    _upsertedId = json['upsertedId'];
    _upsertedCount = json['upsertedCount'];
    _matchedCount = json['matchedCount'];
  }
  bool? _acknowledged;
  num? _modifiedCount;
  dynamic _upsertedId;
  num? _upsertedCount;
  num? _matchedCount;
Data copyWith({  bool? acknowledged,
  num? modifiedCount,
  dynamic upsertedId,
  num? upsertedCount,
  num? matchedCount,
}) => Data(  acknowledged: acknowledged ?? _acknowledged,
  modifiedCount: modifiedCount ?? _modifiedCount,
  upsertedId: upsertedId ?? _upsertedId,
  upsertedCount: upsertedCount ?? _upsertedCount,
  matchedCount: matchedCount ?? _matchedCount,
);
  bool? get acknowledged => _acknowledged;
  num? get modifiedCount => _modifiedCount;
  dynamic get upsertedId => _upsertedId;
  num? get upsertedCount => _upsertedCount;
  num? get matchedCount => _matchedCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['acknowledged'] = _acknowledged;
    map['modifiedCount'] = _modifiedCount;
    map['upsertedId'] = _upsertedId;
    map['upsertedCount'] = _upsertedCount;
    map['matchedCount'] = _matchedCount;
    return map;
  }

}