/// status : 200
/// msg : "success"
/// data : {"resolution":"1125x2436","type":"2"}

class InviteCodeBean {
  InviteCodeBean({
      num? status,
      String? msg,
      Data? data,}){
    _status = status;
    _msg = msg;
    _data = data;
}

  InviteCodeBean.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _status;
  String? _msg;
  Data? _data;
InviteCodeBean copyWith({  num? status,
  String? msg,
  Data? data,
}) => InviteCodeBean(  status: status ?? _status,
  msg: msg ?? _msg,
  data: data ?? _data,
);
  num get status => _status!;
  String get msg => _msg!;
  Data get data => _data!;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data!.toJson();
    }
    return map;
  }

}

/// resolution : "1125x2436"
/// type : "2"

class Data {
  Data({
      String? resolution,
      String? type,}){
    _resolution = resolution;
    _type = type;
}
  Data.fromJson(dynamic json) {
    _resolution = json['resolution'];
    _type = json['type'];
  }
  String? _resolution;
  String? _type;
Data copyWith({  String? resolution,
  String? type,
}) => Data(  resolution: resolution ?? _resolution,
  type: type ?? _type,
);
  String get resolution => _resolution!;
  String get type => _type!;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resolution'] = _resolution;
    map['type'] = _type;
    return map;
  }

}