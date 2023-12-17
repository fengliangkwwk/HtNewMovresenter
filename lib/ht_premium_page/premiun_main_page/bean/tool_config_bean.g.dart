// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_config_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToolConfigBean _$ToolConfigBeanFromJson(Map<String, dynamic> json) =>
    ToolConfigBean()
      ..interScreenAdSecs = json['inter_screen_ad_secs'] as int?
      ..bannerAdSecs = json['banner_ad_secs'] as int?
      ..mbannerSecs = json['mbanner_secs'] as int?
      ..m1 = json['m1'] as int?
      ..adPlaySec = json['ad_play_sec'] as int?
      ..lineSwSec = json['line_sw_sec'] as int?
      ..playLockTlimit = json['play_lock_tlimit'] as int?
      ..assetsJs = json['assets_js'] as String?
      ..vforeg = json['vforeg'] as String?
      ..initjs = json['initjs'] as String?
      ..xcdregular = json['xcdregular'] as String?
      ..urlEncodedFmtStreamMap = json['url_encoded_fmt_stream_map'] as String?
      ..adaptiveFmts = json['adaptive_fmts'] as String?
      ..assets = json['assets'] as String?
      ..eventlabs = json['eventlabs'] as List<dynamic>?
      ..xmlreg1 = json['xmlreg1'] as String?
      ..xmlreg2 = json['xmlreg2'] as String?
      ..xmlreg3 = json['xmlreg3'] as String?
      ..funcreg = json['funcreg'] as String?
      ..regionreg = json['regionreg'] as String?
      ..stsreg = json['stsreg'] as String?
      ..ytregular = json['ytregular'] as String?
      ..whaleRegular = (json['whale_regular'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList()
      ..reg = (json['reg'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList()
      ..xcdregularList = (json['xcdregular_list'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..xcdregularList273 = (json['xcdregular_list_273'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..xcdregularList276 = (json['xcdregular_list_276'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..psregulars = (json['psregulars'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..xcdAvailble = json['xcd_availble'] as int?
      ..htyAvailble = json['hty_availble'] as int?
      ..nodeYtVersion = json['node_yt_version'] as String?
      ..nodeYtAvailble = json['node_yt_availble'] as int?
      ..nodeYtLink = json['node_yt_link'] as String?
      ..jsregular = json['jsregular'] as String?
      ..vdieoInfoUrl = json['vdieo_info_url'] as String?
      ..brandAd = json['brand_ad'] as int?
      ..hjeAd = json['hje_ad'] as int?
      ..cmobiAd = json['cmobi_ad'] as int?
      ..mreward = json['mreward'] as int?
      ..adPlatform = json['ad_platform'] as int?
      ..vipStatus = json['vip_status'] as int?
      ..headLink = json['head_link'] == null
          ? null
          : Head_link.fromJson(json['head_link'] as Map<String, dynamic>)
      ..ytbFilter = json['ytb_filter'] as String?
      ..yfilter = json['yfilter'] as String?
      ..ytbFilterConf = json['ytb_filter_conf'] == null
          ? null
          : Ytb_filter_conf.fromJson(
              json['ytb_filter_conf'] as Map<String, dynamic>)
      ..yfilterConf = json['yfilter_conf'] == null
          ? null
          : Yfilter_conf.fromJson(json['yfilter_conf'] as Map<String, dynamic>)
      ..playlistReg = json['playlist_reg'] == null
          ? null
          : Playlist_reg.fromJson(json['playlist_reg'] as Map<String, dynamic>)
      ..androidReg = (json['android_reg'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..iosHeader = json['ios_header'] == null
          ? null
          : Ios_header.fromJson(json['ios_header'] as Map<String, dynamic>)
      ..applovin = json['applovin'] == null
          ? null
          : Applovin.fromJson(json['applovin'] as Map<String, dynamic>)
      ..tradplus = json['tradplus'] == null
          ? null
          : Tradplus.fromJson(json['tradplus'] as Map<String, dynamic>)
      ..mheader = json['mheader'] == null
          ? null
          : Mheader.fromJson(json['mheader'] as Map<String, dynamic>)
      ..myd = (json['myd'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..imyd = json['imyd'] == null
          ? null
          : Imyd.fromJson(json['imyd'] as Map<String, dynamic>)
      ..cmdbtn = json['cmdbtn'] as int?
      ..k1 = json['k1'] as int?
      ..k2 = (json['k2'] as List<dynamic>?)?.map((e) => e as int).toList()
      ..k3 = (json['k3'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..k4 = json['k4'] as int?
      ..k10 = json['k10'] as int?
      ..k11 = json['k11'] as String?
      ..pushGuide = json['push_guide'] as int?
      ..c1 = json['c1'] as String?
      ..family = json['family'] as int?
      ..k5 = json['k5'] as String?
      ..k6 = (json['k6'] as List<dynamic>?)?.map((e) => e as int).toList()
      ..k7 = json['k7'] as int?
      ..k8 = json['k8'] as String?
      ..k9 = json['k9'] as String?
      ..tel = json['tel'] as String?
      ..tel1 =
          (json['tel1'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..preload =
          (json['preload'] as List<dynamic>?)?.map((e) => e as int).toList()
      ..i1 = (json['i1'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..i2 = (json['i2'] as List<dynamic>?)
          ?.map((e) => I2.fromJson(e as Map<String, dynamic>))
          .toList()
      ..i3 = (json['i3'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..l2 = json['l2'] == null
          ? null
          : L2.fromJson(json['l2'] as Map<String, dynamic>)
      ..airplay = json['airplay'] == null
          ? null
          : Airplay.fromJson(json['airplay'] as Map<String, dynamic>)
      ..k12 = json['k12'] as String?
      ..s1 = json['s1'] as List<dynamic>?
      ..k13 = json['k13'] as String?
      ..k14 = json['k14'] as String?
      ..c2 = (json['c2'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..c3 = (json['c3'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..l3 = json['l3'] as int?
      ..l4 = (json['l4'] as List<dynamic>?)?.map((e) => e as int).toList()
      ..k15 = json['k15'] as String?
      ..k16 = json['k16'] as String?
      ..k17 = json['k17'] as String?
      ..c4 = (json['c4'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$ToolConfigBeanToJson(ToolConfigBean instance) =>
    <String, dynamic>{
      'inter_screen_ad_secs': instance.interScreenAdSecs,
      'banner_ad_secs': instance.bannerAdSecs,
      'mbanner_secs': instance.mbannerSecs,
      'm1': instance.m1,
      'ad_play_sec': instance.adPlaySec,
      'line_sw_sec': instance.lineSwSec,
      'play_lock_tlimit': instance.playLockTlimit,
      'assets_js': instance.assetsJs,
      'vforeg': instance.vforeg,
      'initjs': instance.initjs,
      'xcdregular': instance.xcdregular,
      'url_encoded_fmt_stream_map': instance.urlEncodedFmtStreamMap,
      'adaptive_fmts': instance.adaptiveFmts,
      'assets': instance.assets,
      'eventlabs': instance.eventlabs,
      'xmlreg1': instance.xmlreg1,
      'xmlreg2': instance.xmlreg2,
      'xmlreg3': instance.xmlreg3,
      'funcreg': instance.funcreg,
      'regionreg': instance.regionreg,
      'stsreg': instance.stsreg,
      'ytregular': instance.ytregular,
      'whale_regular': instance.whaleRegular,
      'reg': instance.reg,
      'xcdregular_list': instance.xcdregularList,
      'xcdregular_list_273': instance.xcdregularList273,
      'xcdregular_list_276': instance.xcdregularList276,
      'psregulars': instance.psregulars,
      'xcd_availble': instance.xcdAvailble,
      'hty_availble': instance.htyAvailble,
      'node_yt_version': instance.nodeYtVersion,
      'node_yt_availble': instance.nodeYtAvailble,
      'node_yt_link': instance.nodeYtLink,
      'jsregular': instance.jsregular,
      'vdieo_info_url': instance.vdieoInfoUrl,
      'brand_ad': instance.brandAd,
      'hje_ad': instance.hjeAd,
      'cmobi_ad': instance.cmobiAd,
      'mreward': instance.mreward,
      'ad_platform': instance.adPlatform,
      'vip_status': instance.vipStatus,
      'head_link': instance.headLink?.toJson(),
      'ytb_filter': instance.ytbFilter,
      'yfilter': instance.yfilter,
      'ytb_filter_conf': instance.ytbFilterConf?.toJson(),
      'yfilter_conf': instance.yfilterConf?.toJson(),
      'playlist_reg': instance.playlistReg?.toJson(),
      'android_reg': instance.androidReg,
      'ios_header': instance.iosHeader?.toJson(),
      'applovin': instance.applovin?.toJson(),
      'tradplus': instance.tradplus?.toJson(),
      'mheader': instance.mheader?.toJson(),
      'myd': instance.myd,
      'imyd': instance.imyd?.toJson(),
      'cmdbtn': instance.cmdbtn,
      'k1': instance.k1,
      'k2': instance.k2,
      'k3': instance.k3,
      'k4': instance.k4,
      'k10': instance.k10,
      'k11': instance.k11,
      'push_guide': instance.pushGuide,
      'c1': instance.c1,
      'family': instance.family,
      'k5': instance.k5,
      'k6': instance.k6,
      'k7': instance.k7,
      'k8': instance.k8,
      'k9': instance.k9,
      'tel': instance.tel,
      'tel1': instance.tel1,
      'preload': instance.preload,
      'i1': instance.i1,
      'i2': instance.i2?.map((e) => e.toJson()).toList(),
      'i3': instance.i3,
      'l2': instance.l2?.toJson(),
      'airplay': instance.airplay?.toJson(),
      'k12': instance.k12,
      's1': instance.s1,
      'k13': instance.k13,
      'k14': instance.k14,
      'c2': instance.c2,
      'c3': instance.c3,
      'l3': instance.l3,
      'l4': instance.l4,
      'k15': instance.k15,
      'k16': instance.k16,
      'k17': instance.k17,
      'c4': instance.c4,
    };

Head_link _$Head_linkFromJson(Map<String, dynamic> json) => Head_link()
  ..link1 = json['link_1'] as String?
  ..link2 = json['link_2'] as String?
  ..link3 = json['link_3'] as String?;

Map<String, dynamic> _$Head_linkToJson(Head_link instance) => <String, dynamic>{
      'link_1': instance.link1,
      'link_2': instance.link2,
      'link_3': instance.link3,
    };

Ytb_filter_conf _$Ytb_filter_confFromJson(Map<String, dynamic> json) =>
    Ytb_filter_conf()
      ..minute4 = json['minute_4'] as String?
      ..minute20 = json['minute_20'] as String?
      ..day1 = json['day_1'] as String?
      ..day7 = json['day_7'] as String?
      ..day30 = json['day_30'] as String?
      ..typeVideo = json['type_video'] as String?
      ..typePlaylist = json['type_playlist'] as String?
      ..typeChannel = json['type_channel'] as String?
      ..minute4Day1 = json['minute_4_day_1'] as String?
      ..minute4Day7 = json['minute_4_day_7'] as String?
      ..minute4Day30 = json['minute_4_day_30'] as String?
      ..minute20Day1 = json['minute_20_day_1'] as String?
      ..minute20Day7 = json['minute_20_day_7'] as String?
      ..minute20Day30 = json['minute_20_day_30'] as String?;

Map<String, dynamic> _$Ytb_filter_confToJson(Ytb_filter_conf instance) =>
    <String, dynamic>{
      'minute_4': instance.minute4,
      'minute_20': instance.minute20,
      'day_1': instance.day1,
      'day_7': instance.day7,
      'day_30': instance.day30,
      'type_video': instance.typeVideo,
      'type_playlist': instance.typePlaylist,
      'type_channel': instance.typeChannel,
      'minute_4_day_1': instance.minute4Day1,
      'minute_4_day_7': instance.minute4Day7,
      'minute_4_day_30': instance.minute4Day30,
      'minute_20_day_1': instance.minute20Day1,
      'minute_20_day_7': instance.minute20Day7,
      'minute_20_day_30': instance.minute20Day30,
    };

Yfilter_conf _$Yfilter_confFromJson(Map<String, dynamic> json) => Yfilter_conf()
  ..minute4 = json['minute_4'] as String?
  ..minute20 = json['minute_20'] as String?
  ..day1 = json['day_1'] as String?
  ..day7 = json['day_7'] as String?
  ..day30 = json['day_30'] as String?
  ..typeVideo = json['type_video'] as String?
  ..typePlaylist = json['type_playlist'] as String?
  ..typeChannel = json['type_channel'] as String?
  ..minute4Day1 = json['minute_4_day_1'] as String?
  ..minute4Day7 = json['minute_4_day_7'] as String?
  ..minute4Day30 = json['minute_4_day_30'] as String?
  ..minute20Day1 = json['minute_20_day_1'] as String?
  ..minute20Day7 = json['minute_20_day_7'] as String?
  ..minute20Day30 = json['minute_20_day_30'] as String?;

Map<String, dynamic> _$Yfilter_confToJson(Yfilter_conf instance) =>
    <String, dynamic>{
      'minute_4': instance.minute4,
      'minute_20': instance.minute20,
      'day_1': instance.day1,
      'day_7': instance.day7,
      'day_30': instance.day30,
      'type_video': instance.typeVideo,
      'type_playlist': instance.typePlaylist,
      'type_channel': instance.typeChannel,
      'minute_4_day_1': instance.minute4Day1,
      'minute_4_day_7': instance.minute4Day7,
      'minute_4_day_30': instance.minute4Day30,
      'minute_20_day_1': instance.minute20Day1,
      'minute_20_day_7': instance.minute20Day7,
      'minute_20_day_30': instance.minute20Day30,
    };

Playlist_reg _$Playlist_regFromJson(Map<String, dynamic> json) => Playlist_reg()
  ..listIdReg = json['list_id_reg'] as String?
  ..songTitleYtb = json['song_title_ytb'] as String?
  ..songYtbTitle = json['song_ytb_title'] as String?
  ..trendingReg = json['trending_reg'] as String?
  ..youtubeMix = json['youtube_mix'] as String?
  ..youtubeMixSimple = json['youtube_mix_simple'] as String?
  ..youtubeMixTitle = json['youtube_mix_title'] as String?
  ..youtubeAlbumTitle = json['youtube_album_title'] as String?
  ..playlistInitData = json['playlist_init_data'] as String?
  ..ytmusicInitData = json['ytmusic_init_data'] as String?;

Map<String, dynamic> _$Playlist_regToJson(Playlist_reg instance) =>
    <String, dynamic>{
      'list_id_reg': instance.listIdReg,
      'song_title_ytb': instance.songTitleYtb,
      'song_ytb_title': instance.songYtbTitle,
      'trending_reg': instance.trendingReg,
      'youtube_mix': instance.youtubeMix,
      'youtube_mix_simple': instance.youtubeMixSimple,
      'youtube_mix_title': instance.youtubeMixTitle,
      'youtube_album_title': instance.youtubeAlbumTitle,
      'playlist_init_data': instance.playlistInitData,
      'ytmusic_init_data': instance.ytmusicInitData,
    };

Ios_header _$Ios_headerFromJson(Map<String, dynamic> json) =>
    Ios_header()..userAgent = json['User-Agent'] as String?;

Map<String, dynamic> _$Ios_headerToJson(Ios_header instance) =>
    <String, dynamic>{
      'User-Agent': instance.userAgent,
    };

Applovin _$ApplovinFromJson(Map<String, dynamic> json) => Applovin()
  ..account = json['account'] as String?
  ..start = json['start'] as String?
  ..inter = json['inter'] as String?
  ..reward = json['reward'] as String?
  ..mrec = json['mrec'] as String?
  ..banner = json['banner'] as String?;

Map<String, dynamic> _$ApplovinToJson(Applovin instance) => <String, dynamic>{
      'account': instance.account,
      'start': instance.start,
      'inter': instance.inter,
      'reward': instance.reward,
      'mrec': instance.mrec,
      'banner': instance.banner,
    };

Tradplus _$TradplusFromJson(Map<String, dynamic> json) => Tradplus();

Map<String, dynamic> _$TradplusToJson(Tradplus instance) => <String, dynamic>{};

Mheader _$MheaderFromJson(Map<String, dynamic> json) =>
    Mheader()..xRequestedWith = json['x-requested-with'] as String?;

Map<String, dynamic> _$MheaderToJson(Mheader instance) => <String, dynamic>{
      'x-requested-with': instance.xRequestedWith,
    };

Imyd _$ImydFromJson(Map<String, dynamic> json) => Imyd()
  ..w3 = json['w3'] as String?
  ..msc = json['msc'] as String?
  ..newData = json['new'] as String?
  ..charts = json['charts'] as String?
  ..genres = json['genres'] as String?;

Map<String, dynamic> _$ImydToJson(Imyd instance) => <String, dynamic>{
      'w3': instance.w3,
      'msc': instance.msc,
      'new': instance.newData,
      'charts': instance.charts,
      'genres': instance.genres,
    };

I2 _$I2FromJson(Map<String, dynamic> json) => I2()
  ..id = json['id'] as String?
  ..link = json['link'] as String?;

Map<String, dynamic> _$I2ToJson(I2 instance) => <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
    };

L2 _$L2FromJson(Map<String, dynamic> json) => L2()
  ..cnt = json['cnt'] as String?
  ..link = json['link'] as String?;

Map<String, dynamic> _$L2ToJson(L2 instance) => <String, dynamic>{
      'cnt': instance.cnt,
      'link': instance.link,
    };

Airplay _$AirplayFromJson(Map<String, dynamic> json) => Airplay()
  ..scheme = json['scheme'] as String?
  ..bundleid = json['bundleid'] as String?
  ..appleid = json['appleid'] as String?
  ..name = json['name'] as String?
  ..l1 = json['l1'] as String?
  ..l2 = json['l2'] as String?
  ..c1 = json['c1'] as String?
  ..c2 = json['c2'] as String?
  ..c3 = json['c3'] as String?
  ..c4 = json['c4'] as String?
  ..c5 = json['c5'] as String?
  ..k2 = json['k2'] as int?
  ..logo = json['logo'] as String?;

Map<String, dynamic> _$AirplayToJson(Airplay instance) => <String, dynamic>{
      'scheme': instance.scheme,
      'bundleid': instance.bundleid,
      'appleid': instance.appleid,
      'name': instance.name,
      'l1': instance.l1,
      'l2': instance.l2,
      'c1': instance.c1,
      'c2': instance.c2,
      'c3': instance.c3,
      'c4': instance.c4,
      'c5': instance.c5,
      'k2': instance.k2,
      'logo': instance.logo,
    };
