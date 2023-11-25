// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ht_season_and_episode_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HtSeasonAndEpisodeBean _$HtSeasonAndEpisodeBeanFromJson(
        Map<String, dynamic> json) =>
    HtSeasonAndEpisodeBean()
      ..status = json['status'] as int?
      ..msg = json['msg'] as String?
      ..data = json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>)
      ..data2 = (json['data_2'] as List<dynamic>?)
          ?.map((e) => Data_2.fromJson(e as Map<String, dynamic>))
          .toList()
      ..data3 = (json['data_3'] as List<dynamic>?)
          ?.map((e) => Data_3.fromJson(e as Map<String, dynamic>))
          .toList()
      ..data4 = (json['data_4'] as List<dynamic>?)
          ?.map((e) => Data_4.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$HtSeasonAndEpisodeBeanToJson(
        HtSeasonAndEpisodeBean instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data?.toJson(),
      'data_2': instance.data2?.map((e) => e.toJson()).toList(),
      'data_3': instance.data3?.map((e) => e.toJson()).toList(),
      'data_4': instance.data4?.map((e) => e.toJson()).toList(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data()
  ..logout = json['logout'] as int?
  ..ua = json['ua'] as String?
  ..title = json['title'] as String?
  ..rate = json['rate'] as String?
  ..pubDate = json['pub_date'] as String?
  ..tags = json['tags'] as String?
  ..country = json['country'] as String?
  ..description = json['description'] as String?
  ..source = json['source'] as String?
  ..cover = json['cover'] as String?
  ..nextEpsdate = json['next_epsdate'] as String?
  ..id = json['id'] as String?
  ..casts = (json['casts'] as List<dynamic>?)
      ?.map((e) => Casts.fromJson(e as Map<String, dynamic>))
      .toList()
  ..ssnList = (json['ssn_list'] as List<dynamic>?)
      ?.map((e) => Ssn_list.fromJson(e as Map<String, dynamic>))
      .toList()
  ..board = json['board'] as String?
  ..boardId1 = json['board_id_1'] as String?
  ..boardId2 = json['board_id_2'] as String?
  ..like = json['like'] as String?
  ..unlike = json['unlike'] as String?
  ..playLock = json['play_lock'] as String?
  ..playLockT = json['play_lock_t'] as String?
  ..r18 = json['r18'] as String?
  ..stars = json['stars'] as String?
  ..mType = json['m_type'] as String?
  ..mType2 = json['m_type_2'] as String?
  ..order = json['order'] as int?
  ..newFlag = json['new_flag'] as String?
  ..nwFlag = json['nw_flag'] as String?
  ..ssEps = json['ss_eps'] as String?
  ..update = json['update'] as String?
  ..cCnts = json['c_cnts'] as String?
  ..gif = json['gif'] as String?
  ..views = json['views'] as String?
  ..quality = json['quality'] as String?;

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'logout': instance.logout,
      'ua': instance.ua,
      'title': instance.title,
      'rate': instance.rate,
      'pub_date': instance.pubDate,
      'tags': instance.tags,
      'country': instance.country,
      'description': instance.description,
      'source': instance.source,
      'cover': instance.cover,
      'next_epsdate': instance.nextEpsdate,
      'id': instance.id,
      'casts': instance.casts?.map((e) => e.toJson()).toList(),
      'ssn_list': instance.ssnList?.map((e) => e.toJson()).toList(),
      'board': instance.board,
      'board_id_1': instance.boardId1,
      'board_id_2': instance.boardId2,
      'like': instance.like,
      'unlike': instance.unlike,
      'play_lock': instance.playLock,
      'play_lock_t': instance.playLockT,
      'r18': instance.r18,
      'stars': instance.stars,
      'm_type': instance.mType,
      'm_type_2': instance.mType2,
      'order': instance.order,
      'new_flag': instance.newFlag,
      'nw_flag': instance.nwFlag,
      'ss_eps': instance.ssEps,
      'update': instance.update,
      'c_cnts': instance.cCnts,
      'gif': instance.gif,
      'views': instance.views,
      'quality': instance.quality,
    };

Casts _$CastsFromJson(Map<String, dynamic> json) => Casts()
  ..starName = json['star_name'] as String?
  ..cover = json['cover'] as String?
  ..id = json['id'] as int?;

Map<String, dynamic> _$CastsToJson(Casts instance) => <String, dynamic>{
      'star_name': instance.starName,
      'cover': instance.cover,
      'id': instance.id,
    };

Ssn_list _$Ssn_listFromJson(Map<String, dynamic> json) => Ssn_list()
  ..id = json['id'] as int?
  ..title = json['title'] as String?;

Map<String, dynamic> _$Ssn_listToJson(Ssn_list instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

Data_2 _$Data_2FromJson(Map<String, dynamic> json) => Data_2()
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$Data_2ToJson(Data_2 instance) => <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

Data_3 _$Data_3FromJson(Map<String, dynamic> json) => Data_3()
  ..infoType = json['info_type'] as String?
  ..infoType2 = json['info_type_2'] as String?
  ..secname = json['secname'] as String?
  ..playlistKey = json['playlist_key'] as String?
  ..moduleKey = json['module_key'] as String?
  ..dataType = json['data_type'] as String?
  ..name = json['name'] as String?
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
      .toList()
  ..displayType = json['display_type'] as String?
  ..seeall = json['seeall'] as String?
  ..seeallValue = json['seeall_value'] as String?
  ..openMode = json['open_mode'] as String?
  ..openModeValue = json['open_mode_value'] as String?
  ..order = json['order'] as int?;

Map<String, dynamic> _$Data_3ToJson(Data_3 instance) => <String, dynamic>{
      'info_type': instance.infoType,
      'info_type_2': instance.infoType2,
      'secname': instance.secname,
      'playlist_key': instance.playlistKey,
      'module_key': instance.moduleKey,
      'data_type': instance.dataType,
      'name': instance.name,
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'display_type': instance.displayType,
      'seeall': instance.seeall,
      'seeall_value': instance.seeallValue,
      'open_mode': instance.openMode,
      'open_mode_value': instance.openModeValue,
      'order': instance.order,
    };

Data_4 _$Data_4FromJson(Map<String, dynamic> json) => Data_4()
  ..infoType = json['info_type'] as String?
  ..infoType2 = json['info_type_2'] as String?
  ..secname = json['secname'] as String?
  ..playlistKey = json['playlist_key'] as String?
  ..moduleKey = json['module_key'] as String?
  ..dataType = json['data_type'] as String?
  ..name = json['name'] as String?
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
      .toList()
  ..displayType = json['display_type'] as String?
  ..seeall = json['seeall'] as String?
  ..seeallValue = json['seeall_value'] as String?
  ..openMode = json['open_mode'] as String?
  ..openModeValue = json['open_mode_value'] as String?
  ..order = json['order'] as int?;

Map<String, dynamic> _$Data_4ToJson(Data_4 instance) => <String, dynamic>{
      'info_type': instance.infoType,
      'info_type_2': instance.infoType2,
      'secname': instance.secname,
      'playlist_key': instance.playlistKey,
      'module_key': instance.moduleKey,
      'data_type': instance.dataType,
      'name': instance.name,
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'display_type': instance.displayType,
      'seeall': instance.seeall,
      'seeall_value': instance.seeallValue,
      'open_mode': instance.openMode,
      'open_mode_value': instance.openModeValue,
      'order': instance.order,
    };
