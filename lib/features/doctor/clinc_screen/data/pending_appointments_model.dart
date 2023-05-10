/// apiStatus : true
/// data : [{"address":"10OfRamadan","phone":"01554176096","status":"pending","time":"7:30","dayDate":"2023-05-12","id":"645a8c762d6a963f57d92753"},{"address":"10OfRamadan","phone":"01554176096","status":"pending","time":"8:0","dayDate":"2023-05-12","id":"645a8c882d6a963f57d92760"}]
/// n : 2

class PendingAppointmentsModel {
  PendingAppointmentsModel({
      bool? apiStatus, 
      List<Data>? data, 
      num? n,}){
    _apiStatus = apiStatus;
    _data = data;
    _n = n;
}

  PendingAppointmentsModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _n = json['n'];
  }
  bool? _apiStatus;
  List<Data>? _data;
  num? _n;

  bool get apiStatus => _apiStatus ?? false;
  List<Data> get data => _data ?? [];
  num? get n => _n ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['n'] = _n;
    return map;
  }

}

/// address : "10OfRamadan"
/// phone : "01554176096"
/// status : "pending"
/// time : "7:30"
/// dayDate : "2023-05-12"
/// id : "645a8c762d6a963f57d92753"

class Data {
  Data({
      String? address, 
      String? phone, 
      String? name,
      String? note,
      String? status,
      String? time, 
      String? dayDate, 
      String? id,}){
    _address = address;
    _phone = phone;
    _name = name;
    _note  = note;
    _status = status;
    _time = time;
    _dayDate = dayDate;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _address = json['address'];
    _phone = json['phone'];
    _name = json['PatientName'];
    _note = json['Patientnote'];
    _status = json['status'];
    _time = json['time'];
    _dayDate = json['dayDate'];
    _id = json['id'];
  }
  String? _address;
  String? _phone;
  String? _name;
  String? _note;
  String? _status;
  String? _time;
  String? _dayDate;
  String? _id;

  String get address => _address ?? "";
  String get phone => _phone?? "";
  String get name => _name?? "";
  String get note => _note?? "";
  String get status => _status?? "";
  String get time => _time?? "";
  String get dayDate => _dayDate?? "";
  String get id => _id?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = _address;
    map['phone'] = _phone;
    map['PatientName'] = _name;
    map['Patientnote'] = _note;
    map['status'] = _status;
    map['time'] = _time;
    map['dayDate'] = _dayDate;
    map['id'] = _id;
    return map;
  }

}