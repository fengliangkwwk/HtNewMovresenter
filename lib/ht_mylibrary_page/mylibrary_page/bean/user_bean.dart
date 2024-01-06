import 'package:json_annotation/json_annotation.dart';

part 'user_bean.g.dart';

@JsonSerializable(explicitToJson: true)
class UserBean {
  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'user_name')
  String? userName;

  @JsonKey(name: 'user_face')
  String? userFace;

  @JsonKey(name: 'user_gender')
  int? userGender;

  @JsonKey(name: 'uid')
  String? uid;

  @JsonKey(name: 'app_id')
  String? appid;

  @JsonKey(name: 'fid')
  String? fid;

  @JsonKey(name: 'master')
  String? master;

  @JsonKey(name: 'val')
  String? val;

  @JsonKey(name: 'pid')
  String? pid;

  @JsonKey(name: 'fav_plid')
  String? favplid;
  
  @JsonKey(name: 's1')
  String? s1;

  @JsonKey(name: 'user_birth')
  String? userBirth;

  @JsonKey(name: 'user_issync2')
  int? userIssync2;

  @JsonKey(name: 'msync')
  int? msync;
  
  ///当前登录账号是否是主账号
  bool isPrimaryAccount() {
    if (master == '1') {
      return true;
    }
    return false;
  }

  UserBean();

  static UserBean fromJson(Map<String, dynamic> srcJson) =>
      _$UserBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserBeanToJson(this);
}
