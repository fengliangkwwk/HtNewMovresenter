// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBean _$UserBeanFromJson(Map<String, dynamic> json) => UserBean()
  ..phone = json['phone'] as String?
  ..email = json['email'] as String?
  ..userName = json['user_name'] as String?
  ..userFace = json['user_face'] as String?
  ..userGender = json['user_gender'] as int?
  ..uid = json['uid'] as String?
  ..appid = json['app_id'] as String?
  ..fid = json['fid'] as String?
  ..master = json['master'] as String?
  ..val = json['val'] as String?
  ..pid = json['pid'] as String?
  ..favplid = json['fav_plid'] as String?
  ..s1 = json['s1'] as String?
  ..userBirth = json['user_birth'] as String?
  ..userIssync2 = json['user_issync2'] as int?
  ..msync = json['msync'] as int?;

Map<String, dynamic> _$UserBeanToJson(UserBean instance) => <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'user_name': instance.userName,
      'user_face': instance.userFace,
      'user_gender': instance.userGender,
      'uid': instance.uid,
      'app_id': instance.appid,
      'fid': instance.fid,
      'master': instance.master,
      'val': instance.val,
      'pid': instance.pid,
      'fav_plid': instance.favplid,
      's1': instance.s1,
      'user_birth': instance.userBirth,
      'user_issync2': instance.userIssync2,
      'msync': instance.msync,
    };
