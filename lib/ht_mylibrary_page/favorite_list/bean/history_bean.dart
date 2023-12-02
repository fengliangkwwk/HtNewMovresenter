import 'package:json_annotation/json_annotation.dart';

part 'history_bean.g.dart';

@JsonSerializable(explicitToJson: true)
class HistoryBean {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'rate')
  String? rate;

  @JsonKey(name: 'mType2')
  String? mType2;

  @JsonKey(name: 'ssnId')
  String? ssnId;

  @JsonKey(name: 'epsId')
  String? epsId;

  ///选中状态
  @JsonKey(includeToJson: false)
  bool selectState = false;

  HistoryBean();

  factory HistoryBean.fromJson(Map<String, dynamic> srcJson) =>
      _$HistoryBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HistoryBeanToJson(this);
}
