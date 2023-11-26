import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/bean/home_second_level_bean.dart';
import 'package:ht_new_movpresenter/utils/ht_api.dart';
import 'package:ht_new_movpresenter/utils/ht_net_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HTHomeSecondLevelProvidr extends ChangeNotifier {
  ////列表数据
  List<HomeSecondLevelBean> dataList = [];

  ///是否加载中
  bool loading = true;

  ///列表id
  String? listId;

  ///页码
  int page = 1;

  ///下拉刷新控制器
  RefreshController  refreshController = RefreshController();


  void loadData({required String id}) async {
    listId = id;
    await requestData();
  }

  ///请求数据
  Future<void> requestData({bool refresh = false}) async {
    EasyLoading.show();
    var res = await HTNetUtils.htPost(
      apiUrl: Global.secondLevelUrl,
      params: {
        'id': listId,
        'page': page.toString(),
        'page_size': 20.toString(),
      },
    );

    var dataVaule = jsonDecode(res?.data ?? '');
    var _dataList = <HomeSecondLevelBean>[];
    if (dataVaule['status'] == 200) {
      for (Map<String, dynamic> element in dataVaule?['data']?['minfo'] ?? []) {
        _dataList.add(HomeSecondLevelBean.fromJson(element));
      }
    }
    print('二级页数据解析成功');

    if (refresh == true) {
      dataList = [];
    }

    dataList.addAll(_dataList);
    loading = false;
    refreshController.refreshCompleted();
    refreshController.loadComplete();
    EasyLoading.dismiss();
    notifyListeners();
  }

  void onRefresh() {
    page = 1;
    loading = true;
    notifyListeners();
    requestData(refresh: true);
  }

  void onLoad() {
    page ++;
    loading = true;
    notifyListeners();
    requestData();
  }
}
