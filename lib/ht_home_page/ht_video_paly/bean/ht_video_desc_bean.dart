import 'package:json_annotation/json_annotation.dart'; 
      
part 'ht_video_desc_bean.g.dart';
    
@JsonSerializable(explicitToJson: true)
class HtVideoDescBean{

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'data')
  Data? data;

  @JsonKey(name: 'data_2')
  List<Data_2>? data2;

  @JsonKey(name: 'data_3')
  List<Data_3>? data3;

  HtVideoDescBean();

  static HtVideoDescBean fromJson(Map<String, dynamic> srcJson) => _$HtVideoDescBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HtVideoDescBeanToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Data{

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'rate')
  String? rate;

  @JsonKey(name: 'pub_date')
  String? pubDate;

  @JsonKey(name: 'tags')
  String? tags;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'storyline')
  String? storyline;

  @JsonKey(name: 'lang')
  String? lang;

  @JsonKey(name: 'country')
  String? country;

  @JsonKey(name: 'm_type')
  String? mType;

  @JsonKey(name: 'drirector')
  String? drirector;

  @JsonKey(name: 'writer')
  String? writer;

  @JsonKey(name: 'stars')
  String? stars;

  @JsonKey(name: 'views')
  String? views;

  @JsonKey(name: 'length')
  String? length;

  @JsonKey(name: 'source')
  String? source;

  @JsonKey(name: 'source_link')
  String? sourceLink;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'mflx_url')
  String? mflxUrl;

  @JsonKey(name: 'quality')
  String? quality;

  @JsonKey(name: 'gif')
  String? gif;

  @JsonKey(name: 'movie_123_params')
  Movie_123_params? movie123Params;

  @JsonKey(name: 'm123_params')
  M123_params? m123Params;

  @JsonKey(name: 'v_720p')
  String? v720p;

  @JsonKey(name: 'v_1080p')
  String? v1080p;

  @JsonKey(name: 'v_360p')
  String? v360p;

  @JsonKey(name: 'mflx_fast')
  String? mflxFast;

  @JsonKey(name: 'mflx_vid')
  String? mflxVid;

  @JsonKey(name: 'tt_id')
  String? ttId;

  @JsonKey(name: 'k5')
  String? k5;

  @JsonKey(name: 'cflink')
  String? cflink;

  @JsonKey(name: 'hd')
  Hd? hd;

  @JsonKey(name: 'sd')
  Sd? sd;

  @JsonKey(name: 'mheader')
  Mheader? mheader;

  @JsonKey(name: 'tb')
  String? tb;

  @JsonKey(name: 'afd_link')
  String? afdLink;

  @JsonKey(name: 'board')
  String? board;

  @JsonKey(name: 'board_id_1')
  String? boardId1;

  @JsonKey(name: 'board_id_2')
  String? boardId2;

  @JsonKey(name: 'play_lock')
  String? playLock;

  @JsonKey(name: 'lock')
  String? lock;

  @JsonKey(name: 'r18')
  String? r18;

  @JsonKey(name: 'like')
  String? like;

  @JsonKey(name: 'unlike')
  String? unlike;

  @JsonKey(name: 'tbapi')
  String? tbapi;

  @JsonKey(name: 'api_url')
  String? apiUrl;

  @JsonKey(name: 'crwdsrc')
  Crwdsrc? crwdsrc;

  @JsonKey(name: 'sub_src')
  Sub_src? subSrc;

  @JsonKey(name: 'rq')
  String? rq;

  @JsonKey(name: 'mflx_rq')
  String? mflxRq;

  @JsonKey(name: 'logout')
  int? logout;

  @JsonKey(name: 'ua')
  String? ua;

  @JsonKey(name: 'end')
  String? end;

  @JsonKey(name: 'end1')
  String? end1;


  @JsonKey(name: 'm_type_2')
  String? mType2;

  @JsonKey(name: 'ss_eps')
  String? ssEps;


  @JsonKey(name: 'order')
  int? order;

  @JsonKey(name: 'update')
  String? update;

  Data();

  static Data fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Movie_123_params{

  @JsonKey(name: 'postid')
  String? postid;

  @JsonKey(name: 'episode')
  String? episode;

  @JsonKey(name: 'server')
  String? server;

  @JsonKey(name: 'action')
  String? action;

  @JsonKey(name: 'nonce')
  String? nonce;

  @JsonKey(name: 'episodei')
  String? episodei;

  Movie_123_params();

  static Movie_123_params fromJson(Map<String, dynamic> srcJson) => _$Movie_123_paramsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Movie_123_paramsToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class M123_params{

  @JsonKey(name: 'postid')
  String? postid;

  @JsonKey(name: 'episode')
  String? episode;

  @JsonKey(name: 'server')
  String? server;

  @JsonKey(name: 'action')
  String? action;

  @JsonKey(name: 'nonce')
  String? nonce;

  @JsonKey(name: 'episodei')
  String? episodei;

  M123_params();

  static M123_params fromJson(Map<String, dynamic> srcJson) => _$M123_paramsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$M123_paramsToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Hd{

  @JsonKey(name: 'link')
  String? link;

  @JsonKey(name: 'size')
  String? size;

  Hd();

  static Hd fromJson(Map<String, dynamic> srcJson) => _$HdFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HdToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Sd{

  @JsonKey(name: 'link')
  String? link;

  @JsonKey(name: 'size')
  String? size;

  Sd();

  static Sd fromJson(Map<String, dynamic> srcJson) => _$SdFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SdToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Mheader{

  Mheader();

  static Mheader fromJson(Map<String, dynamic> srcJson) => _$MheaderFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MheaderToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Crwdsrc{

  Crwdsrc();

  static Crwdsrc fromJson(Map<String, dynamic> srcJson) => _$CrwdsrcFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CrwdsrcToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Sub_src{

  Sub_src();

  static Sub_src fromJson(Map<String, dynamic> srcJson) => _$Sub_srcFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Sub_srcToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Data_2{

  @JsonKey(name: 'info_type')
  String? infoType;

  @JsonKey(name: 'info_type_2')
  String? infoType2;

  @JsonKey(name: 'secname')
  String? secname;

  @JsonKey(name: 'playlist_key')
  String? playlistKey;

  @JsonKey(name: 'module_key')
  String? moduleKey;

  @JsonKey(name: 'data_type')
  String? dataType;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'data')
  List<Data>? data;

  @JsonKey(name: 'display_type')
  String? displayType;

  @JsonKey(name: 'seeall')
  String? seeall;

  @JsonKey(name: 'seeall_value')
  String? seeallValue;

  @JsonKey(name: 'open_mode')
  String? openMode;

  @JsonKey(name: 'open_mode_value')
  String? openModeValue;

  @JsonKey(name: 'order')
  int? order;

  Data_2();

  static Data_2 fromJson(Map<String, dynamic> srcJson) => _$Data_2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Data_2ToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Data_3{

  @JsonKey(name: 'info_type')
  String? infoType;

  @JsonKey(name: 'info_type_2')
  String? infoType2;

  @JsonKey(name: 'secname')
  String? secname;

  @JsonKey(name: 'playlist_key')
  String? playlistKey;

  @JsonKey(name: 'module_key')
  String? moduleKey;

  @JsonKey(name: 'data_type')
  String? dataType;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'data')
  List<Data>? data;

  @JsonKey(name: 'display_type')
  String? displayType;

  @JsonKey(name: 'seeall')
  String? seeall;

  @JsonKey(name: 'seeall_value')
  String? seeallValue;

  @JsonKey(name: 'open_mode')
  String? openMode;

  @JsonKey(name: 'open_mode_value')
  String? openModeValue;

  @JsonKey(name: 'order')
  int? order;

  Data_3();

  static Data_3 fromJson(Map<String, dynamic> srcJson) => _$Data_3FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Data_3ToJson(this);

}



  
