import 'package:json_annotation/json_annotation.dart'; 
      
part 'ht_season_and_episode_bean.g.dart';
    
@JsonSerializable(explicitToJson: true)
class HtSeasonAndEpisodeBean{

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

  @JsonKey(name: 'data_4')
  List<Data_4>? data4;

  HtSeasonAndEpisodeBean();

  static HtSeasonAndEpisodeBean fromJson(Map<String, dynamic> srcJson) => _$HtSeasonAndEpisodeBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HtSeasonAndEpisodeBeanToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Data{

  @JsonKey(name: 'logout')
  int? logout;

  @JsonKey(name: 'ua')
  String? ua;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'rate')
  String? rate;

  @JsonKey(name: 'pub_date')
  String? pubDate;

  @JsonKey(name: 'tags')
  String? tags;

  @JsonKey(name: 'country')
  String? country;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'source')
  String? source;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'next_epsdate')
  String? nextEpsdate;

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'casts')
  List<Casts>? casts;

  @JsonKey(name: 'ssn_list')
  List<Ssn_list>? ssnList;

  @JsonKey(name: 'board')
  String? board;

  @JsonKey(name: 'board_id_1')
  String? boardId1;

  @JsonKey(name: 'board_id_2')
  String? boardId2;

  @JsonKey(name: 'like')
  String? like;

  @JsonKey(name: 'unlike')
  String? unlike;

  @JsonKey(name: 'play_lock')
  String? playLock;

  @JsonKey(name: 'play_lock_t')
  String? playLockT;

  @JsonKey(name: 'r18')
  String? r18;

  Data();

  static Data fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Casts{

  @JsonKey(name: 'star_name')
  String? starName;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'id')
  int? id;

  Casts();

  static Casts fromJson(Map<String, dynamic> srcJson) => _$CastsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CastsToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Ssn_list{

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'title')
  String? title;

  Ssn_list();

  static Ssn_list fromJson(Map<String, dynamic> srcJson) => _$Ssn_listFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Ssn_listToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Data_2{

  @JsonKey(name: 'data')
  List<Data>? data;

  Data_2();

  static Data_2 fromJson(Map<String, dynamic> srcJson) => _$Data_2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Data_2ToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Data{

  @JsonKey(name: 'm_type_2')
  String? mType2;

  @JsonKey(name: 'ss_eps')
  String? ssEps;

  @JsonKey(name: 'board')
  String? board;

  @JsonKey(name: 'board_id_1')
  String? boardId1;

  @JsonKey(name: 'board_id_2')
  String? boardId2;

  @JsonKey(name: 'm_type')
  String? mType;

  @JsonKey(name: 'views')
  String? views;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'rate')
  String? rate;

  @JsonKey(name: 'stars')
  String? stars;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'pub_date')
  String? pubDate;

  @JsonKey(name: 'tags')
  String? tags;

  @JsonKey(name: 'order')
  int? order;

  @JsonKey(name: 'quality')
  String? quality;

  @JsonKey(name: 'update')
  String? update;

  Data();

  static Data fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

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

  
@JsonSerializable(explicitToJson: true)
class Data{

  @JsonKey(name: 'm_type_2')
  String? mType2;

  @JsonKey(name: 'ss_eps')
  String? ssEps;

  @JsonKey(name: 'board')
  String? board;

  @JsonKey(name: 'board_id_1')
  String? boardId1;

  @JsonKey(name: 'board_id_2')
  String? boardId2;

  @JsonKey(name: 'm_type')
  String? mType;

  @JsonKey(name: 'views')
  String? views;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'rate')
  String? rate;

  @JsonKey(name: 'stars')
  String? stars;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'pub_date')
  String? pubDate;

  @JsonKey(name: 'tags')
  String? tags;

  @JsonKey(name: 'order')
  int? order;

  @JsonKey(name: 'quality')
  String? quality;

  @JsonKey(name: 'update')
  String? update;

  Data();

  static Data fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Data_4{

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

  Data_4();

  static Data_4 fromJson(Map<String, dynamic> srcJson) => _$Data_4FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Data_4ToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Data{

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'stars')
  String? stars;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'rate')
  String? rate;

  @JsonKey(name: 'pub_date')
  String? pubDate;

  @JsonKey(name: 'tags')
  String? tags;

  @JsonKey(name: 'm_type')
  String? mType;

  @JsonKey(name: 'm_type_2')
  String? mType2;

  @JsonKey(name: 'order')
  int? order;

  @JsonKey(name: 'new_flag')
  String? newFlag;

  @JsonKey(name: 'nw_flag')
  String? nwFlag;

  @JsonKey(name: 'ss_eps')
  String? ssEps;

  @JsonKey(name: 'update')
  String? update;

  @JsonKey(name: 'c_cnts')
  String? cCnts;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'gif')
  String? gif;

  Data();

  static Data fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
