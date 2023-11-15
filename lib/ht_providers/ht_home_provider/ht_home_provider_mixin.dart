import 'package:ht_new_movpresenter/ht_providers/ht_home_provider/ht_home_provider_base.dart';
import 'package:ht_new_movpresenter/utils/ht_api.dart';
import 'package:ht_new_movpresenter/utils/ht_dio_utils.dart';
import 'package:ht_new_movpresenter/utils/ui_utils.dart';
import 'package:ht_new_movpresenter/view/setting/provider/settting_provider_base.dart';
import 'package:dio/dio.dart';

///数据请求
mixin HTHomeProviderMixin  on HTHomeProviderBase {
  var homeData;
  ///影视首页数据请求
   Future<void> apiRequest() async {
     var page = "1";///页码，从1开始
     var page_size = "20";///分页大小
     var p1 = "0";///接口版本；默认传0，传2时结合datetag会返内容推荐
     var datetag = "20230328";///yyyyMMdd，东八区-北京时间，值为安装时间
     var id = "35140";///猜你喜欢电影ID，不传时无对应模块信息
    // var dio = Dio();
    // Map<String, dynamic> htVarparams = {"page": page,"page_size":page_size,"p1":p1,"datetag":datetag,"id":id};
    // await KTClassUIUtils.htMethodPutRequestCommonParams(htVarparams);
    // var formData = FormData.fromMap(htVarparams);
    // var response = await dio.post(
    // Global.homePageUrl,
    // data: formData,
    // );
    Map<String, dynamic> htVarparams = {"page": page,"page_size":page_size,"p1":p1,"datetag":datetag,"id":id};
    await KTClassUIUtils.htMethodPutRequestCommonParams(htVarparams);
    var formData = FormData.fromMap(htVarparams);
    // ignore: avoid_print
    var res = await HttpUtils.instance.post(
      Global.homePageUrl,
      params: formData,
      tips: true,
    );
    print(res.data["default_set"]['data']);

    // Map<String, dynamic> map = res.decode(res);
    // String jsonString = map.encode(map);

    // homeData = res.data.remove("dated_new");

    homeData = res.data["default_set"]['data'];
   }
}