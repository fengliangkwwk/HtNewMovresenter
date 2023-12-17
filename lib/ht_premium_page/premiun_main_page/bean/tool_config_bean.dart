import 'package:json_annotation/json_annotation.dart'; 
      
part 'tool_config_bean.g.dart';
    
@JsonSerializable(explicitToJson: true)
class ToolConfigBean{

  @JsonKey(name: 'inter_screen_ad_secs')
  int? interScreenAdSecs;

  @JsonKey(name: 'banner_ad_secs')
  int? bannerAdSecs;

  @JsonKey(name: 'mbanner_secs')
  int? mbannerSecs;

  @JsonKey(name: 'm1')
  int? m1;

  @JsonKey(name: 'ad_play_sec')
  int? adPlaySec;

  @JsonKey(name: 'line_sw_sec')
  int? lineSwSec;

  @JsonKey(name: 'play_lock_tlimit')
  int? playLockTlimit;

  @JsonKey(name: 'assets_js')
  String? assetsJs;

  @JsonKey(name: 'vforeg')
  String? vforeg;

  @JsonKey(name: 'initjs')
  String? initjs;

  @JsonKey(name: 'xcdregular')
  String? xcdregular;

  @JsonKey(name: 'url_encoded_fmt_stream_map')
  String? urlEncodedFmtStreamMap;

  @JsonKey(name: 'adaptive_fmts')
  String? adaptiveFmts;

  @JsonKey(name: 'assets')
  String? assets;

  @JsonKey(name: 'eventlabs')
  List<dynamic>? eventlabs;

  @JsonKey(name: 'xmlreg1')
  String? xmlreg1;

  @JsonKey(name: 'xmlreg2')
  String? xmlreg2;

  @JsonKey(name: 'xmlreg3')
  String? xmlreg3;

  @JsonKey(name: 'funcreg')
  String? funcreg;

  @JsonKey(name: 'regionreg')
  String? regionreg;

  @JsonKey(name: 'stsreg')
  String? stsreg;

  @JsonKey(name: 'ytregular')
  String? ytregular;

  @JsonKey(name: 'whale_regular')
  List<List<String>>? whaleRegular;

  @JsonKey(name: 'reg')
  List<List<String>>? reg;

  @JsonKey(name: 'xcdregular_list')
  List<String>? xcdregularList;

  @JsonKey(name: 'xcdregular_list_273')
  List<String>? xcdregularList273;

  @JsonKey(name: 'xcdregular_list_276')
  List<String>? xcdregularList276;

  @JsonKey(name: 'psregulars')
  List<String>? psregulars;

  @JsonKey(name: 'xcd_availble')
  int? xcdAvailble;

  @JsonKey(name: 'hty_availble')
  int? htyAvailble;

  @JsonKey(name: 'node_yt_version')
  String? nodeYtVersion;

  @JsonKey(name: 'node_yt_availble')
  int? nodeYtAvailble;

  @JsonKey(name: 'node_yt_link')
  String? nodeYtLink;

  @JsonKey(name: 'jsregular')
  String? jsregular;

  @JsonKey(name: 'vdieo_info_url')
  String? vdieoInfoUrl;

  @JsonKey(name: 'brand_ad')
  int? brandAd;

  @JsonKey(name: 'hje_ad')
  int? hjeAd;

  @JsonKey(name: 'cmobi_ad')
  int? cmobiAd;

  @JsonKey(name: 'mreward')
  int? mreward;

  @JsonKey(name: 'ad_platform')
  int? adPlatform;

  @JsonKey(name: 'vip_status')
  int? vipStatus;

  @JsonKey(name: 'head_link')
  Head_link? headLink;

  @JsonKey(name: 'ytb_filter')
  String? ytbFilter;

  @JsonKey(name: 'yfilter')
  String? yfilter;

  @JsonKey(name: 'ytb_filter_conf')
  Ytb_filter_conf? ytbFilterConf;

  @JsonKey(name: 'yfilter_conf')
  Yfilter_conf? yfilterConf;

  @JsonKey(name: 'playlist_reg')
  Playlist_reg? playlistReg;

  @JsonKey(name: 'android_reg')
  List<String>? androidReg;

  @JsonKey(name: 'ios_header')
  Ios_header? iosHeader;

  @JsonKey(name: 'applovin')
  Applovin? applovin;

  @JsonKey(name: 'tradplus')
  Tradplus? tradplus;

  @JsonKey(name: 'mheader')
  Mheader? mheader;

  @JsonKey(name: 'myd')
  List<String>? myd;

  @JsonKey(name: 'imyd')
  Imyd? imyd;

  @JsonKey(name: 'cmdbtn')
  int? cmdbtn;

  @JsonKey(name: 'k1')
  int? k1;

  @JsonKey(name: 'k2')
  List<int>? k2;

  @JsonKey(name: 'k3')
  List<String>? k3;

  @JsonKey(name: 'k4')
  int? k4;

  @JsonKey(name: 'k10')
  int? k10;

  @JsonKey(name: 'k11')
  String? k11;

  @JsonKey(name: 'push_guide')
  int? pushGuide;

  @JsonKey(name: 'c1')
  String? c1;

  @JsonKey(name: 'family')
  int? family;

  @JsonKey(name: 'k5')
  String? k5;

  @JsonKey(name: 'k6')
  List<int>? k6;

  @JsonKey(name: 'k7')
  int? k7;

  @JsonKey(name: 'k8')
  String? k8;

  @JsonKey(name: 'k9')
  String? k9;

  @JsonKey(name: 'tel')
  String? tel;

  @JsonKey(name: 'tel1')
  List<String>? tel1;

  @JsonKey(name: 'preload')
  List<int>? preload;

  @JsonKey(name: 'i1')
  List<String>? i1;

  @JsonKey(name: 'i2')
  List<I2>? i2;

  @JsonKey(name: 'i3')
  List<String>? i3;

  @JsonKey(name: 'l2')
  L2? l2;

  @JsonKey(name: 'airplay')
  Airplay? airplay;

  @JsonKey(name: 'k12')
  String? k12;

  @JsonKey(name: 's1')
  List<dynamic>? s1;

  @JsonKey(name: 'k13')
  String? k13;

  @JsonKey(name: 'k14')
  String? k14;

  @JsonKey(name: 'c2')
  List<String>? c2;

  @JsonKey(name: 'c3')
  List<String>? c3;

  @JsonKey(name: 'l3')
  int? l3;

  @JsonKey(name: 'l4')
  List<int>? l4;

  @JsonKey(name: 'k15')
  String? k15;

  @JsonKey(name: 'k16')
  String? k16;

  @JsonKey(name: 'k17')
  String? k17;

  @JsonKey(name: 'c4')
  List<String>? c4;

  ToolConfigBean();

  factory ToolConfigBean.fromJson(Map<String, dynamic> srcJson) => _$ToolConfigBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ToolConfigBeanToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Head_link{

  @JsonKey(name: 'link_1')
  String? link1;

  @JsonKey(name: 'link_2')
  String? link2;

  @JsonKey(name: 'link_3')
  String? link3;

  Head_link();

  factory Head_link.fromJson(Map<String, dynamic> srcJson) => _$Head_linkFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Head_linkToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Ytb_filter_conf{

  @JsonKey(name: 'minute_4')
  String? minute4;

  @JsonKey(name: 'minute_20')
  String? minute20;

  @JsonKey(name: 'day_1')
  String? day1;

  @JsonKey(name: 'day_7')
  String? day7;

  @JsonKey(name: 'day_30')
  String? day30;

  @JsonKey(name: 'type_video')
  String? typeVideo;

  @JsonKey(name: 'type_playlist')
  String? typePlaylist;

  @JsonKey(name: 'type_channel')
  String? typeChannel;

  @JsonKey(name: 'minute_4_day_1')
  String? minute4Day1;

  @JsonKey(name: 'minute_4_day_7')
  String? minute4Day7;

  @JsonKey(name: 'minute_4_day_30')
  String? minute4Day30;

  @JsonKey(name: 'minute_20_day_1')
  String? minute20Day1;

  @JsonKey(name: 'minute_20_day_7')
  String? minute20Day7;

  @JsonKey(name: 'minute_20_day_30')
  String? minute20Day30;

  Ytb_filter_conf();

  factory Ytb_filter_conf.fromJson(Map<String, dynamic> srcJson) => _$Ytb_filter_confFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Ytb_filter_confToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Yfilter_conf{

  @JsonKey(name: 'minute_4')
  String? minute4;

  @JsonKey(name: 'minute_20')
  String? minute20;

  @JsonKey(name: 'day_1')
  String? day1;

  @JsonKey(name: 'day_7')
  String? day7;

  @JsonKey(name: 'day_30')
  String? day30;

  @JsonKey(name: 'type_video')
  String? typeVideo;

  @JsonKey(name: 'type_playlist')
  String? typePlaylist;

  @JsonKey(name: 'type_channel')
  String? typeChannel;

  @JsonKey(name: 'minute_4_day_1')
  String? minute4Day1;

  @JsonKey(name: 'minute_4_day_7')
  String? minute4Day7;

  @JsonKey(name: 'minute_4_day_30')
  String? minute4Day30;

  @JsonKey(name: 'minute_20_day_1')
  String? minute20Day1;

  @JsonKey(name: 'minute_20_day_7')
  String? minute20Day7;

  @JsonKey(name: 'minute_20_day_30')
  String? minute20Day30;

  Yfilter_conf();

  factory Yfilter_conf.fromJson(Map<String, dynamic> srcJson) => _$Yfilter_confFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Yfilter_confToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Playlist_reg{

  @JsonKey(name: 'list_id_reg')
  String? listIdReg;

  @JsonKey(name: 'song_title_ytb')
  String? songTitleYtb;

  @JsonKey(name: 'song_ytb_title')
  String? songYtbTitle;

  @JsonKey(name: 'trending_reg')
  String? trendingReg;

  @JsonKey(name: 'youtube_mix')
  String? youtubeMix;

  @JsonKey(name: 'youtube_mix_simple')
  String? youtubeMixSimple;

  @JsonKey(name: 'youtube_mix_title')
  String? youtubeMixTitle;

  @JsonKey(name: 'youtube_album_title')
  String? youtubeAlbumTitle;

  @JsonKey(name: 'playlist_init_data')
  String? playlistInitData;

  @JsonKey(name: 'ytmusic_init_data')
  String? ytmusicInitData;

  Playlist_reg();

  factory Playlist_reg.fromJson(Map<String, dynamic> srcJson) => _$Playlist_regFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Playlist_regToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Ios_header{

  @JsonKey(name: 'User-Agent')
  String? userAgent;

  Ios_header();

  factory Ios_header.fromJson(Map<String, dynamic> srcJson) => _$Ios_headerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Ios_headerToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Applovin{

  @JsonKey(name: 'account')
  String? account;

  @JsonKey(name: 'start')
  String? start;

  @JsonKey(name: 'inter')
  String? inter;

  @JsonKey(name: 'reward')
  String? reward;

  @JsonKey(name: 'mrec')
  String? mrec;

  @JsonKey(name: 'banner')
  String? banner;

  Applovin();

  factory Applovin.fromJson(Map<String, dynamic> srcJson) => _$ApplovinFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ApplovinToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Tradplus{

  Tradplus();

  factory Tradplus.fromJson(Map<String, dynamic> srcJson) => _$TradplusFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TradplusToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Mheader{

  @JsonKey(name: 'x-requested-with')
  String? xRequestedWith;

  Mheader();

  factory Mheader.fromJson(Map<String, dynamic> srcJson) => _$MheaderFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MheaderToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Imyd{

  @JsonKey(name: 'w3')
  String? w3;

  @JsonKey(name: 'msc')
  String? msc;

  @JsonKey(name: 'new')
  String? newData;

  @JsonKey(name: 'charts')
  String? charts;

  @JsonKey(name: 'genres')
  String? genres;

  Imyd();

  factory Imyd.fromJson(Map<String, dynamic> srcJson) => _$ImydFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ImydToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class I2{

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'link')
  String? link;

  I2();

  factory I2.fromJson(Map<String, dynamic> srcJson) => _$I2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$I2ToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class L2{

  @JsonKey(name: 'cnt')
  String? cnt;

  @JsonKey(name: 'link')
  String? link;

  L2();

  factory L2.fromJson(Map<String, dynamic> srcJson) => _$L2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$L2ToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Airplay{

  @JsonKey(name: 'scheme')
  String? scheme;

  @JsonKey(name: 'bundleid')
  String? bundleid;

  @JsonKey(name: 'appleid')
  String? appleid;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'l1')
  String? l1;

  @JsonKey(name: 'l2')
  String? l2;

  @JsonKey(name: 'c1')
  String? c1;

  @JsonKey(name: 'c2')
  String? c2;

  @JsonKey(name: 'c3')
  String? c3;

  @JsonKey(name: 'c4')
  String? c4;

  @JsonKey(name: 'c5')
  String? c5;

  @JsonKey(name: 'k2')
  int? k2;

  @JsonKey(name: 'logo')
  String? logo;

  Airplay();

  factory Airplay.fromJson(Map<String, dynamic> srcJson) => _$AirplayFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AirplayToJson(this);

}

  
