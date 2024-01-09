import 'package:flutter/foundation.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/beans/ht_mid_search_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/providers/ht_midsearch_provider/ht_midsearch_provider_base.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_api.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_net_utils.dart';
import "dart:convert";

mixin HTMidSearchProviderMiXin on HTMidSearchProviderBase {
  ///ht_mid_search_bean
  ht_mid_search_bean? midSearchBean;

  var map = {
    0: null,
  };

  Future<void> apiRequest(String type) async {
/**
 * type  5.All; 1.Movies; 2.TV Shows; 3.Animated Series; 4.Animation Movies
 */
    if (type == '0') {
      type = '5';
    }

    Map<String, dynamic> htVarparams = {"type": type};
    var res = await HTNetUtils.htPost(
        apiUrl: Global.midSearchUrl, params: htVarparams, needCommon: true);
    if (kDebugMode) {
      print(res);
    }
    Map<String, dynamic> stringMap = jsonDecode(res.toString());

    for (var element in stringMap['data']) {
      if (element['mtype'] == '3') {}
    }
    midSearchBean = ht_mid_search_bean.fromJson(stringMap);
    var _temList = <Data>[];

    /// 过滤数据 ( mtype = [1,2,4])
    for (var element in midSearchBean?.data ?? <Data>[]) {
      if (['1', '2', '4'].contains(element.mtype ?? '')) {
        _temList.add(element);
      }
    }
    midSearchBean?.data = _temList;

    if (kDebugMode) {
      print(' $midSearchBean');
    }
    notifyListeners();
  }
}
