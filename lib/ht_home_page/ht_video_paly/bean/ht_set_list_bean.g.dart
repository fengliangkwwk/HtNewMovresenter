// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ht_set_list_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HtSetListBean _$HtSetListBeanFromJson(Map<String, dynamic> json) =>
    HtSetListBean()
      ..epsList = (json['eps_list'] as List<dynamic>?)
          ?.map((e) => Eps_list.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$HtSetListBeanToJson(HtSetListBean instance) =>
    <String, dynamic>{
      'eps_list': instance.epsList?.map((e) => e.toJson()).toList(),
    };

Eps_list _$Eps_listFromJson(Map<String, dynamic> json) => Eps_list()
  ..id = json['id'] as int?
  ..title = json['title'] as String?
  ..epsNum = json['eps_num'] as int?;

Map<String, dynamic> _$Eps_listToJson(Eps_list instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'eps_num': instance.epsNum,
    };
