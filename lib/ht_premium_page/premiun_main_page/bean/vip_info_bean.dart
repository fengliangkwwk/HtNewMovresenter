import 'package:json_annotation/json_annotation.dart'; 
      
part 'vip_info_bean.g.dart';
    
@JsonSerializable(explicitToJson: true)
class VipInfoBean{

  @JsonKey(name: 'local')
  Local? local;

  @JsonKey(name: 'server')
  Server? server;

  @JsonKey(name: 'family')
  Family? family;

  @JsonKey(name: 'device')
  Device? device;

  VipInfoBean();

  static VipInfoBean fromJson(Map<String, dynamic> srcJson) => _$VipInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VipInfoBeanToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Local{

  @JsonKey(name: 'k5')
  String? k5;

  @JsonKey(name: 'value')
  dynamic value;

  @JsonKey(name: 'k6')
  dynamic k6;

  @JsonKey(name: 'k7')
  dynamic k7;

  @JsonKey(name: 'apple_server_status')
  int? appleServerStatus;

  @JsonKey(name: 'is_trial_period')
  dynamic isTrialPeriod;

  @JsonKey(name: 'is_in_intro_offer_period')
  dynamic isInIntroOfferPeriod;

  @JsonKey(name: 'auto_renew_status')
  dynamic autoRenewStatus;

  @JsonKey(name: 'tbu')
  String? tbu;

  Local();

  static Local fromJson(Map<String, dynamic> srcJson) => _$LocalFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LocalToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Server{

  @JsonKey(name: 'val2')
  String? val2;

  @JsonKey(name: 'app_os')
  String? appOs;

  @JsonKey(name: 'shelf')
  String? shelf;

  @JsonKey(name: 'mail')
  String? mail;

  @JsonKey(name: 'app_id')
  String? appId;

  @JsonKey(name: 'app_name')
  String? appName;

  @JsonKey(name: 'ubt')
  bool? ubt;

  @JsonKey(name: 'k5')
  String? k5;

  @JsonKey(name: 'k6')
  String? k6;

  @JsonKey(name: 'k7')
  String? k7;

  @JsonKey(name: 'is_trial_period')
  String? isTrialPeriod;

  @JsonKey(name: 'is_in_intro_offer_period')
  String? isInIntroOfferPeriod;

  @JsonKey(name: 'logout')
  int? logout;

  @JsonKey(name: 'pid')
  String? pid;

  @JsonKey(name: 'auto_renew_status')
  String? autoRenewStatus;

  @JsonKey(name: 't1')
  String? t1;

  Server();

  static Server fromJson(Map<String, dynamic> srcJson) => _$ServerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ServerToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Family{

  @JsonKey(name: 'k5')
  String? k5;

  @JsonKey(name: 'k6')
  String? k6;

  @JsonKey(name: 'k7')
  String? k7;

  @JsonKey(name: 'is_trial_period')
  String? isTrialPeriod;

  @JsonKey(name: 'is_in_intro_offer_period')
  String? isInIntroOfferPeriod;

  @JsonKey(name: 'master')
  dynamic master;

  @JsonKey(name: 'val')
  String? val;

  @JsonKey(name: 'fid')
  String? fid;

  @JsonKey(name: 'pid')
  String? pid;

  @JsonKey(name: 'auto_renew_status')
  String? autoRenewStatus;

  Family();

  static Family fromJson(Map<String, dynamic> srcJson) => _$FamilyFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FamilyToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Device{

  @JsonKey(name: 'val')
  String? val;

  @JsonKey(name: 'pid')
  String? pid;

  @JsonKey(name: 'k6')
  String? k6;

  @JsonKey(name: 'k7')
  String? k7;

  @JsonKey(name: 'f1')
  String? f1;

  Device();

  static Device fromJson(Map<String, dynamic> srcJson) => _$DeviceFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);

}

  
