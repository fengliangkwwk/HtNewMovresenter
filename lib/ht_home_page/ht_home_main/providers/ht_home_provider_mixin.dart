import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/bean/home_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/bean/homedropping_water_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/providers/ht_home_provider_base.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_api.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_net_utils.dart';

///数据请求
mixin HTHomeProviderMixin on HTHomeProviderBase {
  ///首页的列表数据
  List<DataList> dataList = [];

  ///瀑布流数据
  List<HomedroppingWaterBean> droppingWaterDataList = [];

  var page = 1;

  ///瀑布流页码
  var droppingWaterPage = 1;

  ///影视首页数据请求
  Future<void> apiRequest({bool refresh = false}) async {
    ///页码，从1开始
    var pageSize = "20";

    ///分页大小
    var p1 = "0";

    ///接口版本；默认传0，传2时结合datetag会返内容推荐
    var datetag = "20230328";

    ///yyyyMMdd，东八区-北京时间，值为安装时间
    var id = "35140";

    ///猜你喜欢电影ID，不传时无对应模块信息
    Map<String, dynamic> htVarparams = {
      "page": page.toString(),
      "page_size": pageSize,
      "p1": p1,
      "datetag": datetag,
      "id": id
    };
    var res = await HTNetUtils.htPost(
        apiUrl: Global.homePageUrl, params: htVarparams);
    var json = jsonDecode(res?.data);
    if (refresh) {
      dataList = [];
      droppingWaterDataList = [];
    }
    var _dataList = <DataList>[];
    for (var element in json?['data']?['default_set']?['data'] ?? []) {
      if (element["data_type"] == '1' || element["data_type"] == '4') {
        _dataList.add(DataList.fromJson(element));
      }
    }

    if (_dataList.isEmpty && page > 1) {
      droppingWaterPage++;
      await droppingWaterNet();
    } else {
      dataList.addAll(_dataList);
      print('首页解析数据成功');
    }
    loading = false;

    ///结束刷新状态
    refreshController.refreshCompleted();
    refreshController.loadComplete();
    EasyLoading.dismiss();
    notifyListeners();
  }

  ///点击more
  Future<void> moreNet({
    DataList? data,
  }) async {
    data?.page = (data.page ?? 0) + 1;
    // EasyLoading.show();
    var res = await HTNetUtils.htPost(apiUrl: Global.homeMoreUrl, params: {
      'id': data?.playListId.toString(),
      'page': data?.page.toString(),
      'pageSize': data?.pageSize.toString(),
      'filter_no': data?.filterNo.toString()
    });
    var json = jsonDecode(res?.data);

    for (var element in json['data']['minfo'] ?? []) {
      data?.itemData?[0].m20?.add(M20.fromJson(element));
    }
    loading = !loading;
    // EasyLoading.dismiss();
    selectData = null;
    notifyListeners();
  }

  ///瀑布流接口
  Future<void> droppingWaterNet() async {
    var res = await HTNetUtils.htPost(
        apiUrl: Global.droppingWaterfallFlowUrl,
        params: {
          'page': droppingWaterPage.toString(),
          'page_size': '20',
          'orderby': '1',
          'type': '100',
          'stageflag': '3',
        });

    var dataValue = jsonDecode(res?.data ?? '');
    var _dataList = <HomedroppingWaterBean>[];
    for (var element in dataValue?['data']?['minfo'] ?? []) {
      _dataList.add(HomedroppingWaterBean.fromJson(element));
    }
    droppingWaterDataList.addAll(_dataList);
    print('解析瀑布流数据成功');
    // notifyListeners();
  }
}
