import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/providers/ht_midsearch_provider/ht_midsearch_provider_base.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/providers/ht_midsearch_provider/ht_midsearch_provider_mixin.dart';
import 'package:ht_new_movpresenter/utils/ht_shared_keys.dart';
import 'package:ht_new_movpresenter/utils/ui_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as Dio;

class HTMidSearchProvider extends HTMidSearchProviderBase
    with HTMidSearchProviderMiXin {
/**
 * type  5.All; 1.Movies; 2.TV Shows; 3.Animated Series; 4.Animation Movies
 */
  var type = '5';
  Future<void> loadData() async {
    //1.请求数据,并且刷新
    await apiRequest(type);

    await searchData();
  }

  ///获取本地的搜索历史记录
  Future<void> searchData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    searchDataList = prefs.getStringList(HTSharedKeys.htSearch) ?? [];
    if (searchDataList.isNotEmpty) {
      searchHistoty = true;
    }
    notifyListeners();
  }

  ///搜索提交
  void onSubmitted(String value) async {
    if (value.isEmpty) return;
    searchDataList.add(value);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(HTSharedKeys.htSearch, searchDataList);
    searchHistoty = true;
    notifyListeners();
  }

  ///删除历史记录
  void deleteHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(HTSharedKeys.htSearch);
    searchDataList = [];
    searchHistoty = false;
    notifyListeners();
  }

  ///删除输入框
  void deleteInput(BuildContext context, FocusNode? node) {
    htVarFieldController.text = '';
    FocusScope.of(context).requestFocus(node);
    searchResult = [];
    notifyListeners();
  }

  void onChanged(String value) async {
    if (value.isEmpty) return;
    var dio = Dio.Dio();
    var res = await dio.get(
        'https://suggestqueries.google.com/complete/search?client=youtube&q=$value');

    String data = res.data;
    data = data.replaceAll('window.google.ac.h(', '');
    data = data.replaceAll(')', '');
    var json = jsonDecode(data);

    searchResult = json;

    notifyListeners();
    print('联想数据: $searchResult');
  }
}
