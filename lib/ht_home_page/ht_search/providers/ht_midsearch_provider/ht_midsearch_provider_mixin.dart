import 'dart:math';

import 'package:ht_new_movpresenter/ht_home_page/ht_search/beans/ht_mid_search_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/providers/ht_midsearch_provider/ht_midsearch_provider_base.dart';
import 'package:ht_new_movpresenter/utils/ht_api.dart';
import 'package:ht_new_movpresenter/utils/ht_dio_utils.dart';
import 'package:ht_new_movpresenter/utils/ui_utils.dart';
import 'package:dio/dio.dart'as MidSearch;
import "dart:convert";

mixin HTMidSearchProviderMiXin on HTMidSearchProviderBase{
///ht_mid_search_bean
ht_mid_search_bean?midSearchBean;
Future<void> apiRequest (String type) async{
/**
 * type  5.All; 1.Movies; 2.TV Shows; 3.Animated Series; 4.Animation Movies
 */
Map<String,dynamic>htVarparams = {"type":type};
await KTClassUIUtils.htMethodPutRequestCommonParams(htVarparams);
var formData = MidSearch.FormData.fromMap(htVarparams);
var dio = MidSearch.Dio();
    var res = await dio.post(
    Global.midSearchUrl,
    data: formData,
    );
    print(res);  
    // res.data.forEach((item){
    //  midSearchBean = ht_mid_search_bean.fromJson(item);
    // });
    // midSearchBean = ht_mid_search_bean.fromJson(res);

    Map map = jsonDecode(res.toString());
    Map<String, dynamic> stringMap = map.map((key, value) => MapEntry(key.toString(), value));
    midSearchBean = ht_mid_search_bean.fromJson(stringMap);
    print(midSearchBean);
 }
}