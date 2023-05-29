/// doctorId : "645a7f818f75c371bd5bb41c"
/// appointments : [{"dayNo":1,"durations":[{"from":1.5,"to":5},{"from":7,"to":10},{"from":13,"to":17}]},{"dayNo":2,"durations":[{"from":1.5,"to":5},{"from":7,"to":10},{"from":13,"to":17}]}]

class PostWorkingHoursModel {
  PostWorkingHoursModel({
    String? doctorId,
    List<Appointments>? appointments,
  }) {
    _doctorId = doctorId;
    _appointments = appointments;
  }

  PostWorkingHoursModel.fromJson(dynamic json) {
    _doctorId = json['doctorId'];
    if (json['appointments'] != null) {
      _appointments = [];
      json['appointments'].forEach((v) {
        _appointments?.add(Appointments.fromJson(v));
      });
    }
  }

  String? _doctorId;
  List<Appointments>? _appointments;

  String get doctorId => _doctorId ?? "";

  List<Appointments> get appointments => _appointments ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctorId'] = _doctorId;
    if (_appointments != null) {
      map['appointments'] = _appointments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  set appointments(List<Appointments> value) {
    _appointments = value;
  }

  set doctorId(String value) {
    _doctorId = value;
  }
}

class Appointments {
  Appointments({
    num? dayNo,
    bool? enabled,
    List<Durations>? durations,
  }) {
    _dayNo = dayNo;
    _enabled = enabled ?? false;
    _durations = durations ?? [];
  }

  Appointments.fromJson(dynamic json) {
    _dayNo = json['dayNo'];
    if (json['durations'] != null) {
      _durations = [];
      json['durations'].forEach((v) {
        _durations?.add(Durations.fromJson(v));
      });
    }
    _enabled = durations.isNotEmpty;
  }

  num? _dayNo;
  bool? _enabled;
  List<Durations>? _durations;

  set dayNo(num value) {
    _dayNo = value;
  }

  bool get enabled => _enabled ?? false;

  set enabled(bool value) {
    _enabled = value;
  }

  num get dayNo => _dayNo ?? 0;

  List<Durations> get durations => _durations ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dayNo'] = _dayNo;
    if (_durations != null) {
      map['durations'] = _durations?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  set durations(List<Durations> value) {
    _durations = value;
  }
}

class Durations {
  Durations({
    num? from,
    num? to,
  }) {
    _from = from;
    _to = to;
  }

  Durations.fromJson(dynamic json) {
    _from = json['from'];
    _to = json['to'];
  }

  num? _from;
  num? _to;

  num get from => _from ?? 0;

  num get to => _to ?? 0;

  set from(num value) {
    _from = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['from'] = _from;
    map['to'] = _to;
    return map;
  }

  set to(num value) {
    _to = value;
  }
}
