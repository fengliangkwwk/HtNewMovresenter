import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/bean/ht_season_and_episode_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/bean/ht_set_list_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/bean/ht_video_desc_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider_base.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_api.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_net_utils.dart';
import 'package:ht_new_movpresenter/utils/tools/ht_sys_tool.dart';

mixin HTVideoProviderMixin on HTVideoDescProviderBase {
  ///151
  HtVideoDescBean? videoDescBean;

  HtSeasonAndEpisodeBean? tv202Bean;

  HtSetListBean? tv203Bean;

  String? mType2;
  String? dataId;

  /// m_type_2:tt_mflx=电视剧   myfx:电影
  /// id:出入的视频id
  ///电影参数
  ///id 电影 id
  ///sig2 写死'kevMvWzTjzlckLgckegcoeeRwdwlwEbejzjLvzvSod1UkEqVkEeOkWjS'
  ///unixtime1 unixtime1与sig2是配套的
  ///unixtime 当前时间戳：unixtime与unixtime1相同
  ///api_ver 写死  ‘6’   电视剧的情况下才会加上此参数

  Future<void> apiRequest(String m_type_2, String id) async {
    mType2 = m_type_2;
    EasyLoading.show(status: 'loading...');
    if (m_type_2 == 'tt_mflx') {
      ///1.电视剧
      await request202(id);

      await request203();

      await request151(id);
    } else {
      ///1.电影
      await request144(id);
    }

    print('数据解析成功');
    EasyLoading.dismiss();
    notifyListeners();
  }

  ///退出当前页释放加载
  void dismissEasyLoading() {
    EasyLoading.dismiss();
  }

  ///电视剧
  ///202
  Future<void> request202(String id) async {
    var res = await HTNetUtils.htPost(apiUrl: Global.tvPlayUrl, params: {
      'tt_id': id, //电视 id
    });
    Map<String, dynamic> jsonMap = jsonDecode(res?.data.toString() ?? '');
    tv202Bean = HtSeasonAndEpisodeBean.fromJson(jsonMap);
  }

  ///203
  Future<void> request203() async {
    sid = (tv202Bean?.data?.ssnList?[0].id)?.toString();
    var res =
        await HTNetUtils.htPost(apiUrl: Global.switchingSeasonsUrl, params: {
      'id': tv202Bean?.data?.ssnList?[0].id, //季id
    });

    Map<String, dynamic> jsonMap = jsonDecode(res?.data.toString() ?? '');
    tv203Bean = HtSetListBean.fromJson(jsonMap['data']);
  }

  ///151
  Future<void> request151(String id) async {
    if (eid != null) {
      eid = tv203Bean?.epsList?[0].id.toString();
    }
    // 创建一个空的字典
    Map<String, dynamic> htVarparams = {};

    ///参数
    String cutterntTimeStamp = SysTools().getSecondsTimeStamp();
    htVarparams['id'] = eid; //电视剧集 id
    htVarparams['sig2'] =
        'kevMvWzTjzlckLgckegcoeeRwdwlwEbejzjLvzvSod1UkEqVkEeOkWjS';
    htVarparams['unixtime1'] = cutterntTimeStamp;
    htVarparams['unixtime'] = cutterntTimeStamp;
    htVarparams['api_ver'] = '6';
    var result =
        await HTNetUtils.htPost(apiUrl: Global.tvLinkUrl, params: htVarparams);
    // 解析JSON数据为User对象
    Map<String, dynamic> jsonMap = jsonDecode(result?.data?.toString() ?? '');
    videoDescBean = HtVideoDescBean.fromJson(jsonMap);
  }

  ///电影
  ///144
  Future<void> request144(String id) async {
    String cutterntTimeStamp = SysTools().getSecondsTimeStamp();
    var res =
        await HTNetUtils.htPost(apiUrl: Global.movieLinksAndMoviesUrl, params: {
      'id': id,
      'sig2': 'kevMvWzTjzlckLgckegcoeeRwdwlwEbejzjLvzvSod1UkEqVkEeOkWjS',
      'unixtime1': cutterntTimeStamp,
      'unixtime': cutterntTimeStamp,
      'api_ver': '6'
    });
    Map<String, dynamic> jsonMap = jsonDecode(res?.data.toString() ?? '');
    videoDescBean = HtVideoDescBean.fromJson(jsonMap);
  }
}
