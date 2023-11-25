// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ht_video_desc_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HtVideoDescBean _$HtVideoDescBeanFromJson(Map<String, dynamic> json) =>
    HtVideoDescBean()
      ..status = json['status']
      ..msg = json['msg'] as String?
      ..data = json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>)
      ..data2 = (json['data_2'] as List<dynamic>?)
          ?.map((e) => Data_2.fromJson(e as Map<String, dynamic>))
          .toList()
      ..data3 = (json['data_3'] as List<dynamic>?)
          ?.map((e) => Data_3.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$HtVideoDescBeanToJson(HtVideoDescBean instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data?.toJson(),
      'data_2': instance.data2?.map((e) => e.toJson()).toList(),
      'data_3': instance.data3?.map((e) => e.toJson()).toList(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data()
  ..id = json['id'] as String?
  ..title = json['title'] as String?
  ..cover = json['cover'] as String?
  ..rate = json['rate'] as String?
  ..pubDate = json['pub_date'] as String?
  ..tags = json['tags'] as String?
  ..description = json['description'] as String?
  ..storyline = json['storyline'] as String?
  ..lang = json['lang'] as String?
  ..country = json['country'] as String?
  ..mType = json['m_type'] as String?
  ..drirector = json['drirector'] as String?
  ..writer = json['writer'] as String?
  ..stars = json['stars'] as String?
  ..views = json['views'] as String?
  ..length = json['length'] as String?
  ..source = json['source'] as String?
  ..sourceLink = json['source_link'] as String?
  ..status = json['status'] as String?
  ..mflxUrl = json['mflx_url'] as String?
  ..quality = json['quality'] as String?
  ..gif = json['gif'] as String?
  ..movie123Params = json['movie_123_params'] == null
      ? null
      : Movie_123_params.fromJson(
          json['movie_123_params'] as Map<String, dynamic>)
  ..m123Params = json['m123_params'] == null
      ? null
      : M123_params.fromJson(json['m123_params'] as Map<String, dynamic>)
  ..v720p = json['v_720p'] as String?
  ..v1080p = json['v_1080p'] as String?
  ..v360p = json['v_360p'] as String?
  ..mflxFast = json['mflx_fast'] as String?
  ..mflxVid = json['mflx_vid'] as String?
  ..ttId = json['tt_id'] as String?
  ..k5 = json['k5'] as String?
  ..cflink = json['cflink'] as String?
  ..hd = json['hd'] == null
      ? null
      : Hd.fromJson(json['hd'] as Map<String, dynamic>)
  ..sd = json['sd'] == null
      ? null
      : Sd.fromJson(json['sd'] as Map<String, dynamic>)
  ..mheader = json['mheader'] == null
      ? null
      : Mheader.fromJson(json['mheader'] as Map<String, dynamic>)
  ..tb = json['tb'] as String?
  ..afdLink = json['afd_link'] as String?
  ..board = json['board'] as String?
  ..boardId1 = json['board_id_1'] as String?
  ..boardId2 = json['board_id_2'] as String?
  ..playLock = json['play_lock'] as String?
  ..lock = json['lock'] as String?
  ..r18 = json['r18'] as String?
  ..like = json['like'] as String?
  ..unlike = json['unlike'] as String?
  ..tbapi = json['tbapi'] as String?
  ..apiUrl = json['api_url'] as String?
  ..crwdsrc = json['crwdsrc'] == null
      ? null
      : Crwdsrc.fromJson(json['crwdsrc'] as Map<String, dynamic>)
  ..subSrc = json['sub_src'] == null
      ? null
      : Sub_src.fromJson(json['sub_src'] as Map<String, dynamic>)
  ..rq = json['rq'] as String?
  ..mflxRq = json['mflx_rq'] as String?
  ..logout = json['logout'] as int?
  ..ua = json['ua'] as String?
  ..end = json['end'] as String?
  ..end1 = json['end1'] as String?
  ..mType2 = json['m_type_2'] as String?
  ..ssEps = json['ss_eps'] as String?
  ..order = json['order'] as int?
  ..update = json['update'] as String?;

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
      'rate': instance.rate,
      'pub_date': instance.pubDate,
      'tags': instance.tags,
      'description': instance.description,
      'storyline': instance.storyline,
      'lang': instance.lang,
      'country': instance.country,
      'm_type': instance.mType,
      'drirector': instance.drirector,
      'writer': instance.writer,
      'stars': instance.stars,
      'views': instance.views,
      'length': instance.length,
      'source': instance.source,
      'source_link': instance.sourceLink,
      'status': instance.status,
      'mflx_url': instance.mflxUrl,
      'quality': instance.quality,
      'gif': instance.gif,
      'movie_123_params': instance.movie123Params?.toJson(),
      'm123_params': instance.m123Params?.toJson(),
      'v_720p': instance.v720p,
      'v_1080p': instance.v1080p,
      'v_360p': instance.v360p,
      'mflx_fast': instance.mflxFast,
      'mflx_vid': instance.mflxVid,
      'tt_id': instance.ttId,
      'k5': instance.k5,
      'cflink': instance.cflink,
      'hd': instance.hd?.toJson(),
      'sd': instance.sd?.toJson(),
      'mheader': instance.mheader?.toJson(),
      'tb': instance.tb,
      'afd_link': instance.afdLink,
      'board': instance.board,
      'board_id_1': instance.boardId1,
      'board_id_2': instance.boardId2,
      'play_lock': instance.playLock,
      'lock': instance.lock,
      'r18': instance.r18,
      'like': instance.like,
      'unlike': instance.unlike,
      'tbapi': instance.tbapi,
      'api_url': instance.apiUrl,
      'crwdsrc': instance.crwdsrc?.toJson(),
      'sub_src': instance.subSrc?.toJson(),
      'rq': instance.rq,
      'mflx_rq': instance.mflxRq,
      'logout': instance.logout,
      'ua': instance.ua,
      'end': instance.end,
      'end1': instance.end1,
      'm_type_2': instance.mType2,
      'ss_eps': instance.ssEps,
      'order': instance.order,
      'update': instance.update,
    };

Movie_123_params _$Movie_123_paramsFromJson(Map<String, dynamic> json) =>
    Movie_123_params()
      ..postid = json['postid'] as String?
      ..episode = json['episode'] as String?
      ..server = json['server'] as String?
      ..action = json['action'] as String?
      ..nonce = json['nonce'] as String?
      ..episodei = json['episodei'] as String?;

Map<String, dynamic> _$Movie_123_paramsToJson(Movie_123_params instance) =>
    <String, dynamic>{
      'postid': instance.postid,
      'episode': instance.episode,
      'server': instance.server,
      'action': instance.action,
      'nonce': instance.nonce,
      'episodei': instance.episodei,
    };

M123_params _$M123_paramsFromJson(Map<String, dynamic> json) => M123_params()
  ..postid = json['postid'] as String?
  ..episode = json['episode'] as String?
  ..server = json['server'] as String?
  ..action = json['action'] as String?
  ..nonce = json['nonce'] as String?
  ..episodei = json['episodei'] as String?;

Map<String, dynamic> _$M123_paramsToJson(M123_params instance) =>
    <String, dynamic>{
      'postid': instance.postid,
      'episode': instance.episode,
      'server': instance.server,
      'action': instance.action,
      'nonce': instance.nonce,
      'episodei': instance.episodei,
    };

Hd _$HdFromJson(Map<String, dynamic> json) => Hd()
  ..link = json['link'] as String?
  ..size = json['size'] as String?;

Map<String, dynamic> _$HdToJson(Hd instance) => <String, dynamic>{
      'link': instance.link,
      'size': instance.size,
    };

Sd _$SdFromJson(Map<String, dynamic> json) => Sd()
  ..link = json['link'] as String?
  ..size = json['size'] as String?;

Map<String, dynamic> _$SdToJson(Sd instance) => <String, dynamic>{
      'link': instance.link,
      'size': instance.size,
    };

Mheader _$MheaderFromJson(Map<String, dynamic> json) => Mheader();

Map<String, dynamic> _$MheaderToJson(Mheader instance) => <String, dynamic>{};

Crwdsrc _$CrwdsrcFromJson(Map<String, dynamic> json) => Crwdsrc();

Map<String, dynamic> _$CrwdsrcToJson(Crwdsrc instance) => <String, dynamic>{};

Sub_src _$Sub_srcFromJson(Map<String, dynamic> json) => Sub_src();

Map<String, dynamic> _$Sub_srcToJson(Sub_src instance) => <String, dynamic>{};

Data_2 _$Data_2FromJson(Map<String, dynamic> json) => Data_2()
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
  ..seeall = json['seeall']
  ..seeallValue = json['seeall_value'] as String?
  ..openMode = json['open_mode'] as String?
  ..openModeValue = json['open_mode_value'] as String?
  ..order = json['order'] as int?;

Map<String, dynamic> _$Data_2ToJson(Data_2 instance) => <String, dynamic>{
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
  ..seeall = json['seeall']
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
