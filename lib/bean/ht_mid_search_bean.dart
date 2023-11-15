import 'package:json_annotation/json_annotation.dart'; 
      
part 'ht_mid_search_bean.g.dart';
    
@JsonSerializable(explicitToJson: true)
class ht_mid_search_bean{

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'data')
  List<Data>? data;

  ht_mid_search_bean();

  static ht_mid_search_bean fromJson(Map<String, dynamic> srcJson) => _$ht_mid_search_beanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ht_mid_search_beanToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Data{

  @JsonKey(name: 'mtype')
  String? mtype;

  @JsonKey(name: 'order')
  int? order;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'title')
  String? title;

  Data();

  static Data fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
