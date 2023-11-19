// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homedropping_water_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomedroppingWaterBean _$HomedroppingWaterBeanFromJson(
        Map<String, dynamic> json) =>
    HomedroppingWaterBean()
      ..id = json['id'] as String?
      ..rate = json['rate'] as String?
      ..title = json['title'] as String?
      ..cover = json['cover'] as String?
      ..epsCnts = json['eps_cnts'] as String?
      ..order = json['order'] as int?
      ..mType2 = json['m_type_2'] as String?
      ..ssEps = json['ss_eps'] as String?
      ..newFlag = json['new_flag'] as String?
      ..nwFlag = json['nw_flag'] as String?
      ..tags = json['tags'] as String?
      ..board = json['board'] as String?
      ..boardId1 = json['board_id_1'] as String?
      ..boardId2 = json['board_id_2'] as String?;

Map<String, dynamic> _$HomedroppingWaterBeanToJson(
        HomedroppingWaterBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'title': instance.title,
      'cover': instance.cover,
      'eps_cnts': instance.epsCnts,
      'order': instance.order,
      'm_type_2': instance.mType2,
      'ss_eps': instance.ssEps,
      'new_flag': instance.newFlag,
      'nw_flag': instance.nwFlag,
      'tags': instance.tags,
      'board': instance.board,
      'board_id_1': instance.boardId1,
      'board_id_2': instance.boardId2,
    };
