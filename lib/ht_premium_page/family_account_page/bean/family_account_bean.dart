import 'package:json_annotation/json_annotation.dart'; 
      
part 'family_account_bean.g.dart';
    
@JsonSerializable(explicitToJson: true)
class FamilyAccountBean{

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'data')
  List<Data>? data;

  @JsonKey(name: 'cur_cnts')
  int? curCnts;

  @JsonKey(name: 'remain')
  int? remain;

  FamilyAccountBean();

  static FamilyAccountBean fromJson(Map<String, dynamic> srcJson) => _$FamilyAccountBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FamilyAccountBeanToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Data{

  @JsonKey(name: 'uid')
  int? uid;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'face')
  String? face;

  @JsonKey(name: 'mail')
  String? mail;

  @JsonKey(name: 'master')
  int? master;

  @JsonKey(name: 'signup')
  int? signup;

  Data();

  static Data fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
