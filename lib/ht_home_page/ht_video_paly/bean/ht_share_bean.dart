import 'package:json_annotation/json_annotation.dart'; 
      
part 'ht_share_bean.g.dart';
    
@JsonSerializable(explicitToJson: true)
class HTShareBean{

  @JsonKey(name: 'link')
  String? link;

  @JsonKey(name: 'text')
  String? text;

  @JsonKey(name: 'song_link')
  String? songLink;

  @JsonKey(name: 'song_text')
  String? songText;

  @JsonKey(name: 'mtext')
  String? mtext;

  @JsonKey(name: 'mlink')
  String? mlink;

  @JsonKey(name: 'tttext')
  String? tttext;

  @JsonKey(name: 'ttlink')
  String? ttlink;

  @JsonKey(name: 'text1')
  String? text1;

  @JsonKey(name: 'mlocklink')
  String? mlocklink;

  @JsonKey(name: 'text2')
  String? text2;

  @JsonKey(name: 'ttlocklink')
  String? ttlocklink;

  @JsonKey(name: 'app_link')
  String? appLink;

  @JsonKey(name: 'app_text')
  String? appText;

  @JsonKey(name: 'appm_link')
  String? appmLink;

  @JsonKey(name: 'appm_text')
  String? appmText;

  @JsonKey(name: 'app7_link')
  String? app7Link;

  @JsonKey(name: 'app7_text')
  String? app7Text;

  @JsonKey(name: 'appm7_link')
  String? appm7Link;

  @JsonKey(name: 'appm7_text')
  String? appm7Text;

  @JsonKey(name: 'topic_link')
  String? topicLink;

  @JsonKey(name: 'topic_text')
  String? topicText;

  @JsonKey(name: 'invite_link')
  String? inviteLink;

  @JsonKey(name: 'invite_text')
  String? inviteText;

  @JsonKey(name: 'movie_link')
  String? movieLink;

  @JsonKey(name: 'movie_text')
  String? movieText;

  @JsonKey(name: 'tv_link')
  String? tvLink;

  @JsonKey(name: 'tv_text')
  String? tvText;

  @JsonKey(name: 'client_ip')
  String? clientIp;

  @JsonKey(name: 'cf')
  String? cf;

  @JsonKey(name: 'region_tag')
  String? regionTag;

  @JsonKey(name: 'load')
  String? load;

  @JsonKey(name: 'load1')
  int? load1;

  @JsonKey(name: 'load2')
  String? load2;

  @JsonKey(name: 'c1')
  String? c1;

  @JsonKey(name: 'l1')
  String? l1;

  @JsonKey(name: 'c3')
  List<String>? c3;

  @JsonKey(name: 'l3')
  List<String>? l3;

  @JsonKey(name: 'c2')
  String? c2;

  @JsonKey(name: 'gd_nstll')
  Gd_nstll? gdNstll;

  @JsonKey(name: 'd1')
  D1? d1;

  @JsonKey(name: 'd2')
  D2? d2;

  @JsonKey(name: 'd3')
  D3? d3;

  @JsonKey(name: 'upgrade')
  Upgrade? upgrade;

  HTShareBean();

  static HTShareBean fromJson(Map<String, dynamic> srcJson) => _$HTShareBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HTShareBeanToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Gd_nstll{

  @JsonKey(name: 'link')
  String? link;

  @JsonKey(name: 'text')
  String? text;

  @JsonKey(name: 't3')
  String? t3;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'update')
  String? update;

  @JsonKey(name: 'cancel')
  String? cancel;

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'k1')
  int? k1;

  @JsonKey(name: 'k2')
  int? k2;

  @JsonKey(name: 'l1')
  String? l1;

  @JsonKey(name: 'l2')
  String? l2;

  @JsonKey(name: 'l3')
  String? l3;

  @JsonKey(name: 'a1')
  String? a1;

  @JsonKey(name: 't4')
  String? t4;

  @JsonKey(name: 'c4')
  String? c4;

  @JsonKey(name: 'c5')
  String? c5;

  @JsonKey(name: 'logo')
  String? logo;

  @JsonKey(name: 'dp')
  String? dp;

  Gd_nstll();

  static Gd_nstll fromJson(Map<String, dynamic> srcJson) => _$Gd_nstllFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Gd_nstllToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class D1{

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 't1')
  String? t1;

  @JsonKey(name: 't2')
  String? t2;

  @JsonKey(name: 't3')
  String? t3;

  @JsonKey(name: 't4')
  String? t4;

  D1();

  static D1 fromJson(Map<String, dynamic> srcJson) => _$D1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$D1ToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class D2{

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 't1')
  String? t1;

  @JsonKey(name: 't2')
  String? t2;

  @JsonKey(name: 't3')
  String? t3;

  @JsonKey(name: 'b1')
  String? b1;

  @JsonKey(name: 'b2')
  String? b2;

  @JsonKey(name: 's1')
  String? s1;

  @JsonKey(name: 'k1')
  int? k1;

  @JsonKey(name: 'k2')
  int? k2;

  @JsonKey(name: 'l1')
  String? l1;

  @JsonKey(name: 'l2')
  String? l2;

  @JsonKey(name: 'l3')
  String? l3;

  @JsonKey(name: 'a1')
  String? a1;

  @JsonKey(name: 'c4')
  String? c4;

  @JsonKey(name: 'c5')
  String? c5;

  @JsonKey(name: 'logo')
  String? logo;

  D2();

  static D2 fromJson(Map<String, dynamic> srcJson) => _$D2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$D2ToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class D3{

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 't1')
  String? t1;

  @JsonKey(name: 't2')
  String? t2;

  @JsonKey(name: 't3')
  String? t3;

  @JsonKey(name: 'b1')
  String? b1;

  @JsonKey(name: 'b2')
  String? b2;

  @JsonKey(name: 't4')
  String? t4;

  @JsonKey(name: 't5')
  String? t5;

  @JsonKey(name: 'b3')
  String? b3;

  @JsonKey(name: 'k1')
  int? k1;

  @JsonKey(name: 'k2')
  int? k2;

  @JsonKey(name: 'k3')
  int? k3;

  @JsonKey(name: 'k4')
  int? k4;

  @JsonKey(name: 'l1')
  String? l1;

  @JsonKey(name: 'l2')
  String? l2;

  @JsonKey(name: 'l3')
  String? l3;

  @JsonKey(name: 'a1')
  String? a1;

  @JsonKey(name: 'c4')
  String? c4;

  @JsonKey(name: 'c5')
  String? c5;

  @JsonKey(name: 'logo')
  String? logo;

  D3();

  static D3 fromJson(Map<String, dynamic> srcJson) => _$D3FromJson(srcJson);

  Map<String, dynamic> toJson() => _$D3ToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Upgrade{

  @JsonKey(name: 'link')
  String? link;

  @JsonKey(name: 'text')
  String? text;

  @JsonKey(name: 'scope')
  int? scope;

  @JsonKey(name: 'status')
  int? status;

  Upgrade();

  static Upgrade fromJson(Map<String, dynamic> srcJson) => _$UpgradeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UpgradeToJson(this);

}

  
