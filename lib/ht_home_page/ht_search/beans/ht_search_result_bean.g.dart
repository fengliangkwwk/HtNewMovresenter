// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ht_search_result_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ht_search_result_bean _$ht_search_result_beanFromJson(
        Map<String, dynamic> json) =>
    ht_search_result_bean()
      ..status = json['status'] as int?
      ..msg = json['msg'] as String?
      ..data = json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$ht_search_result_beanToJson(
        ht_search_result_bean instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data?.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data()
  ..movieTvList = (json['movie_tv_list'] as List<dynamic>?)
      ?.map((e) => Movie_tv_list.fromJson(e as Map<String, dynamic>))
      .toList()
  ..mttList = (json['mtt_list'] as List<dynamic>?)
      ?.map((e) => Mtt_list.fromJson(e as Map<String, dynamic>))
      .toList()
  ..zInfo = json['z_info'] == null
      ? null
      : Z_info.fromJson(json['z_info'] as Map<String, dynamic>)
  ..rltdWord =
      (json['rltd_word'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'movie_tv_list': instance.movieTvList?.map((e) => e.toJson()).toList(),
      'mtt_list': instance.mttList?.map((e) => e.toJson()).toList(),
      'z_info': instance.zInfo?.toJson(),
      'rltd_word': instance.rltdWord,
    };

Movie_tv_list _$Movie_tv_listFromJson(Map<String, dynamic> json) =>
    Movie_tv_list()
      ..medit = json['medit'] as int?
      ..id = json['id'] as String?
      ..title = json['title'] as String?
      ..cover = json['cover'] as String?
      ..rate = json['rate'] as String?
      ..dataType = json['data_type'] as String?
      ..epsCnts = json['eps_cnts'] as String?
      ..pubDate = json['pub_date'] as String?
      ..ssnId = json['ssn_id'] as String?
      ..epsList = json['eps_list'] as List<dynamic>?
      ..stars = json['stars'] as String?
      ..tags = json['tags'] as String?
      ..country = json['country'] as String?
      ..quality = json['quality'] as String?
      ..ssEps = json['ss_eps'] as String?
      ..newFlag = json['new_flag'] as String?
      ..nwFlag = json['nw_flag'] as String?
      ..best = json['best'] as int?
      ..board = json['board'] as String?
      ..sub = json['sub'] as String?
      ..dub = json['dub'] as String?
      ..ep = json['ep'] as String?
      ..age = json['age'] as String?;

Map<String, dynamic> _$Movie_tv_listToJson(Movie_tv_list instance) =>
    <String, dynamic>{
      'medit': instance.medit,
      'id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
      'rate': instance.rate,
      'data_type': instance.dataType,
      'eps_cnts': instance.epsCnts,
      'pub_date': instance.pubDate,
      'ssn_id': instance.ssnId,
      'eps_list': instance.epsList,
      'stars': instance.stars,
      'tags': instance.tags,
      'country': instance.country,
      'quality': instance.quality,
      'ss_eps': instance.ssEps,
      'new_flag': instance.newFlag,
      'nw_flag': instance.nwFlag,
      'best': instance.best,
      'board': instance.board,
      'sub': instance.sub,
      'dub': instance.dub,
      'ep': instance.ep,
      'age': instance.age,
    };

Mtt_list _$Mtt_listFromJson(Map<String, dynamic> json) => Mtt_list()
  ..medit = json['medit'] as int?
  ..id = json['id'] as String?
  ..title = json['title'] as String?
  ..cover = json['cover'] as String?
  ..rate = json['rate'] as String?
  ..dataType = json['data_type'] as String?
  ..epsCnts = json['eps_cnts'] as String?
  ..pubDate = json['pub_date'] as String?
  ..ssnId = json['ssn_id'] as String?
  ..epsList = json['eps_list'] as List<dynamic>?
  ..stars = json['stars'] as String?
  ..tags = json['tags'] as String?
  ..country = json['country'] as String?
  ..quality = json['quality'] as String?
  ..ssEps = json['ss_eps'] as String?
  ..newFlag = json['new_flag'] as String?
  ..nwFlag = json['nw_flag'] as String?
  ..best = json['best'] as int?
  ..board = json['board'] as String?
  ..sub = json['sub'] as String?
  ..dub = json['dub'] as String?
  ..ep = json['ep'] as String?
  ..age = json['age'] as String?;

Map<String, dynamic> _$Mtt_listToJson(Mtt_list instance) => <String, dynamic>{
      'medit': instance.medit,
      'id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
      'rate': instance.rate,
      'data_type': instance.dataType,
      'eps_cnts': instance.epsCnts,
      'pub_date': instance.pubDate,
      'ssn_id': instance.ssnId,
      'eps_list': instance.epsList,
      'stars': instance.stars,
      'tags': instance.tags,
      'country': instance.country,
      'quality': instance.quality,
      'ss_eps': instance.ssEps,
      'new_flag': instance.newFlag,
      'nw_flag': instance.nwFlag,
      'best': instance.best,
      'board': instance.board,
      'sub': instance.sub,
      'dub': instance.dub,
      'ep': instance.ep,
      'age': instance.age,
    };

Z_info _$Z_infoFromJson(Map<String, dynamic> json) => Z_info();

Map<String, dynamic> _$Z_infoToJson(Z_info instance) => <String, dynamic>{};
