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
  ..display_type = json['display_type'] as String?
  ..secname = json['secname'] as String?
  ..data_type = json['data_type'] as String?
  ..open_mode_value = json['open_mode_value'] as String?
  ..moreflag = json['moreflag'] as String?
  ..seeall = json['seeall'] as String?
  ..seeall_value = json['seeall_value'] as String?
  ..open_mode = json['open_mode'] as String?
  ..info_type_2 = json['info_type_2'] as String?;

Map<String, dynamic> _$DataListToJson(DataList instance) => <String, dynamic>{
      'name': instance.name,
      'data': instance.itemData?.map((e) => e.toJson()).toList(),
      'order': instance.order,
      'display_type': instance.display_type,
      'secname': instance.secname,
      'data_type': instance.data_type,
      'open_mode_value': instance.open_mode_value,
      'moreflag': instance.moreflag,
      'seeall': instance.seeall,
      'seeall_value': instance.seeall_value,
      'open_mode': instance.open_mode,
      'info_type_2': instance.info_type_2,
    };

ItemData _$ItemDataFromJson(Map<String, dynamic> json) => ItemData()
  ..id = json['id'] as String?
  ..img = json['img'] as String?
  ..playlist_id = json['playlist_id'] as int?
  ..new_img = json['new_img'] as String?
  ..new_conf_type = json['new_conf_type'] as int?
  ..new_conf_value = json['new_conf_value'] as String?
  ..new_conf_name = json['new_conf_name'] as String?
  ..new_conf_artist = json['new_conf_artist'] as String?
  ..new_conf_desc = json['new_conf_desc'] as String?
  ..new_conf_rate = json['new_conf_rate'] as String?
  ..new_conf_duration = json['new_conf_duration'] as String?
  ..new_conf_pub = json['new_conf_pub'] as String?
  ..new_conf_name_2 = json['new_conf_name_2'] as String?
  ..order = json['order'] as int?
  ..ss_tag = json['ss_tag'] as String?
  ..nw_img = json['nw_img'] as String?
  ..nw_conf_type = json['nw_conf_type'] as int?
  ..nw_conf_value = json['nw_conf_value'] as String?
  ..nw_conf_name = json['nw_conf_name'] as String?
  ..nw_conf_artist = json['nw_conf_artist'] as String?
  ..nw_conf_desc = json['nw_conf_desc'] as String?
  ..nw_conf_rate = json['nw_conf_rate'] as String?
  ..nw_conf_duration = json['nw_conf_duration'] as String?
  ..nw_conf_pub = json['nw_conf_pub'] as String?
  ..nw_conf_name_2 = json['nw_conf_name_2'] as String?
  ..cover = json['cover'] as String?
  ..cover2 = json['cover2'] as String?
  ..desc = json['desc'] as String?
  ..browser = json['browser'] as String?
  ..type = json['type'] as String?
  ..status = json['status'] as String?
  ..m20 = (json['m20'] as List<dynamic>?)
      ?.map((e) => M20.fromJson(e as Map<String, dynamic>))
      .toList()
  ..tt20 = (json['tt20'] as List<dynamic>?)
      ?.map((e) => TT20.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ItemDataToJson(ItemData instance) => <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'playlist_id': instance.playlist_id,
      'new_img': instance.new_img,
      'new_conf_type': instance.new_conf_type,
      'new_conf_value': instance.new_conf_value,
      'new_conf_name': instance.new_conf_name,
      'new_conf_artist': instance.new_conf_artist,
      'new_conf_desc': instance.new_conf_desc,
      'new_conf_rate': instance.new_conf_rate,
      'new_conf_duration': instance.new_conf_duration,
      'new_conf_pub': instance.new_conf_pub,
      'new_conf_name_2': instance.new_conf_name_2,
      'order': instance.order,
      'ss_tag': instance.ss_tag,
      'nw_img': instance.nw_img,
      'nw_conf_type': instance.nw_conf_type,
      'nw_conf_value': instance.nw_conf_value,
      'nw_conf_name': instance.nw_conf_name,
      'nw_conf_artist': instance.nw_conf_artist,
      'nw_conf_desc': instance.nw_conf_desc,
      'nw_conf_rate': instance.nw_conf_rate,
      'nw_conf_duration': instance.nw_conf_duration,
      'nw_conf_pub': instance.nw_conf_pub,
      'nw_conf_name_2': instance.nw_conf_name_2,
      'cover': instance.cover,
      'cover2': instance.cover2,
      'desc': instance.desc,
      'browser': instance.browser,
      'type': instance.type,
      'status': instance.status,
      'm20': instance.m20?.map((e) => e.toJson()).toList(),
      'tt20': instance.tt20?.map((e) => e.toJson()).toList(),
    };

M20 _$M20FromJson(Map<String, dynamic> json) => M20()
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

Map<String, dynamic> _$M20ToJson(M20 instance) => <String, dynamic>{
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

TT20 _$TT20FromJson(Map<String, dynamic> json) => TT20()
  ..id = json['id'] as String?
  ..title = json['title'] as String?
  ..stars = json['stars'] as String?
  ..cover = json['cover'] as String?
  ..rate = json['rate'] as String?
  ..pub_date = json['pub_date'] as String?
  ..tags = json['tags'] as String?
  ..m_type = json['m_type'] as String?
  ..m_type_2 = json['m_type_2'] as String?
  ..order = json['order'] as int?
  ..new_flag = json['new_flag'] as String?
  ..nw_flag = json['nw_flag'] as String?
  ..ss_eps = json['ss_eps'] as String?
  ..update = json['update'] as String?
  ..c_cnts = json['c_cnts'] as String?
  ..description = json['description'] as String?
  ..gif = json['gif'] as String?;

Map<String, dynamic> _$TT20ToJson(TT20 instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'stars': instance.stars,
      'cover': instance.cover,
      'rate': instance.rate,
      'pub_date': instance.pub_date,
      'tags': instance.tags,
      'm_type': instance.m_type,
      'm_type_2': instance.m_type_2,
      'order': instance.order,
      'new_flag': instance.new_flag,
      'nw_flag': instance.nw_flag,
      'ss_eps': instance.ss_eps,
      'update': instance.update,
      'c_cnts': instance.c_cnts,
      'description': instance.description,
      'gif': instance.gif,
    };
