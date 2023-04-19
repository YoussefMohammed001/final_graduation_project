/// apiStatus : true
/// data : "practiceLicense uploaded success"

class ClinicLicenceModel {
  ClinicLicenceModel({
      bool? apiStatus, 
      String? data,}){
    _apiStatus = apiStatus;
    _data = data;
}

  ClinicLicenceModel.fromJson(dynamic json) {
    _apiStatus = json['apiStatus'];
    _data = json['data'];
  }
  bool? _apiStatus;
  String? _data;

  bool get apiStatus => _apiStatus ?? false;
  String? get data => _data ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiStatus'] = _apiStatus;
    map['data'] = _data;
    return map;
  }

}