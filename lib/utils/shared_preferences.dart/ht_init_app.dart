import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/favorite_list/bean/history_bean.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/bean/user_bean.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/bean/vip_info_bean.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_shared_keys.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:in_app_purchase/in_app_purchase.dart';




Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await userData();
  


}


  ///获取订阅状态
  




///1. 判断是否登录 2.用户信息 3.是否禁止 18+ 4.是否首次进入app

Future<void> userData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var list18 = prefs.getStringList(HTSharedKeys.htHomeHideKey);
  HTUserStore.list18 = list18 ?? [];

  var userString = prefs.getString(HTSharedKeys.htPersonMesaage);
  if (userString != null) {
    HTUserStore.userBean = UserBean.fromJson(jsonDecode(userString));
  }

  bool? isFirstInto = prefs.getBool(HTSharedKeys.isFirstInto);
  HTUserStore.isFirstInto = isFirstInto ?? true;

  ///收藏数据
  var favoriteListString = prefs.getString(HTSharedKeys.favoriteList);
  if (favoriteListString != null) {
    List favoriteList = jsonDecode(favoriteListString);
    for (var element in favoriteList) {
      HTUserStore.favoriteList.add(HistoryBean.fromJson(element));
    }
  }

  ///浏览历史
  var historyListString = prefs.getString(HTSharedKeys.historyList);
  if (historyListString != null) {
    List favoriteList = jsonDecode(historyListString);
    for (var element in favoriteList) {
      HTUserStore.historyList.add(HistoryBean.fromJson(element));
    }
  }

  ///vip信息
  var vipInfoString = prefs.getString(HTSharedKeys.htVipMesaage);
  if (vipInfoString != null) {
    HTUserStore.vipInfoBean = VipInfoBean.fromJson(jsonDecode(vipInfoString));
  }
}
