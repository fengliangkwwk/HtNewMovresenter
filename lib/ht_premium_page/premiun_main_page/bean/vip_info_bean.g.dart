// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vip_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VipInfoBean _$VipInfoBeanFromJson(Map<String, dynamic> json) => VipInfoBean()
  ..local = json['local'] == null
      ? null
      : Local.fromJson(json['local'] as Map<String, dynamic>)
  ..server = json['server'] == null
      ? null
      : Server.fromJson(json['server'] as Map<String, dynamic>)
  ..family = json['family'] == null
      ? null
      : Family.fromJson(json['family'] as Map<String, dynamic>)
  ..device = json['device'] == null
      ? null
      : Device.fromJson(json['device'] as Map<String, dynamic>);

Map<String, dynamic> _$VipInfoBeanToJson(VipInfoBean instance) =>
    <String, dynamic>{
      'local': instance.local?.toJson(),
      'server': instance.server?.toJson(),
      'family': instance.family?.toJson(),
      'device': instance.device?.toJson(),
    };

Local _$LocalFromJson(Map<String, dynamic> json) => Local()
  ..k5 = json['k5'] as String?
  ..value = json['value'] as int?
  ..k6 = json['k6']
  ..k7 = json['k7']
  ..appleServerStatus = json['apple_server_status'] as int?
  ..isTrialPeriod = json['is_trial_period'] as int?
  ..isInIntroOfferPeriod = json['is_in_intro_offer_period'] as int?
  ..autoRenewStatus = json['auto_renew_status'] as int?
  ..tbu = json['tbu'] as String?;

Map<String, dynamic> _$LocalToJson(Local instance) => <String, dynamic>{
      'k5': instance.k5,
      'value': instance.value,
      'k6': instance.k6,
      'k7': instance.k7,
      'apple_server_status': instance.appleServerStatus,
      'is_trial_period': instance.isTrialPeriod,
      'is_in_intro_offer_period': instance.isInIntroOfferPeriod,
      'auto_renew_status': instance.autoRenewStatus,
      'tbu': instance.tbu,
    };

Server _$ServerFromJson(Map<String, dynamic> json) => Server()
  ..val2 = json['val2'] as String?
  ..appOs = json['app_os'] as String?
  ..shelf = json['shelf'] as String?
  ..mail = json['mail'] as String?
  ..appId = json['app_id'] as String?
  ..appName = json['app_name'] as String?
  ..ubt = json['ubt'] as bool?
  ..k5 = json['k5'] as String?
  ..k6 = json['k6'] as String?
  ..k7 = json['k7'] as String?
  ..isTrialPeriod = json['is_trial_period'] as String?
  ..isInIntroOfferPeriod = json['is_in_intro_offer_period'] as String?
  ..logout = json['logout'] as int?
  ..pid = json['pid'] as String?
  ..autoRenewStatus = json['auto_renew_status'] as String?
  ..t1 = json['t1'] as String?;

Map<String, dynamic> _$ServerToJson(Server instance) => <String, dynamic>{
      'val2': instance.val2,
      'app_os': instance.appOs,
      'shelf': instance.shelf,
      'mail': instance.mail,
      'app_id': instance.appId,
      'app_name': instance.appName,
      'ubt': instance.ubt,
      'k5': instance.k5,
      'k6': instance.k6,
      'k7': instance.k7,
      'is_trial_period': instance.isTrialPeriod,
      'is_in_intro_offer_period': instance.isInIntroOfferPeriod,
      'logout': instance.logout,
      'pid': instance.pid,
      'auto_renew_status': instance.autoRenewStatus,
      't1': instance.t1,
    };

Family _$FamilyFromJson(Map<String, dynamic> json) => Family()
  ..k5 = json['k5'] as String?
  ..k6 = json['k6'] as String?
  ..k7 = json['k7'] as String?
  ..isTrialPeriod = json['is_trial_period'] as String?
  ..isInIntroOfferPeriod = json['is_in_intro_offer_period'] as String?
  ..master = json['master']
  ..val = json['val'] as String?
  ..fid = json['fid'] as String?
  ..pid = json['pid'] as String?
  ..autoRenewStatus = json['auto_renew_status'] as String?;

Map<String, dynamic> _$FamilyToJson(Family instance) => <String, dynamic>{
      'k5': instance.k5,
      'k6': instance.k6,
      'k7': instance.k7,
      'is_trial_period': instance.isTrialPeriod,
      'is_in_intro_offer_period': instance.isInIntroOfferPeriod,
      'master': instance.master,
      'val': instance.val,
      'fid': instance.fid,
      'pid': instance.pid,
      'auto_renew_status': instance.autoRenewStatus,
    };

Device _$DeviceFromJson(Map<String, dynamic> json) => Device()
  ..val = json['val'] as String?
  ..pid = json['pid'] as String?
  ..k6 = json['k6'] as String?
  ..k7 = json['k7'] as String?
  ..f1 = json['f1'] as String?;

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'val': instance.val,
      'pid': instance.pid,
      'k6': instance.k6,
      'k7': instance.k7,
      'f1': instance.f1,
    };
