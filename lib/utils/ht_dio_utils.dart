///   @ProjectName : ht_new_movpresenter
///   @Author : feng liang
///   @Date   : 2023-11-10 09:20:35
///   @Desc   :

import 'dart:io';
// import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ht_new_movpresenter/utils/ht_api.dart';
import 'package:ht_new_movpresenter/utils/ht_base_res.dart';
import 'package:ht_new_movpresenter/utils/ht_dio_intercept.dart' as interceptor;
import 'package:ht_new_movpresenter/utils/ht_dio_wrapper.dart';
import 'package:ht_new_movpresenter/utils/url_domain.dart';
import 'package:ht_new_movpresenter/utils/ui_utils.dart';

class HttpUtils {
  static final HttpUtils _instance = HttpUtils._();

  static HttpUtils get instance => HttpUtils();

  factory HttpUtils() => _instance;
  static late Dio _dio;
  Dio get dio => _dio;
  Duration duration = const Duration(seconds: 5);

  HttpUtils._() {
    // 构造 Dio options
    final BaseOptions options = BaseOptions(
      connectTimeout: duration,
      receiveTimeout: duration,
      sendTimeout: duration,
      responseType: ResponseType.plain,
      validateStatus: (_) => true,
      baseUrl: HTReqestDomainClass.htRequestDomain,
    );
    // 实例化 Dio
    _dio = Dio(options);
    // 忽略 https 证书校验
//     if(_dio.httpClientAdapter is BrowserHttpClientAdapter){
// //do your code
//     } else {
// //do something else
//     }
//     (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
//       client.badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//       return client;
//     };
    // 添加迭代器
    _dio.interceptors.add(interceptor.AuthInterceptor());
    if (kDebugMode) {
      _dio.interceptors.add(interceptor.LogInterceptor());
    }
  }

  Future<BaseResponse> _request(
    String url, {
    String? method = 'POST',
    dynamic params,
    bool tips = false,

    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    late BaseResponse response;
    try {
      if (tips) {
        // 展示 loading
      }
      late Response<dynamic> res;
      if (method == 'GET') {
        res = await _dio.get(url, queryParameters: params);
      } else if (method == 'UPLOAD') {
        FormData formData = FormData.fromMap(params);
        res = await _dio.post(
          url,
          data: formData,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        );
      } else {
        res = await _dio.post(
          url,
          data: params,
        );
      }
      response = DioWrapper.responseWrapper(res);
    } catch (e) {
      response = DioWrapper.errorWrapper(e);
    } finally {
      // 隐藏 loading
    }
    return response;
  }

  // GET
  Future<BaseResponse> get(
    String url, {
    dynamic params,
    bool tips = false,
  }) async {
    return _request(
      url,
      method: 'GET',
      params: params,
      tips: tips,
    );
  }

  // POST
  Future<BaseResponse> post(
  String url, {
    dynamic params,
    bool tips = false,
  }) async {
    return _request(
      url,
      method: 'POST',
      params: params,
      tips: tips,
    );
  }

  // UPLOAD
  Future<BaseResponse> upload(
    String url, {
    dynamic params,
    bool tips = false,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _request(
      url,
      method: 'UPLOAD',
      params: params,
      tips: tips,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
