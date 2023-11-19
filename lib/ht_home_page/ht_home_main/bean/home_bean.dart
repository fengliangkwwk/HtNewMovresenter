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
  String? displayType;

  @JsonKey(name: 'secname')
  String? secname;

  @JsonKey(name: 'data_type')
  String? dataType;

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
  int? playlistId;

  @JsonKey(name: 'new_img')
  String? newImg;

  @JsonKey(name: 'new_conf_type')
  int? newConfType;

  @JsonKey(name: 'new_conf_value')
  String? newConfValue;

  @JsonKey(name: 'new_conf_name')
  String? newConfName;

  @JsonKey(name: 'new_conf_artist')
  String? newConfArtist;

  @JsonKey(name: 'new_conf_desc')
  String? newConfDesc;

  @JsonKey(name: 'new_conf_rate')
  String? newConfRate;

  @JsonKey(name: 'new_conf_duration')
  String? newConfDuration;

  @JsonKey(name: 'new_conf_pub')
  String? newConfPub;

  @JsonKey(name: 'new_conf_name_2')
  String? newConfName2;

  @JsonKey(name: 'order')
  int? order;

  @JsonKey(name: 'ss_tag')
  String? ssTag;

  @JsonKey(name: 'nw_img')
  String? nwImg;

  @JsonKey(name: 'nw_conf_type')
  int? nwConfType;

  @JsonKey(name: 'nw_conf_value')
  String? nwConfValue;

  @JsonKey(name: 'nw_conf_name')
  String? nwConfName;

  @JsonKey(name: 'nw_conf_artist')
  String? nwConfArtist;

  @JsonKey(name: 'nw_conf_desc')
  String? nwConfDesc;

  @JsonKey(name: 'nw_conf_rate')
  String? nwConfRate;

  @JsonKey(name: 'nw_conf_duration')
  String? nwConfDuration;

  @JsonKey(name: 'nw_conf_pub')
  String? nwConfPub;

  @JsonKey(name: 'nw_conf_name_2')
  String? nwConfName2;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'cover2')
  String? cover2;


  String iconImage() {
    if (cover2 == null || cover2?.isEmpty == true) {
      return cover ?? '';
    }

    return cover2 ?? '';
  }


  ItemData();

  static ItemData fromJson(Map<String, dynamic> srcJson) =>
      _$ItemDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ItemDataToJson(this);
}
