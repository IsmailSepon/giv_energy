/// data : [{"serial":"GV3022G001","status":"ONLINE","last_online":"2021-07-18T01:25:18Z","last_updated":"2021-07-19T00:41:12Z","commission_date":"2021-07-13T00:00:00Z","warranty":{"type":"Standard","expiry_date":"2026-07-13T00:00:00Z"},"values":{"current":10.8,"voltage":59.2,"percentage":90}},{"serial":"GV3022G002","status":"OFFLINE","last_online":"2021-07-18T01:25:18Z","last_updated":"2021-07-19T00:41:12Z","commission_date":"2021-07-13T00:00:00Z","warranty":{"type":"Standard","expiry_date":"2026-07-13T00:00:00Z"},"values":{"current":9.8,"voltage":55,"percentage":47}},{"serial":"GV3022G003","status":"ONLINE","last_online":"2021-07-18T01:25:18Z","last_updated":"2021-07-19T00:41:12Z","commission_date":"2021-07-13T00:00:00Z","warranty":{"type":"Standard","expiry_date":"2026-07-13T00:00:00Z"},"values":{"current":10.8,"voltage":58.2,"percentage":93}},{"serial":"GV3022G004","status":"OFFLINE","last_online":"2021-07-18T01:25:18Z","last_updated":"2021-07-19T00:41:12Z","commission_date":"2021-07-13T00:00:00Z","warranty":{"type":"Standard","expiry_date":"2026-07-13T00:00:00Z"},"values":{"current":9.8,"voltage":46,"percentage":75}},{"serial":"GV3022G005","status":"ONLINE","last_online":"2021-07-18T01:25:18Z","last_updated":"2021-07-19T00:41:12Z","commission_date":"2021-07-13T00:00:00Z","warranty":{"type":"Standard","expiry_date":"2026-07-13T00:00:00Z"},"values":{"current":11.2,"voltage":53.6,"percentage":87}},{"serial":"GV3022G006","status":"OFFLINE","last_online":"2021-07-18T01:25:18Z","last_updated":"2021-07-19T00:41:12Z","commission_date":"2021-07-13T00:00:00Z","warranty":{"type":"Standard","expiry_date":"2026-07-13T00:00:00Z"},"values":{"current":16,"voltage":54.3,"percentage":100}},{"serial":"GV3022G007","status":"ONLINE","last_online":"2021-07-18T01:25:18Z","last_updated":"2021-07-19T00:41:12Z","commission_date":"2021-07-13T00:00:00Z","warranty":{"type":"Standard","expiry_date":"2026-07-13T00:00:00Z"},"values":{"current":12,"voltage":52.2,"percentage":99}},{"serial":"GV3022G008","status":"OFFLINE","last_online":"2021-07-18T01:25:18Z","last_updated":"2021-07-19T00:41:12Z","commission_date":"2021-07-13T00:00:00Z","warranty":{"type":"Standard","expiry_date":"2026-07-13T00:00:00Z"},"values":{"current":11.4,"voltage":53.1,"percentage":92}},{"serial":"GV3022G009","status":"ONLINE","last_online":"2021-07-18T01:25:18Z","last_updated":"2021-07-19T00:41:12Z","commission_date":"2021-07-13T00:00:00Z","warranty":{"type":"Standard","expiry_date":"2026-07-13T00:00:00Z"},"values":{"current":10.8,"voltage":58.2,"percentage":90}},{"serial":"GV3022G010","status":"OFFLINE","last_online":"2021-07-18T01:25:18Z","last_updated":"2021-07-19T00:41:12Z","commission_date":"2021-07-13T00:00:00Z","warranty":{"type":"Standard","expiry_date":"2026-07-13T00:00:00Z"},"values":{"current":9.8,"voltage":55,"percentage":85}}]

class BatteryListResponseModel {
  BatteryListResponseModel({
    List<Data>? data,
  }) {
    _data = data;
  }

  BatteryListResponseModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  List<Data>? _data;

  BatteryListResponseModel copyWith({
    List<Data>? data,
  }) =>
      BatteryListResponseModel(
        data: data ?? _data,
      );

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// serial : "GV3022G001"
/// status : "ONLINE"
/// last_online : "2021-07-18T01:25:18Z"
/// last_updated : "2021-07-19T00:41:12Z"
/// commission_date : "2021-07-13T00:00:00Z"
/// warranty : {"type":"Standard","expiry_date":"2026-07-13T00:00:00Z"}
/// values : {"current":10.8,"voltage":59.2,"percentage":90}

class Data {
  Data({
    String? serial,
    String? status,
    String? lastOnline,
    String? lastUpdated,
    String? commissionDate,
    Warranty? warranty,
    Values? values,
  }) {
    _serial = serial;
    _status = status;
    _lastOnline = lastOnline;
    _lastUpdated = lastUpdated;
    _commissionDate = commissionDate;
    _warranty = warranty;
    _values = values;
  }

  Data.fromJson(dynamic json) {
    _serial = json['serial'];
    _status = json['status'];
    _lastOnline = json['last_online'];
    _lastUpdated = json['last_updated'];
    _commissionDate = json['commission_date'];
    _warranty =
        json['warranty'] != null ? Warranty.fromJson(json['warranty']) : null;
    _values = json['values'] != null ? Values.fromJson(json['values']) : null;
  }

  String? _serial;
  String? _status;
  String? _lastOnline;
  String? _lastUpdated;
  String? _commissionDate;
  Warranty? _warranty;
  Values? _values;

  Data copyWith({
    String? serial,
    String? status,
    String? lastOnline,
    String? lastUpdated,
    String? commissionDate,
    Warranty? warranty,
    Values? values,
  }) =>
      Data(
        serial: serial ?? _serial,
        status: status ?? _status,
        lastOnline: lastOnline ?? _lastOnline,
        lastUpdated: lastUpdated ?? _lastUpdated,
        commissionDate: commissionDate ?? _commissionDate,
        warranty: warranty ?? _warranty,
        values: values ?? _values,
      );

  String? get serial => _serial;

  String? get status => _status;

  String? get lastOnline => _lastOnline;

  String? get lastUpdated => _lastUpdated;

  String? get commissionDate => _commissionDate;

  Warranty? get warranty => _warranty;

  Values? get values => _values;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serial'] = _serial;
    map['status'] = _status;
    map['last_online'] = _lastOnline;
    map['last_updated'] = _lastUpdated;
    map['commission_date'] = _commissionDate;
    if (_warranty != null) {
      map['warranty'] = _warranty?.toJson();
    }
    if (_values != null) {
      map['values'] = _values?.toJson();
    }
    return map;
  }
}

/// current : 10.8
/// voltage : 59.2
/// percentage : 90

class Values {
  Values({
    num? current,
    num? voltage,
    num? percentage,
  }) {
    _current = current;
    _voltage = voltage;
    _percentage = percentage;
  }

  Values.fromJson(dynamic json) {
    _current = json['current'];
    _voltage = json['voltage'];
    _percentage = json['percentage'];
  }

  num? _current;
  num? _voltage;
  num? _percentage;

  Values copyWith({
    num? current,
    num? voltage,
    num? percentage,
  }) =>
      Values(
        current: current ?? _current,
        voltage: voltage ?? _voltage,
        percentage: percentage ?? _percentage,
      );

  num? get current => _current;

  num? get voltage => _voltage;

  num? get percentage => _percentage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current'] = _current;
    map['voltage'] = _voltage;
    map['percentage'] = _percentage;
    return map;
  }
}

/// type : "Standard"
/// expiry_date : "2026-07-13T00:00:00Z"

class Warranty {
  Warranty({
    String? type,
    String? expiryDate,
  }) {
    _type = type;
    _expiryDate = expiryDate;
  }

  Warranty.fromJson(dynamic json) {
    _type = json['type'];
    _expiryDate = json['expiry_date'];
  }

  String? _type;
  String? _expiryDate;

  Warranty copyWith({
    String? type,
    String? expiryDate,
  }) =>
      Warranty(
        type: type ?? _type,
        expiryDate: expiryDate ?? _expiryDate,
      );

  String? get type => _type;

  String? get expiryDate => _expiryDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['expiry_date'] = _expiryDate;
    return map;
  }
}
