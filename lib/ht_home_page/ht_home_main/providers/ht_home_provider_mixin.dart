import 'dart:convert';

import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/bean/home_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/providers/ht_home_provider_base.dart';
import 'package:ht_new_movpresenter/utils/ht_api.dart';
import 'package:ht_new_movpresenter/utils/ht_dio_utils.dart';
import 'package:ht_new_movpresenter/utils/ui_utils.dart';
import 'package:dio/dio.dart';

///数据请求
mixin HTHomeProviderMixin on HTHomeProviderBase {
  HomeBean? homeData;

  ///影视首页数据请求
  Future<void> apiRequest() async {
    var page = "1";

    ///页码，从1开始
    var page_size = "20";

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
      "page": page,
      "page_size": page_size,
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
    homeData = HomeBean.fromJson(json['data']['default_set']);
    print('解析数据成功');
    notifyListeners();
  }
}
