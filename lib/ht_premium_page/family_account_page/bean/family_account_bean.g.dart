// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_account_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FamilyAccountBean _$FamilyAccountBeanFromJson(Map<String, dynamic> json) =>
    FamilyAccountBean()
      ..status = json['status'] as int?
      ..msg = json['msg'] as String?
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList()
      ..curCnts = json['cur_cnts'] as int?
      ..remain = json['remain'] as int?;

Map<String, dynamic> _$FamilyAccountBeanToJson(FamilyAccountBean instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'cur_cnts': instance.curCnts,
      'remain': instance.remain,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data()
  ..uid = json['uid'] as int?
  ..name = json['name'] as String?
  ..face = json['face'] as String?
  ..mail = json['mail'] as String?
  ..master = json['master'] as int?
  ..signup = json['signup'] as int?;

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'face': instance.face,
      'mail': instance.mail,
      'master': instance.master,
      'signup': instance.signup,
    };
