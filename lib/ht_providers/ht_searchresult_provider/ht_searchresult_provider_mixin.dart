import 'package:ht_new_movpresenter/ht_providers/ht_searchresult_provider/ht_searchresult_provider_base.dart';
import 'package:ht_new_movpresenter/utils/ht_api.dart';
import 'package:ht_new_movpresenter/utils/ui_utils.dart';
import 'package:dio/dio.dart'as SeaerchResult;
mixin HTSearchResultProviderMiXin on HTSearchResultProviderBase{
  /**
   * v_type:固定传 0
   * page_size：每页数量  24
   * page：页码 从 1 开始
   * keyword：搜索关键字
   */
  Future <void> searchReasultRequestApi(String keyword,String page,String page_size,String v_type)async
  {
Map<String,dynamic>htVarparams = {"keyword":keyword,"page":page,"page_size":page_size,"v_type":v_type};
await KTClassUIUtils.htMethodPutRequestCommonParams(htVarparams);
var formData = SeaerchResult.FormData.fromMap(htVarparams);
var dio = SeaerchResult.Dio();
    var res = await dio.post(
    Global.searchUrl,
    data: formData,
    );
   print(res);
  }
}