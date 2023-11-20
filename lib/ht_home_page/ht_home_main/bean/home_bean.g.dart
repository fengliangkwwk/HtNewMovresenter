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
  ..dataType = json['data_type'] as String?
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
      'display_type': instance.displayType,
      'secname': instance.secname,
      'data_type': instance.dataType,
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
