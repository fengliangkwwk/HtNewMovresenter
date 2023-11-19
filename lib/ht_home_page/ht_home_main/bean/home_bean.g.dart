// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBean _$HomeBeanFromJson(Map<String, dynamic> json) => HomeBean()
  ..list348 = json['348'] as List<dynamic>?
  ..status = json['status'] as int?
  ..msg = json['msg'] as String?
  ..dataList = (json['data'] as List<dynamic>?)
      ?.map((e) => DataList.fromJson(e as Map<String, dynamic>))
      .toList()
  ..region = json['region'] as String?
  ..source = json['source'] as String?
  ..pagecnt = json['pagecnt'] as int?
  ..total = json['total'] as int?
  ..kws = (json['kws'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..shortcut = json['shortcut'] as List<dynamic>?
  ..retract = json['retract'] as String?
  ..regionTag = json['region_tag'] as String?;

Map<String, dynamic> _$HomeBeanToJson(HomeBean instance) => <String, dynamic>{
      '348': instance.list348,
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.dataList?.map((e) => e.toJson()).toList(),
      'region': instance.region,
      'source': instance.source,
      'pagecnt': instance.pagecnt,
      'total': instance.total,
      'kws': instance.kws,
      'shortcut': instance.shortcut,
      'retract': instance.retract,
      'region_tag': instance.regionTag,
    };

DataList _$DataListFromJson(Map<String, dynamic> json) => DataList()
  ..name = json['name'] as String?
  ..itemData = (json['data'] as List<dynamic>?)
      ?.map((e) => ItemData.fromJson(e as Map<String, dynamic>))
      .toList()
  ..order = json['order'] as int?
  ..displayType = json['display_type'] as String?
  ..secname = json['secname'] as String?
  ..dataType = json['data_type'] as String?;

Map<String, dynamic> _$DataListToJson(DataList instance) => <String, dynamic>{
      'name': instance.name,
      'data': instance.itemData?.map((e) => e.toJson()).toList(),
      'order': instance.order,
      'display_type': instance.displayType,
      'secname': instance.secname,
      'data_type': instance.dataType,
    };

ItemData _$ItemDataFromJson(Map<String, dynamic> json) => ItemData()
  ..id = json['id'] as String?
  ..img = json['img'] as String?
  ..playlistId = json['playlist_id'] as int?
  ..newImg = json['new_img'] as String?
  ..newConfType = json['new_conf_type'] as int?
  ..newConfValue = json['new_conf_value'] as String?
  ..newConfName = json['new_conf_name'] as String?
  ..newConfArtist = json['new_conf_artist'] as String?
  ..newConfDesc = json['new_conf_desc'] as String?
  ..newConfRate = json['new_conf_rate'] as String?
  ..newConfDuration = json['new_conf_duration'] as String?
  ..newConfPub = json['new_conf_pub'] as String?
  ..newConfName2 = json['new_conf_name_2'] as String?
  ..order = json['order'] as int?
  ..ssTag = json['ss_tag'] as String?
  ..nwImg = json['nw_img'] as String?
  ..nwConfType = json['nw_conf_type'] as int?
  ..nwConfValue = json['nw_conf_value'] as String?
  ..nwConfName = json['nw_conf_name'] as String?
  ..nwConfArtist = json['nw_conf_artist'] as String?
  ..nwConfDesc = json['nw_conf_desc'] as String?
  ..nwConfRate = json['nw_conf_rate'] as String?
  ..nwConfDuration = json['nw_conf_duration'] as String?
  ..nwConfPub = json['nw_conf_pub'] as String?
  ..nwConfName2 = json['nw_conf_name_2'] as String?
  ..cover = json['cover'] as String?
  ..cover2 = json['cover2'] as String?;

Map<String, dynamic> _$ItemDataToJson(ItemData instance) => <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'playlist_id': instance.playlistId,
      'new_img': instance.newImg,
      'new_conf_type': instance.newConfType,
      'new_conf_value': instance.newConfValue,
      'new_conf_name': instance.newConfName,
      'new_conf_artist': instance.newConfArtist,
      'new_conf_desc': instance.newConfDesc,
      'new_conf_rate': instance.newConfRate,
      'new_conf_duration': instance.newConfDuration,
      'new_conf_pub': instance.newConfPub,
      'new_conf_name_2': instance.newConfName2,
      'order': instance.order,
      'ss_tag': instance.ssTag,
      'nw_img': instance.nwImg,
      'nw_conf_type': instance.nwConfType,
      'nw_conf_value': instance.nwConfValue,
      'nw_conf_name': instance.nwConfName,
      'nw_conf_artist': instance.nwConfArtist,
      'nw_conf_desc': instance.nwConfDesc,
      'nw_conf_rate': instance.nwConfRate,
      'nw_conf_duration': instance.nwConfDuration,
      'nw_conf_pub': instance.nwConfPub,
      'nw_conf_name_2': instance.nwConfName2,
      'cover': instance.cover,
      'cover2': instance.cover2,
    };
