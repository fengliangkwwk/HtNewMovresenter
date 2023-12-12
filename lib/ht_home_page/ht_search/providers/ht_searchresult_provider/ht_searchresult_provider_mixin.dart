import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/beans/ht_search_result_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/providers/ht_searchresult_provider/ht_searchresult_provider_base.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_api.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_net_utils.dart';

mixin HTSearchResultProviderMiXin on HTSearchResultProviderBase {
  ht_search_result_bean? resultData;

  // /**
  //  * v_type:固定传 0
  //  * page_size：每页数量  24
  //  * page：页码 从 1 开始
  //  * keyword：搜索关键字
  //  */
  Future<void> searchReasultRequestApi({bool isRefresh = false}) async {
    EasyLoading.show();
    Map<String, dynamic> htVarparams = {
      "keyword": keyword,
      "page": page,
      "page_size": pageSize,
      "v_type": vType,
    };

    var res =
        await HTNetUtils.htPost(apiUrl: Global.searchUrl, params: htVarparams);
    var json = jsonDecode(res?.data);
    ht_search_result_bean? temBen;
    temBen = ht_search_result_bean.fromJson(json);
    resultData ??= temBen;

    var temp = <Mtt_list>[];
    for (var element in json['data']['mtt_list'] ?? []) {
      if (['1', '3'].contains(element['data_type'])) {
        temp.add(Mtt_list.fromJson(element));
      }
    }

    if (isRefresh == true) {
      resultData?.data?.mttList = [];
      resultData?.data?.mttList = temp;
    } else {
      resultData?.data?.mttList?.addAll(temp);
    }

    loading = !loading;
    EasyLoading.dismiss();
    refreshController.refreshCompleted();
    refreshController.loadComplete();
    if (temp.isEmpty) {
      refreshController.loadNoData();
    }
    notifyListeners();
  }
}
