import 'dart:convert';

import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/bean/home_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/bean/homedropping_water_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/providers/ht_home_provider_base.dart';
import 'package:ht_new_movpresenter/utils/ht_api.dart';
import 'package:ht_new_movpresenter/utils/ht_net_utils.dart';
import 'package:ht_new_movpresenter/utils/ui_utils.dart';
import 'package:dio/dio.dart';

///数据请求
mixin HTHomeProviderMixin on HTHomeProviderBase {
  // HomeBean? homeData;

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

    // Map<String, dynamic> htVarparams = {"page": page,"page_size":page_size,"p1":p1,"datetag":datetag,"id":id};
    // await KTClassUIUtils.htMethodPutRequestCommonParams(htVarparams);
    // var formData = FormData.fromMap(htVarparams);
    // // ignore: avoid_print
    // var res = await HttpUtils.instance.post(
    //   Global.homePageUrl,
    //   params: formData,
    //   tips: true,
    // );
    Map<String, dynamic> htVarparams = {
      "page": page.toString(),
      "page_size": pageSize,
      "p1": p1,
      "datetag": datetag,
      "id": id
    };
    await KTClassUIUtils.htMethodPutRequestCommonParams(htVarparams);
    var formData = FormData.fromMap(htVarparams);
    var dio = Dio();
    var res = await dio.post(
      Global.homePageUrl,
      data: formData,
    );
    var json = jsonDecode(res.data);
    if (refresh) {
      dataList = [];
      droppingWaterDataList = [];
    }
    var _dataList = <DataList>[];
    for (var element in json?['data']?['default_set']?['data'] ?? []) {
      _dataList.add(DataList.fromJson(element));
    }

    ///
    if (_dataList.isEmpty && page > 1) {
      droppingWaterPage++;
      await droppingWaterNet();
    } else {
      dataList.addAll(_dataList);
      print('首页解析数据成功');
    }
    loading = false;
    notifyListeners();
  }

  ///点击more
  Future<void> moreNet() async {
    await HTNetUtils.htPost(apiUrl: Global.homeMoreUrl, params: {});
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
    notifyListeners();
  }
}
