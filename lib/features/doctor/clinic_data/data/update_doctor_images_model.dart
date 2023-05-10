/// apiStatus : true
/// data : [{"id":"doctorImages/bqxuuldsp7qgxgmduuwp","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682776328/doctorImages/bqxuuldsp7qgxgmduuwp.jpg"},{"id":"clinicImages/xmnizgx4nkv1io9x1jhr","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682776225/clinicImages/xmnizgx4nkv1io9x1jhr.jpg"},{"id":"clinicImages/eu5fmvwodt7rb3s5ylgl","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682776227/clinicImages/eu5fmvwodt7rb3s5ylgl.jpg"},{"id":"clinicImages/we4a2tabghuxhmzbzbfm","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682776230/clinicImages/we4a2tabghuxhmzbzbfm.jpg"},{"id":"clinicImages/gv98uwyuew6apcombklk","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407908/clinicImages/gv98uwyuew6apcombklk.jpg"},{"id":"clinicImages/j2k9p0vlhztskx4fxtd8","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407908/clinicImages/j2k9p0vlhztskx4fxtd8.jpg"},{"id":"clinicImages/k4h5k9lznvq1p7fwdwqo","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407909/clinicImages/k4h5k9lznvq1p7fwdwqo.jpg"},{"id":"clinicImages/etfekzzurrkeelqjyq0a","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407909/clinicImages/etfekzzurrkeelqjyq0a.jpg"},{"id":"clinicImages/hnm1rsbzme6jyhspijx3","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407910/clinicImages/hnm1rsbzme6jyhspijx3.jpg"}]
/// message : "img changed success"

class UpdateDoctorImagesModel {
  UpdateDoctorImagesModel({
      bool? apiStatus, 
      List<UpdatedData>? data,
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  UpdateDoctorImagesModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(UpdatedData.fromJson(v));
      });
    }
    _message = json['message'];
  }
  bool? _apiStatus;
  List<UpdatedData>? _data;
  String? _message;

  bool get apiStatus => _apiStatus ?? false;
  List<UpdatedData> get data => _data ?? [];
  String get message => _message ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// id : "doctorImages/bqxuuldsp7qgxgmduuwp"
/// url : "https://res.cloudinary.com/dlivgib8n/image/upload/v1682776328/doctorImages/bqxuuldsp7qgxgmduuwp.jpg"

class UpdatedData {
  UpdatedData({
      String? id, 
      String? url,}){
    _id = id;
    _url = url;
}

  UpdatedData.fromJson(dynamic json) {
    _id = json['id'];
    _url = json['url'];
  }
  String? _id;
  String? _url;

  String get id => _id ?? "";
  String get url => _url ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['url'] = _url;
    return map;
  }

}