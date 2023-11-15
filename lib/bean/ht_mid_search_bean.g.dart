// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ht_mid_search_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ht_mid_search_bean _$ht_mid_search_beanFromJson(Map<String, dynamic> json) =>
    ht_mid_search_bean()
      ..status = json['status'] as String?
      ..msg = json['msg'] as String?
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ht_mid_search_beanToJson(ht_mid_search_bean instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data()
  ..mtype = json['mtype'] as String?
  ..order = json['order'] as int?
  ..cover = json['cover'] as String?
  ..id = json['id'] as String?
  ..title = json['title'] as String?;

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'mtype': instance.mtype,
      'order': instance.order,
      'cover': instance.cover,
      'id': instance.id,
      'title': instance.title,
    };
