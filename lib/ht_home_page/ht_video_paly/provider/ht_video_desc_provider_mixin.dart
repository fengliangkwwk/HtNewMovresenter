import 'dart:convert';

import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/bean/ht_video_desc_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider_base.dart';
import 'package:ht_new_movpresenter/utils/ht_api.dart';
import 'package:ht_new_movpresenter/utils/ht_net_utils.dart';
import 'package:ht_new_movpresenter/utils/ht_sys_tool.dart';

mixin HTVideoProviderMixin on HTVideoDescProviderBase {
  HTVideoDescBean? videoDescBean;
  /// m_type_2:tt_mflx=电视剧   myfx:电影
  /// id:出入的视频id

  ///电影参数
  ///id 电影 id
  ///sig2 写死'kevMvWzTjzlckLgckegcoeeRwdwlwEbejzjLvzvSod1UkEqVkEeOkWjS'
  ///unixtime1 unixtime1与sig2是配套的
  ///unixtime 当前时间戳：unixtime与unixtime1相同
  ///api_ver 写死  ‘6’   电视剧的情况下才会加上此参数

  Future<void> apiRequest(String m_type_2, String id) async {
    /// 请求url
    var apiUrl = Global.movieLinksAndMoviesUrl;
    // 创建一个空的字典
    Map<String, dynamic> htVarparams = {};

    ///参数
    String cutterntTimeStamp = SysTools().getSecondsTimeStamp();
    htVarparams['id'] = id;
    htVarparams['sig2'] =
        'kevMvWzTjzlckLgckegcoeeRwdwlwEbejzjLvzvSod1UkEqVkEeOkWjS';
    htVarparams['unixtime1'] = cutterntTimeStamp;
    htVarparams['unixtime'] = cutterntTimeStamp;
    if (m_type_2 == 'tt_mflx') {
      htVarparams['api_ver'] = '6';
      apiUrl = Global.tvLinkUrl;
    }
    var result = await HTNetUtils.htPost(apiUrl: apiUrl, params: htVarparams);

    print(result);
    // 解析JSON数据为User对象
    Map<String, dynamic> jsonMap = jsonDecode(result.toString());
    videoDescBean = HTVideoDescBean.fromJson(jsonMap);
    notifyListeners();
  }
}
