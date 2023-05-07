/// apiStatus : true
/// data : {"img":[{"public_id":"doctorImages/bqxuuldsp7qgxgmduuwp","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682776328/doctorImages/bqxuuldsp7qgxgmduuwp.jpg","_id":"644d20a8bcd079eba56ee53e"},{"public_id":"clinicImages/xmnizgx4nkv1io9x1jhr","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682776225/clinicImages/xmnizgx4nkv1io9x1jhr.jpg","_id":"644d20a8bcd079eba56ee53f"},{"public_id":"clinicImages/eu5fmvwodt7rb3s5ylgl","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682776227/clinicImages/eu5fmvwodt7rb3s5ylgl.jpg","_id":"644d20a8bcd079eba56ee540"},{"public_id":"clinicImages/we4a2tabghuxhmzbzbfm","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682776230/clinicImages/we4a2tabghuxhmzbzbfm.jpg","_id":"644d20a8bcd079eba56ee541"},{"public_id":"clinicImages/gv98uwyuew6apcombklk","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407908/clinicImages/gv98uwyuew6apcombklk.jpg","_id":"6456c4269db73674ee159ae1"},{"public_id":"clinicImages/j2k9p0vlhztskx4fxtd8","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407908/clinicImages/j2k9p0vlhztskx4fxtd8.jpg","_id":"6456c4269db73674ee159ae2"},{"public_id":"clinicImages/k4h5k9lznvq1p7fwdwqo","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407909/clinicImages/k4h5k9lznvq1p7fwdwqo.jpg","_id":"6456c4269db73674ee159ae3"},{"public_id":"clinicImages/etfekzzurrkeelqjyq0a","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407909/clinicImages/etfekzzurrkeelqjyq0a.jpg","_id":"6456c4269db73674ee159ae4"},{"public_id":"clinicImages/hnm1rsbzme6jyhspijx3","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407910/clinicImages/hnm1rsbzme6jyhspijx3.jpg","_id":"6456c4269db73674ee159ae5"}]}
/// message : "clinic images uploaded"

class ClinicImagesModel {
  ClinicImagesModel({
      bool? apiStatus, 
      Data? data, 
      String? message,}){
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
}

  ClinicImagesModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  Data? _data;
  String? _message;

  bool get apiStatus => _apiStatus ?? false;
  Data get data => _data ?? Data();
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

/// img : [{"public_id":"doctorImages/bqxuuldsp7qgxgmduuwp","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682776328/doctorImages/bqxuuldsp7qgxgmduuwp.jpg","_id":"644d20a8bcd079eba56ee53e"},{"public_id":"clinicImages/xmnizgx4nkv1io9x1jhr","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682776225/clinicImages/xmnizgx4nkv1io9x1jhr.jpg","_id":"644d20a8bcd079eba56ee53f"},{"public_id":"clinicImages/eu5fmvwodt7rb3s5ylgl","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682776227/clinicImages/eu5fmvwodt7rb3s5ylgl.jpg","_id":"644d20a8bcd079eba56ee540"},{"public_id":"clinicImages/we4a2tabghuxhmzbzbfm","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1682776230/clinicImages/we4a2tabghuxhmzbzbfm.jpg","_id":"644d20a8bcd079eba56ee541"},{"public_id":"clinicImages/gv98uwyuew6apcombklk","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407908/clinicImages/gv98uwyuew6apcombklk.jpg","_id":"6456c4269db73674ee159ae1"},{"public_id":"clinicImages/j2k9p0vlhztskx4fxtd8","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407908/clinicImages/j2k9p0vlhztskx4fxtd8.jpg","_id":"6456c4269db73674ee159ae2"},{"public_id":"clinicImages/k4h5k9lznvq1p7fwdwqo","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407909/clinicImages/k4h5k9lznvq1p7fwdwqo.jpg","_id":"6456c4269db73674ee159ae3"},{"public_id":"clinicImages/etfekzzurrkeelqjyq0a","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407909/clinicImages/etfekzzurrkeelqjyq0a.jpg","_id":"6456c4269db73674ee159ae4"},{"public_id":"clinicImages/hnm1rsbzme6jyhspijx3","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1683407910/clinicImages/hnm1rsbzme6jyhspijx3.jpg","_id":"6456c4269db73674ee159ae5"}]

class Data {
  Data({
      List<Img>? img,}){
    _img = img;
}

  Data.fromJson(dynamic json) {
    if (json['img'] != null) {
      _img = [];
      json['img'].forEach((v) {
        _img?.add(Img.fromJson(v));
      });
    }
  }
  List<Img>? _img;

  List<Img> get img => _img ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_img != null) {
      map['img'] = _img?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// public_id : "doctorImages/bqxuuldsp7qgxgmduuwp"
/// url : "https://res.cloudinary.com/dlivgib8n/image/upload/v1682776328/doctorImages/bqxuuldsp7qgxgmduuwp.jpg"
/// _id : "644d20a8bcd079eba56ee53e"

class Img {
  Img({
      String? publicId, 
      String? url, 
      String? id,}){
    _publicId = publicId;
    _url = url;
    _id = id;
}

  Img.fromJson(dynamic json) {
    _publicId = json['public_id'];
    _url = json['url'];
    _id = json['_id'];
  }
  String? _publicId;
  String? _url;
  String? _id;

  String get publicId => _publicId ?? "";
  String get url => _url ?? '';
  String get id => _id ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['public_id'] = _publicId;
    map['url'] = _url;
    map['_id'] = _id;
    return map;
  }

}