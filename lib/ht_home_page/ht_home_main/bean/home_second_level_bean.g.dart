// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_second_level_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeSecondLevelBean _$HomeSecondLevelBeanFromJson(Map<String, dynamic> json) =>
    HomeSecondLevelBean()
      ..order = json['order'] as int?
      ..id = json['id'] as String?
      ..title = json['title'] as String?
      ..cover = json['cover'] as String?
      ..rate = json['rate'] as String?
      ..stars = json['stars'] as String?
      ..views = json['views'] as String?
      ..pubDate = json['pub_date'] as String?
      ..tags = json['tags'] as String?
      ..mType = json['m_type'] as String?
      ..mType2 = json['m_type_2'] as String?
      ..quality = json['quality'] as String?
      ..gif = json['gif'] as String?
      ..description = json['description'] as String?
      ..cCnts = json['c_cnts'] as String?;

Map<String, dynamic> _$HomeSecondLevelBeanToJson(
        HomeSecondLevelBean instance) =>
    <String, dynamic>{
      'order': instance.order,
      'id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
      'rate': instance.rate,
      'stars': instance.stars,
      'views': instance.views,
      'pub_date': instance.pubDate,
      'tags': instance.tags,
      'm_type': instance.mType,
      'm_type_2': instance.mType2,
      'quality': instance.quality,
      'gif': instance.gif,
      'description': instance.description,
      'c_cnts': instance.cCnts,
    };
