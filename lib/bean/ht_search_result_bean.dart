import 'package:json_annotation/json_annotation.dart'; 
      
part 'ht_search_result_bean.g.dart';
    
@JsonSerializable(explicitToJson: true)
class ht_search_result_bean{

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'data')
  Data? data;

  ht_search_result_bean();

  static ht_search_result_bean fromJson(Map<String, dynamic> srcJson) => _$ht_search_result_beanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ht_search_result_beanToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Data{

  @JsonKey(name: 'movie_tv_list')
  List<Movie_tv_list>? movieTvList;

  @JsonKey(name: 'mtt_list')
  List<Mtt_list>? mttList;

  @JsonKey(name: 'z_info')
  Z_info? zInfo;

  @JsonKey(name: 'rltd_word')
  List<String>? rltdWord;

  Data();

  static Data fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Movie_tv_list{

  @JsonKey(name: 'medit')
  int? medit;

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'rate')
  String? rate;

  @JsonKey(name: 'data_type')
  String? dataType;

  @JsonKey(name: 'eps_cnts')
  String? epsCnts;

  @JsonKey(name: 'pub_date')
  String? pubDate;

  @JsonKey(name: 'ssn_id')
  String? ssnId;

  @JsonKey(name: 'eps_list')
  List<dynamic>? epsList;

  @JsonKey(name: 'stars')
  String? stars;

  @JsonKey(name: 'tags')
  String? tags;

  @JsonKey(name: 'country')
  String? country;

  @JsonKey(name: 'quality')
  String? quality;

  @JsonKey(name: 'ss_eps')
  String? ssEps;

  @JsonKey(name: 'new_flag')
  String? newFlag;

  @JsonKey(name: 'nw_flag')
  String? nwFlag;

  @JsonKey(name: 'best')
  int? best;

  @JsonKey(name: 'board')
  String? board;

  @JsonKey(name: 'sub')
  String? sub;

  @JsonKey(name: 'dub')
  String? dub;

  @JsonKey(name: 'ep')
  String? ep;

  @JsonKey(name: 'age')
  String? age;

  Movie_tv_list();

  static Movie_tv_list fromJson(Map<String, dynamic> srcJson) => _$Movie_tv_listFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Movie_tv_listToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Mtt_list{

  @JsonKey(name: 'medit')
  int? medit;

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'rate')
  String? rate;

  @JsonKey(name: 'data_type')
  String? dataType;

  @JsonKey(name: 'eps_cnts')
  String? epsCnts;

  @JsonKey(name: 'pub_date')
  String? pubDate;

  @JsonKey(name: 'ssn_id')
  String? ssnId;

  @JsonKey(name: 'eps_list')
  List<dynamic>? epsList;

  @JsonKey(name: 'stars')
  String? stars;

  @JsonKey(name: 'tags')
  String? tags;

  @JsonKey(name: 'country')
  String? country;

  @JsonKey(name: 'quality')
  String? quality;

  @JsonKey(name: 'ss_eps')
  String? ssEps;

  @JsonKey(name: 'new_flag')
  String? newFlag;

  @JsonKey(name: 'nw_flag')
  String? nwFlag;

  @JsonKey(name: 'best')
  int? best;

  @JsonKey(name: 'board')
  String? board;

  @JsonKey(name: 'sub')
  String? sub;

  @JsonKey(name: 'dub')
  String? dub;

  @JsonKey(name: 'ep')
  String? ep;

  @JsonKey(name: 'age')
  String? age;

  Mtt_list();

  static Mtt_list fromJson(Map<String, dynamic> srcJson) => _$Mtt_listFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Mtt_listToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
class Z_info{

  Z_info();

  static Z_info fromJson(Map<String, dynamic> srcJson) => _$Z_infoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Z_infoToJson(this);

}

  
