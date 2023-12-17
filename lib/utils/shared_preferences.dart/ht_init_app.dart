import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/favorite_list/bean/history_bean.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/bean/user_bean.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/bean/vip_info_bean.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_shared_keys.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await userData();
  // 强制竖屏
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  WidgetsFlutterBinding.ensureInitialized();
}

///获取订阅状态
///1. 判断是否登录 2.用户信息 3.是否禁止 18+ 4.是否首次进入app
Future<void> userData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var list18 = prefs.getStringList(HTSharedKeys.htHomeHideKey);
  HTUserStore.list18 = list18 ?? [];

  HTUserStore.userBean ??= UserBean();
  var userString = prefs.getString(HTSharedKeys.htPersonMesaage);
  if (userString != null) {
    HTUserStore.userBean = UserBean.fromJson(jsonDecode(userString));
  }

  ///是否第一次进入 app
  bool? isFirstInto = prefs.getBool(HTSharedKeys.isFirstInto);
  HTUserStore.isFirstInto = isFirstInto ?? true;

  ///订阅页面点击支付之后的弹窗是否超过三次
  int? popUps = prefs.getInt(HTSharedKeys.popUps);
  HTUserStore.popUps = popUps ?? 0;

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
