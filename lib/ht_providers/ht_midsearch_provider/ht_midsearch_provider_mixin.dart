import 'package:ht_new_movpresenter/ht_providers/ht_midsearch_provider/ht_midsearch_provider_base.dart';
import 'package:ht_new_movpresenter/utils/ht_api.dart';
import 'package:ht_new_movpresenter/utils/ht_dio_utils.dart';
import 'package:ht_new_movpresenter/utils/ui_utils.dart';
import 'package:dio/dio.dart'as MidSearch;
mixin HTMidSearchProviderMiXin on HTMidSearchProviderBase{
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
 }
}