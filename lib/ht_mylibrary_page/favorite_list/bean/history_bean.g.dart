// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryBean _$HistoryBeanFromJson(Map<String, dynamic> json) => HistoryBean()
  ..id = json['id'] as String?
  ..title = json['title'] as String?
  ..cover = json['cover'] as String?
  ..rate = json['rate'] as String?
  ..mType2 = json['mType2'] as String?
  ..ssnId = json['ssnId'] as String?
  ..epsId = json['epsId'] as String?
  ..selectState = json['selectState'] as bool;

Map<String, dynamic> _$HistoryBeanToJson(HistoryBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
      'rate': instance.rate,
      'mType2': instance.mType2,
      'ssnId': instance.ssnId,
      'epsId': instance.epsId,
    };
