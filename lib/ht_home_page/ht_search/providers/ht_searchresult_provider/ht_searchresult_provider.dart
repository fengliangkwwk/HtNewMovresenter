import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/providers/ht_midsearch_provider/ht_midsearch_provider.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/providers/ht_searchresult_provider/ht_searchresult_provider_base.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/providers/ht_searchresult_provider/ht_searchresult_provider_mixin.dart';
import 'package:dio/dio.dart' as search_result_dio;
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_shared_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HTSearchResultProvider extends HTSearchResultProviderBase
    with HTSearchResultProviderMiXin {
  Future<void> loadSearchResulrData(String? word) async {
    initData(word);
    searchReasultRequestApi();
  }

  void initData(String? word) {
    keyword = word;
  }

  void onLoading() {
    page++;
    searchReasultRequestApi();
  }

  void onRefresh() {
    page = 1;
    searchReasultRequestApi(isRefresh: true);
  }

  ///搜索提交
  void onSubmitted(String value) async {
    if (value.isEmpty) return;
    searchDataList.add(value);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(HTSharedKeys.htSearch, searchDataList);
    HTMidSearchProvider().searchHistoty = true;
    notifyListeners();
  }

  ///删除输入框
  void deleteInput(BuildContext context, FocusNode? node) {
    htVarFieldController.text = '';
    FocusScope.of(context).requestFocus(node);
    searchResult = [];
    notifyListeners();
  }

  ///谷歌搜索联想词api
  void onChanged(String value) async {
    EasyLoading.show();
    if (value.isEmpty) return;
    var dio = search_result_dio.Dio();
    var res = await dio.get(
        'https://suggestqueries.google.com/complete/search?client=youtube&q=$value');

    String data = res.data;
    data = data.replaceAll('window.google.ac.h(', '');
    data = data.replaceAll(')', '');
    var json = jsonDecode(data);
    searchResult = json;
    EasyLoading.dismiss();
    notifyListeners();
    if (kDebugMode) {
      print('联想数据: $searchResult');
    }
  }
}
