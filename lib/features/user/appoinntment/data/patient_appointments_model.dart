/// apiStatus : true
/// patientAppointments : [{"city":"cairo","placeNumber":"elshrouk","name":"Mohamed Ahmed","doctorImg":{"public_id":"doctorImages/bsqz98e0h73wd0oncevi","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682454542/doctorImages/bsqz98e0h73wd0oncevi.jpg"},"specialize":"Cardiology and Vascular Disease (Heart)","time":"3","rating":1,"day":"2023-05-06","status":"pending","id":"645391d46723d7461e209a59"}]

class PatientAppointmentsModel {
  PatientAppointmentsModel({
      bool? apiStatus, 
      List<PatientAppointments>? patientAppointments,}){
    _apiStatus = apiStatus;
    _patientAppointments = patientAppointments;
}

  PatientAppointmentsModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    if (json['data'] != null) {
      _patientAppointments = [];
      json['data'].forEach((v) {
        _patientAppointments?.add(PatientAppointments.fromJson(v));
      });
    }
  }
  bool? _apiStatus;
  List<PatientAppointments>? _patientAppointments;

  bool get apiStatus => _apiStatus ?? false;
  List<PatientAppointments> get patientAppointments => _patientAppointments ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_patientAppointments != null) {
      map['data'] = _patientAppointments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// city : "cairo"
/// placeNumber : "elshrouk"
/// name : "Mohamed Ahmed"
/// doctorImg : {"public_id":"doctorImages/bsqz98e0h73wd0oncevi","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682454542/doctorImages/bsqz98e0h73wd0oncevi.jpg"}
/// specialize : "Cardiology and Vascular Disease (Heart)"
/// time : "3"
/// rating : 1
/// day : "2023-05-06"
/// status : "pending"
/// id : "645391d46723d7461e209a59"

class PatientAppointments {
  PatientAppointments({
      String? city, 
      String? placeNumber, 
      String? name, 
      DoctorImg? doctorImg, 
      String? specialize, 
      String? time, 
      num? rating, 
      String? day, 
      String? status, 
      String? id,}){
    _city = city;
    _placeNumber = placeNumber;
    _name = name;
    _doctorImg = doctorImg;
    _specialize = specialize;
    _time = time;
    _rating = rating;
    _day = day;
    _status = status;
    _id = id;
}

  PatientAppointments.fromJson(dynamic json) {
    _city = json['city'];
    _placeNumber = json['placeNumber'];
    _name = json['name'];
    _doctorImg = json['doctorImg'] != null ? DoctorImg.fromJson(json['doctorImg']) : null;
    _specialize = json['specialize'];
    _time = json['time'];
    _rating = json['rating'];
    _day = json['day'];
    _status = json['status'];
    _id = json['id'];
  }
  String? _city;
  String? _placeNumber;
  String? _name;
  DoctorImg? _doctorImg;
  String? _specialize;
  String? _time;
  num? _rating;
  String? _day;
  String? _status;
  String? _id;

  String get city => _city ?? "";
  String get placeNumber => _placeNumber ?? '';
  String get name => _name ?? "";
  DoctorImg get doctorImg => _doctorImg ?? doctorImg;
  String get specialize => _specialize ?? "";
  String get time => _time ?? "";
  num get rating => _rating ?? 0;
  String get day => _day ?? "";
  String get status => _status ?? "";
  String get id => _id ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = _city;
    map['placeNumber'] = _placeNumber;
    map['name'] = _name;
    if (_doctorImg != null) {
      map['doctorImg'] = _doctorImg?.toJson();
    }
    map['specialize'] = _specialize;
    map['time'] = _time;
    map['rating'] = _rating;
    map['day'] = _day;
    map['status'] = _status;
    map['id'] = _id;
    return map;
  }

}

/// public_id : "doctorImages/bsqz98e0h73wd0oncevi"
/// url : "https://res.cloudinary.com/dlivgib8n/image/upload/v1682454542/doctorImages/bsqz98e0h73wd0oncevi.jpg"

class DoctorImg {
  DoctorImg({
      String? publicId, 
      String? url,}){
    _publicId = publicId;
    _url = url;
}

  DoctorImg.fromJson(dynamic json) {
    _publicId = json['public_id'];
    _url = json['url'];
  }
  String? _publicId;
  String? _url;

  String get publicId => _publicId ?? "";
  String get url => _url ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['public_id'] = _publicId;
    map['url'] = _url;
    return map;
  }

}