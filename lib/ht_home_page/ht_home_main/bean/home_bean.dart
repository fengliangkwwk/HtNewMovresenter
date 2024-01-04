// ignore_for_file: non_constant_identifier_names

import 'package:ht_new_movpresenter/ht_home_page/ht_search/beans/ht_mid_search_bean.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_bean.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeBean {
  @JsonKey(name: '348')
  List<dynamic>? list348;

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'data')
  List<DataList>? dataList;

  @JsonKey(name: 'region')
  String? region;

  @JsonKey(name: 'source')
  String? source;

  @JsonKey(name: 'pagecnt')
  int? pagecnt;

  @JsonKey(name: 'total')
  int? total;

  @JsonKey(name: 'kws')
  List<String>? kws;

  @JsonKey(name: 'shortcut')
  List<dynamic>? shortcut;

  @JsonKey(name: 'retract')
  String? retract;

  @JsonKey(name: 'region_tag')
  String? regionTag;

  HomeBean();

  static HomeBean fromJson(Map<String, dynamic> srcJson) =>
      _$HomeBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeBeanToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DataList {
  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'data')
  List<ItemData>? itemData;

  @JsonKey(name: 'order')
  int? order;

  @JsonKey(name: 'display_type')
  String? display_type;

  @JsonKey(name: 'playlist_key')
  String? playListId;

  @JsonKey(name: 'secname')
  String? secname;

  @JsonKey(name: 'data_type')
  String? data_type;

  @JsonKey(name: 'open_mode_value')
  String? open_mode_value;

  @JsonKey(name: 'moreflag')
  String? moreflag;

  @JsonKey(name: 'seeall')
  String? seeall;

  @JsonKey(name: 'seeall_value')
  String? seeall_value;

  @JsonKey(name: 'open_mode')
  String? open_mode;

  @JsonKey(name: 'info_type_2')
  String? info_type_2;

  @JsonKey(includeToJson: true, defaultValue: 0)
  int? page;

  @JsonKey(includeToJson: true, defaultValue: 20)
  int? pageSize;

  @JsonKey(includeToJson: true, defaultValue: 9)
  int? filterNo;

  DataList();

  static DataList fromJson(Map<String, dynamic> srcJson) =>
      _$DataListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataListToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ItemData {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'img')
  String? img;

  @JsonKey(name: 'playlist_id')
  int? playlist_id;

  @JsonKey(name: 'new_img')
  String? new_img;

  @JsonKey(name: 'new_conf_type')
  int? new_conf_type;

  @JsonKey(name: 'new_conf_value')
  String? new_conf_value;

  @JsonKey(name: 'new_conf_name')
  String? new_conf_name;

  @JsonKey(name: 'new_conf_artist')
  String? new_conf_artist;

  @JsonKey(name: 'new_conf_desc')
  String? new_conf_desc;

  @JsonKey(name: 'new_conf_rate')
  String? new_conf_rate;

  @JsonKey(name: 'new_conf_duration')
  String? new_conf_duration;

  @JsonKey(name: 'new_conf_pub')
  String? new_conf_pub;

  @JsonKey(name: 'new_conf_name_2')
  String? new_conf_name_2;

  @JsonKey(name: 'order')
  int? order;

  @JsonKey(name: 'ss_tag')
  String? ss_tag;

  @JsonKey(name: 'nw_img')
  String? nw_img;

  @JsonKey(name: 'nw_conf_type')
  int? nw_conf_type;

  @JsonKey(name: 'nw_conf_value')
  String? nw_conf_value;

  @JsonKey(name: 'nw_conf_name')
  String? nw_conf_name;

  @JsonKey(name: 'nw_conf_artist')
  String? nw_conf_artist;

  @JsonKey(name: 'nw_conf_desc')
  String? nw_conf_desc;

  @JsonKey(name: 'nw_conf_rate')
  String? nw_conf_rate;

  @JsonKey(name: 'nw_conf_duration')
  String? nw_conf_duration;

  @JsonKey(name: 'nw_conf_pub')
  String? nw_conf_pub;

  @JsonKey(name: 'nw_conf_name_2')
  String? nw_conf_name_2;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'cover2')
  String? cover2;

  @JsonKey(name: 'desc')
  String? desc;
  @JsonKey(name: 'browser')
  String? browser;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'm20')
  List<M20>? m20;

  @JsonKey(name: 'tt20')
  List<TT20>? tt20;

  String iconImage() {
    if (cover2 == null || cover2?.isEmpty == true) {
      return cover ?? '';
    }

    return cover2 ?? '';
  }

  ///右下角剧集更新  只有电视剧(tttype)才会显示 且new_flag==’NEW‘代表有更新时才会显示
  bool showRightBottom() {
    //  if (DataList.info_type_2 == 'tttype' && TT20.new_flag == 'NEW') {
    //    return true;
    //  }
    return false;
  }

  ///右上角 CAD  只有电影，且是枪版电影（quality == 'CAD） 才会显示
  bool showRightTop() {
    // if (DataList.info_type_2 == 'mtype'&& M20.quality == 'CAD') {
    //   return true;
    // }
    return true;
  }

  ItemData();

  static ItemData fromJson(Map<String, dynamic> srcJson) =>
      _$ItemDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ItemDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class M20 {
  @JsonKey(name: 'order')
  int? order;

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'rate')
  String? rate;

 String getRate() {
    if (rate == null || rate?.isEmpty == true) {
      return '';
    } else {
      try {
        return double.parse(rate!).toStringAsFixed(1);
      } catch (e) {
        return '';
      }
    }
  }
  
  @JsonKey(name: 'stars')
  String? stars;

  @JsonKey(name: 'views')
  String? views;

  @JsonKey(name: 'pub_date')
  String? pubDate;

  @JsonKey(name: 'tags')
  String? tags;

  @JsonKey(name: 'm_type')
  String? mType;

  @JsonKey(name: 'm_type_2')
  String? mType2;

  @JsonKey(name: 'quality')
  String? quality;

  @JsonKey(name: 'gif')
  String? gif;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'c_cnts')
  String? cCnts;

  M20();

  static M20 fromJson(Map<String, dynamic> srcJson) => _$M20FromJson(srcJson);

  Map<String, dynamic> toJson() => _$M20ToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TT20 {
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

  String getRate() {
    if (rate == null || rate?.isEmpty == true) {
      return '';
    } else {
      try {
        return double.parse(rate!).toStringAsFixed(1);
      } catch (e) {
        return '';
      }
    }
  }

  @JsonKey(name: 'pub_date')
  String? pub_date;

  @JsonKey(name: 'tags')
  String? tags;

  @JsonKey(name: 'm_type')
  String? m_type;

  @JsonKey(name: 'm_type_2')
  String? m_type_2;

  @JsonKey(name: 'order')
  int? order;

  @JsonKey(name: 'new_flag')
  String? new_flag;

  @JsonKey(name: 'nw_flag')
  String? nw_flag;

  @JsonKey(name: 'ss_eps')
  String? ss_eps;

  @JsonKey(name: 'update')
  String? update;

  @JsonKey(name: 'c_cnts')
  String? c_cnts;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'gif')
  String? gif;

  TT20();

  static TT20 fromJson(Map<String, dynamic> srcJson) => _$TT20FromJson(srcJson);

  Map<String, dynamic> toJson() => _$TT20ToJson(this);
}
