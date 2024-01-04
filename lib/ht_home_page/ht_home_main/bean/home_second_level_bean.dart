import 'package:json_annotation/json_annotation.dart'; 
      
part 'home_second_level_bean.g.dart';
    
@JsonSerializable(explicitToJson: true)
class HomeSecondLevelBean{

  @JsonKey(name: 'order')
  int? order;

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'rate')
  String? rate;

  String getRate() {
    if (rate == null || rate?.isEmpty == true) {
      return '';
    } else {
      try {
        return double.parse(rate!).toStringAsFixed(1);
      } catch (e) {
        return '';
      }
    }
  }

  @JsonKey(name: 'stars')
  String? stars;

  @JsonKey(name: 'views')
  String? views;

  @JsonKey(name: 'pub_date')
  String? pubDate;

  @JsonKey(name: 'tags')
  String? tags;

  @JsonKey(name: 'm_type')
  String? mType;

  @JsonKey(name: 'm_type_2')
  String? mType2;

  @JsonKey(name: 'quality')
  String? quality;

  @JsonKey(name: 'gif')
  String? gif;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'c_cnts')
  String? cCnts;

  HomeSecondLevelBean();

  static HomeSecondLevelBean fromJson(Map<String, dynamic> srcJson) => _$HomeSecondLevelBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeSecondLevelBeanToJson(this);

}

  
