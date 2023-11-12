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
      'user_birth': instance.userBirth,
      'user_issync2': instance.userIssync2,
      'msync': instance.msync,
    };
