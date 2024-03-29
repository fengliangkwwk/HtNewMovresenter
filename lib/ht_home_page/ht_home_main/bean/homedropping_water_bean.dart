// ignore_for_file: non_constant_identifier_names

import 'package:ht_new_movpresenter/utils/tools/ht_sys_tool.dart';
import 'package:json_annotation/json_annotation.dart';

part 'homedropping_water_bean.g.dart';

@JsonSerializable(explicitToJson: true)
class HomedroppingWaterBean {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'rate')
  String? rate;

  String getRate() {
    if (rate == null || rate?.isEmpty == true) {
      return '';
    } else {
      try {
        if (SysTools.hasOneDecimalPlace(rate ?? '')) {
          return rate ?? '';
        }
        return double.parse(rate!).toStringAsFixed(1);
      } catch (e) {
        return '';
      }
    }
  }

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'eps_cnts')
  String? eps_cnts;

  @JsonKey(name: 'order')
  int? order;

  @JsonKey(name: 'm_type_2')
  String? m_type_2;

  @JsonKey(name: 'quality')
  String? quality;

  @JsonKey(name: 'ss_eps')
  String? ss_eps;

  @JsonKey(name: 'new_flag')
  String? new_flag;

  @JsonKey(name: 'nw_flag')
  String? nw_flag;

  @JsonKey(name: 'tags')
  String? tags;

  @JsonKey(name: 'board')
  String? board;

  @JsonKey(name: 'board_id_1')
  String? board_id_1;

  @JsonKey(name: 'board_id_2')
  String? board_id_2;

  HomedroppingWaterBean();

  static HomedroppingWaterBean fromJson(Map<String, dynamic> srcJson) =>
      _$HomedroppingWaterBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomedroppingWaterBeanToJson(this);
}
