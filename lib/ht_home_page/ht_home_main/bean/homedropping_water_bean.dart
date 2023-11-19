import 'package:json_annotation/json_annotation.dart'; 
      
part 'homedropping_water_bean.g.dart';
    
@JsonSerializable(explicitToJson: true)
class HomedroppingWaterBean{

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'rate')
  String? rate;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'eps_cnts')
  String? epsCnts;

  @JsonKey(name: 'order')
  int? order;

  @JsonKey(name: 'm_type_2')
  String? mType2;

  @JsonKey(name: 'ss_eps')
  String? ssEps;

  @JsonKey(name: 'new_flag')
  String? newFlag;

  @JsonKey(name: 'nw_flag')
  String? nwFlag;

  @JsonKey(name: 'tags')
  String? tags;

  @JsonKey(name: 'board')
  String? board;

  @JsonKey(name: 'board_id_1')
  String? boardId1;

  @JsonKey(name: 'board_id_2')
  String? boardId2;

  HomedroppingWaterBean();

  static HomedroppingWaterBean fromJson(Map<String, dynamic> srcJson) => _$HomedroppingWaterBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomedroppingWaterBeanToJson(this);

}

  
