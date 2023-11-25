import 'package:json_annotation/json_annotation.dart'; 
      
part 'ht_set_list_bean.g.dart';
    
@JsonSerializable(explicitToJson: true)
class HtSetListBean{

  @JsonKey(name: 'eps_list')
  List<Eps_list>? epsList;

  HtSetListBean();

  static HtSetListBean fromJson(Map<String, dynamic> srcJson) => _$HtSetListBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HtSetListBeanToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Eps_list{

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'eps_num')
  int? epsNum;

  Eps_list();

  static Eps_list fromJson(Map<String, dynamic> srcJson) => _$Eps_listFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Eps_listToJson(this);

}

  
