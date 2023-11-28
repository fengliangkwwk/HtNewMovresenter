// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ht_share_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HTShareBean _$HTShareBeanFromJson(Map<String, dynamic> json) => HTShareBean()
  ..link = json['link'] as String?
  ..text = json['text'] as String?
  ..songLink = json['song_link'] as String?
  ..songText = json['song_text'] as String?
  ..mtext = json['mtext'] as String?
  ..mlink = json['mlink'] as String?
  ..tttext = json['tttext'] as String?
  ..ttlink = json['ttlink'] as String?
  ..text1 = json['text1'] as String?
  ..mlocklink = json['mlocklink'] as String?
  ..text2 = json['text2'] as String?
  ..ttlocklink = json['ttlocklink'] as String?
  ..appLink = json['app_link'] as String?
  ..appText = json['app_text'] as String?
  ..appmLink = json['appm_link'] as String?
  ..appmText = json['appm_text'] as String?
  ..app7Link = json['app7_link'] as String?
  ..app7Text = json['app7_text'] as String?
  ..appm7Link = json['appm7_link'] as String?
  ..appm7Text = json['appm7_text'] as String?
  ..topicLink = json['topic_link'] as String?
  ..topicText = json['topic_text'] as String?
  ..inviteLink = json['invite_link'] as String?
  ..inviteText = json['invite_text'] as String?
  ..movieLink = json['movie_link'] as String?
  ..movieText = json['movie_text'] as String?
  ..tvLink = json['tv_link'] as String?
  ..tvText = json['tv_text'] as String?
  ..clientIp = json['client_ip'] as String?
  ..cf = json['cf'] as String?
  ..regionTag = json['region_tag'] as String?
  ..load = json['load'] as String?
  ..load1 = json['load1'] as int?
  ..load2 = json['load2'] as String?
  ..c1 = json['c1'] as String?
  ..l1 = json['l1'] as String?
  ..c3 = (json['c3'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..l3 = (json['l3'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..c2 = json['c2'] as String?
  ..gdNstll = json['gd_nstll'] == null
      ? null
      : Gd_nstll.fromJson(json['gd_nstll'] as Map<String, dynamic>)
  ..d1 = json['d1'] == null
      ? null
      : D1.fromJson(json['d1'] as Map<String, dynamic>)
  ..d2 = json['d2'] == null
      ? null
      : D2.fromJson(json['d2'] as Map<String, dynamic>)
  ..d3 = json['d3'] == null
      ? null
      : D3.fromJson(json['d3'] as Map<String, dynamic>)
  ..upgrade = json['upgrade'] == null
      ? null
      : Upgrade.fromJson(json['upgrade'] as Map<String, dynamic>);

Map<String, dynamic> _$HTShareBeanToJson(HTShareBean instance) =>
    <String, dynamic>{
      'link': instance.link,
      'text': instance.text,
      'song_link': instance.songLink,
      'song_text': instance.songText,
      'mtext': instance.mtext,
      'mlink': instance.mlink,
      'tttext': instance.tttext,
      'ttlink': instance.ttlink,
      'text1': instance.text1,
      'mlocklink': instance.mlocklink,
      'text2': instance.text2,
      'ttlocklink': instance.ttlocklink,
      'app_link': instance.appLink,
      'app_text': instance.appText,
      'appm_link': instance.appmLink,
      'appm_text': instance.appmText,
      'app7_link': instance.app7Link,
      'app7_text': instance.app7Text,
      'appm7_link': instance.appm7Link,
      'appm7_text': instance.appm7Text,
      'topic_link': instance.topicLink,
      'topic_text': instance.topicText,
      'invite_link': instance.inviteLink,
      'invite_text': instance.inviteText,
      'movie_link': instance.movieLink,
      'movie_text': instance.movieText,
      'tv_link': instance.tvLink,
      'tv_text': instance.tvText,
      'client_ip': instance.clientIp,
      'cf': instance.cf,
      'region_tag': instance.regionTag,
      'load': instance.load,
      'load1': instance.load1,
      'load2': instance.load2,
      'c1': instance.c1,
      'l1': instance.l1,
      'c3': instance.c3,
      'l3': instance.l3,
      'c2': instance.c2,
      'gd_nstll': instance.gdNstll?.toJson(),
      'd1': instance.d1?.toJson(),
      'd2': instance.d2?.toJson(),
      'd3': instance.d3?.toJson(),
      'upgrade': instance.upgrade?.toJson(),
    };

Gd_nstll _$Gd_nstllFromJson(Map<String, dynamic> json) => Gd_nstll()
  ..link = json['link'] as String?
  ..text = json['text'] as String?
  ..t3 = json['t3'] as String?
  ..title = json['title'] as String?
  ..update = json['update'] as String?
  ..cancel = json['cancel'] as String?
  ..status = json['status'] as int?
  ..k1 = json['k1'] as int?
  ..k2 = json['k2'] as int?
  ..l1 = json['l1'] as String?
  ..l2 = json['l2'] as String?
  ..l3 = json['l3'] as String?
  ..a1 = json['a1'] as String?
  ..t4 = json['t4'] as String?
  ..c4 = json['c4'] as String?
  ..c5 = json['c5'] as String?
  ..logo = json['logo'] as String?
  ..dp = json['dp'] as String?;

Map<String, dynamic> _$Gd_nstllToJson(Gd_nstll instance) => <String, dynamic>{
      'link': instance.link,
      'text': instance.text,
      't3': instance.t3,
      'title': instance.title,
      'update': instance.update,
      'cancel': instance.cancel,
      'status': instance.status,
      'k1': instance.k1,
      'k2': instance.k2,
      'l1': instance.l1,
      'l2': instance.l2,
      'l3': instance.l3,
      'a1': instance.a1,
      't4': instance.t4,
      'c4': instance.c4,
      'c5': instance.c5,
      'logo': instance.logo,
      'dp': instance.dp,
    };

D1 _$D1FromJson(Map<String, dynamic> json) => D1()
  ..status = json['status'] as int?
  ..t1 = json['t1'] as String?
  ..t2 = json['t2'] as String?
  ..t3 = json['t3'] as String?
  ..t4 = json['t4'] as String?;

Map<String, dynamic> _$D1ToJson(D1 instance) => <String, dynamic>{
      'status': instance.status,
      't1': instance.t1,
      't2': instance.t2,
      't3': instance.t3,
      't4': instance.t4,
    };

D2 _$D2FromJson(Map<String, dynamic> json) => D2()
  ..status = json['status'] as int?
  ..t1 = json['t1'] as String?
  ..t2 = json['t2'] as String?
  ..t3 = json['t3'] as String?
  ..b1 = json['b1'] as String?
  ..b2 = json['b2'] as String?
  ..s1 = json['s1'] as String?
  ..k1 = json['k1'] as int?
  ..k2 = json['k2'] as int?
  ..l1 = json['l1'] as String?
  ..l2 = json['l2'] as String?
  ..l3 = json['l3'] as String?
  ..a1 = json['a1'] as String?
  ..c4 = json['c4'] as String?
  ..c5 = json['c5'] as String?
  ..logo = json['logo'] as String?;

Map<String, dynamic> _$D2ToJson(D2 instance) => <String, dynamic>{
      'status': instance.status,
      't1': instance.t1,
      't2': instance.t2,
      't3': instance.t3,
      'b1': instance.b1,
      'b2': instance.b2,
      's1': instance.s1,
      'k1': instance.k1,
      'k2': instance.k2,
      'l1': instance.l1,
      'l2': instance.l2,
      'l3': instance.l3,
      'a1': instance.a1,
      'c4': instance.c4,
      'c5': instance.c5,
      'logo': instance.logo,
    };

D3 _$D3FromJson(Map<String, dynamic> json) => D3()
  ..status = json['status'] as int?
  ..t1 = json['t1'] as String?
  ..t2 = json['t2'] as String?
  ..t3 = json['t3'] as String?
  ..b1 = json['b1'] as String?
  ..b2 = json['b2'] as String?
  ..t4 = json['t4'] as String?
  ..t5 = json['t5'] as String?
  ..b3 = json['b3'] as String?
  ..k1 = json['k1'] as int?
  ..k2 = json['k2'] as int?
  ..k3 = json['k3'] as int?
  ..k4 = json['k4'] as int?
  ..l1 = json['l1'] as String?
  ..l2 = json['l2'] as String?
  ..l3 = json['l3'] as String?
  ..a1 = json['a1'] as String?
  ..c4 = json['c4'] as String?
  ..c5 = json['c5'] as String?
  ..logo = json['logo'] as String?;

Map<String, dynamic> _$D3ToJson(D3 instance) => <String, dynamic>{
      'status': instance.status,
      't1': instance.t1,
      't2': instance.t2,
      't3': instance.t3,
      'b1': instance.b1,
      'b2': instance.b2,
      't4': instance.t4,
      't5': instance.t5,
      'b3': instance.b3,
      'k1': instance.k1,
      'k2': instance.k2,
      'k3': instance.k3,
      'k4': instance.k4,
      'l1': instance.l1,
      'l2': instance.l2,
      'l3': instance.l3,
      'a1': instance.a1,
      'c4': instance.c4,
      'c5': instance.c5,
      'logo': instance.logo,
    };

Upgrade _$UpgradeFromJson(Map<String, dynamic> json) => Upgrade()
  ..link = json['link'] as String?
  ..text = json['text'] as String?
  ..scope = json['scope'] as int?
  ..status = json['status'] as int?;

Map<String, dynamic> _$UpgradeToJson(Upgrade instance) => <String, dynamic>{
      'link': instance.link,
      'text': instance.text,
      'scope': instance.scope,
      'status': instance.status,
    };
