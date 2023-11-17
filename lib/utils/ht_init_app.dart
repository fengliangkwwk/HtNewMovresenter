import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/beans/user_bean.dart';
import 'package:ht_new_movpresenter/utils/ht_shared_keys.dart';
import 'package:ht_new_movpresenter/utils/ht_user_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await userData();
}
///1. 判断是否登录 2.用户信息

Future<void> userData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var userString = prefs.getString(HTSharedKeys.htPersonMesaage);
  if (userString != null) {
    HTUserStore.userBean = UserBean.fromJson(jsonDecode(userString));
  }
}

