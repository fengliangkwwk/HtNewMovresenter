import 'dart:math';

import 'package:ht_new_movpresenter/ht_home_page/ht_search/beans/ht_mid_search_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/providers/ht_midsearch_provider/ht_midsearch_provider_base.dart';
import 'package:ht_new_movpresenter/utils/ht_api.dart';
import 'package:ht_new_movpresenter/utils/ht_net_utils.dart';
import 'package:ht_new_movpresenter/utils/ui_utils.dart';
import 'package:dio/dio.dart' as MidSearch;
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


    await KTClassUIUtils.htMethodPutRequestCommonParams(htVarparams);
    var formData = MidSearch.FormData.fromMap(htVarparams);
    var dio = MidSearch.Dio();
    var res = await dio.post(
      Global.midSearchUrl,
      data: formData,
    );
    // var res =
    //     HTNetUtils.htPost(apiUrl: Global.midSearchUrl, params: htVarparams,needCommon: true);
    print(res);
    // Map map = jsonDecode(res.toString());
    // Map<String, dynamic> stringMap =
    //     map.map((key, value) => MapEntry(key.toString(), value));
    Map<String, dynamic> stringMap =
       jsonDecode(res.toString());

    for (var element in stringMap['data']) {
      if (element['mtype'] == '3') {

      }
      
    }
    midSearchBean = ht_mid_search_bean.fromJson(stringMap);

    /// 过滤数据（未做）

    print(' $midSearchBean');
    notifyListeners();
  }
}
