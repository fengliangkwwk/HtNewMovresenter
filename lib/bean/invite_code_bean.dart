import 'package:json_annotation/json_annotation.dart'; 
      
part 'invite_code_bean.g.dart';
    
@JsonSerializable(explicitToJson: true)
class InviteCodeBean{

  @JsonKey(name: 'resolution')
  String? resolution;

  @JsonKey(name: 'type')
  String? type;

  InviteCodeBean();

  static InviteCodeBean fromJson(Map<String, dynamic> srcJson) => _$InviteCodeBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$InviteCodeBeanToJson(this);

}

  
