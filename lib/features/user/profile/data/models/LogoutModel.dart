/// apiStatus : true
/// data : ""
/// message : "logged out on device"

class LogoutModel {
  LogoutModel({
      bool? apiStatus, 
      String? data, 
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  LogoutModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _data = json['data'];
    _message = json['message'];
  }
  bool? _apiStatus;
  String? _data;
  String? _message;
LogoutModel copyWith({  bool? apiStatus,
  String? data,
  String? message,
}) => LogoutModel(  apiStatus: apiStatus ?? _apiStatus,
  data: data ?? _data,
  message: message ?? _message,
);
  bool get apiStatus => _apiStatus ?? false;
  String get data => _data ?? "";
  String get message => _message ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    map['data'] = _data;
    map['message'] = _message;
    return map;
  }

}