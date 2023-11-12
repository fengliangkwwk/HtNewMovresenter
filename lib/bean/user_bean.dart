import 'package:json_annotation/json_annotation.dart'; 
      
part 'user_bean.g.dart';
    
@JsonSerializable(explicitToJson: true)
class UserBean{

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

  @JsonKey(name: 'user_birth')
  String? userBirth;

  @JsonKey(name: 'user_issync2')
  int? userIssync2;

  @JsonKey(name: 'msync')
  int? msync;

  UserBean();

  static UserBean fromJson(Map<String, dynamic> srcJson) => _$UserBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserBeanToJson(this);

}

  
