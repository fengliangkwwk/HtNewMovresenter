import 'package:dio/dio.dart';
import 'package:ht_new_movpresenter/utils/ui_utils.dart';
import 'package:dio/io.dart';

class HTNetUtils {
  void initAdapter() {}

  static Future<Response<dynamic>?> htPost({
    required String apiUrl,
    Map<String, dynamic>? params,
    bool? needCommon = true,
  }) async {
    Map<String, dynamic> htVarparams = {};
    htVarparams.addAll(params ?? {});
    if (needCommon == true) {
      await KTClassUIUtils.htMethodPutRequestCommonParams(htVarparams);
    }
    var formData = FormData.fromMap(htVarparams);
    var dio = Dio();

   //设置代理
    dio.httpClientAdapter = IOHttpClientAdapter()
      ..onHttpClientCreate = (client) {
        client.findProxy = (uri) {
          return 'PROXY 192.168.18.210:8888';
        };
        return client;
      };

    var res = await dio.post(
      apiUrl,
      data: formData,
    );
    return res;
  }

  static Future<Response<dynamic>?> htGet({
    required String apiUrl,
    Map<String, dynamic>? params,
    bool? needCommon = true,
  }) async {
    Map<String, dynamic> htVarparams = {};
    htVarparams.addAll(params ?? {});
    if (needCommon == true) {
      await KTClassUIUtils.htMethodPutRequestCommonParams(htVarparams);
    }
    // var formData = FormData.fromMap(htVarparams);
    var dio = Dio();
    var res = await dio.get(
      apiUrl,
      queryParameters: htVarparams,
    );
    return res;
  }
}
