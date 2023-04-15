/// apiStatus : true
/// user : {"profilePicture":{"public_id":"doctorImages/vniygnmfljy63gufxnyj","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681249500/doctorImages/vniygnmfljy63gufxnyj.jpg"}}
/// data : "profile picture uploaded success"

class UploadUserImageModel {
  UploadUserImageModel({
      bool? apiStatus, 
      User? user, 
      String? data,}){
    _apiStatus = apiStatus;
    _user = user;
    _data = data;
}

  UploadUserImageModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _data = json['data'];
  }
  bool? _apiStatus;
  User? _user;
  String? _data;

  bool get apiStatus => _apiStatus ?? false;
  User get user => _user ?? user;
  String get data => _data ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['data'] = _data;
    return map;
  }

}

/// profilePicture : {"public_id":"doctorImages/vniygnmfljy63gufxnyj","url":"https://res.cloudinary.com/dlivgib8n/image/upload/v1681249500/doctorImages/vniygnmfljy63gufxnyj.jpg"}

class User {
  User({
      ProfilePicture? profilePicture,}){
    _profilePicture = profilePicture;
}

  User.fromJson(dynamic json) {
    _profilePicture = json['profilePicture'] != null ? ProfilePicture.fromJson(json['profilePicture']) : null;
  }
  ProfilePicture? _profilePicture;

  ProfilePicture get profilePicture => _profilePicture ?? profilePicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_profilePicture != null) {
      map['profilePicture'] = _profilePicture?.toJson();
    }
    return map;
  }

}

/// public_id : "doctorImages/vniygnmfljy63gufxnyj"
/// url : "https://res.cloudinary.com/dlivgib8n/image/upload/v1681249500/doctorImages/vniygnmfljy63gufxnyj.jpg"

class ProfilePicture {
  ProfilePicture({
      String? publicId, 
      String? url,}){
    _publicId = publicId;
    _url = url;
}

  ProfilePicture.fromJson(dynamic json) {
    _publicId = json['public_id'];
    _url = json['url'];
  }
  String? _publicId;
  String? _url;

  String? get publicId => _publicId;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['public_id'] = _publicId;
    map['url'] = _url;
    return map;
  }

}