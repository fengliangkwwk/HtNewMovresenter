///外部的 provider 确保这边进入播放也之后，个人中心历史列表那边可以同步记录
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/provider/main_purchase_provider_mixin.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_shared_keys.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

MainPovider mainProvider = MainPovider()..initInAppPurchase();

class MainPovider extends ChangeNotifier with MainPurchaseProviderMixin {
  ///浏览历史状态
  bool historyRefresh = false;
  void historyRefreshAction() {
    historyRefresh = !historyRefresh;
    notifyListeners();
  }

  ///存储vip
  static Future<void> saveVipInfoAction() async {
    ///vip信息
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var vipInfoString = jsonEncode(HTUserStore.vipInfoBean?.toJson());
    prefs.setString(HTSharedKeys.htVipMesaage, vipInfoString);
  }

  ///是否是vip  1 family -  2 server - 3 local - 4 device,  其他非vip
  ///
  static int isVip() {
    if (HTUserStore.vipInfoBean?.family?.val == '1') {
      return 1;
    }
    if (HTUserStore.vipInfoBean?.server?.val2 == '1') {
      return 2;
    }
    if (HTUserStore.vipInfoBean?.local?.value == 1) {
      return 3;
    }
    if (HTUserStore.vipInfoBean?.device?.val == '1') {
      return 4;
    }
    return -1;
  }
}
