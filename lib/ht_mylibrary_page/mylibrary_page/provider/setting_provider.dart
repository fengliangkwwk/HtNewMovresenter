import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/bean/user_bean.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/provider/setting_provider_mixin.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/provider/settting_provider_base.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/view/login_page.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_shared_keys.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

///处理逻辑  model
class SettingProvider extends SettingProviderBase with SettingProviderMixin {
  Future<void> loadData() async {
    await api1Net();
  }

  // 去登录
  void goLogin(BuildContext context) async {
    if (HTUserStore.login()) {
      ///1. 已登录
      await Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginPage(isLoginPage: false);
      }));
    } else {
      ///2. 未登录 -> 去登录
      await Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginPage(isLoginPage: true);
      }));
    }
  }

  ///保存/更新用户信息
  void saveUserInfo(Map userInfoMap) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    HTUserStore.userBean ??= UserBean();
    if (userInfoMap["app_id"] != null) {
      HTUserStore.userBean?.appid = userInfoMap["app_id"];
    }
    if (userInfoMap["fid"] != null) {
      HTUserStore.userBean?.fid = userInfoMap["fid"];
    }
    if (userInfoMap["master"] != null) {
      HTUserStore.userBean?.master = userInfoMap["master"];
    }
    if (userInfoMap["val"] != null) {
      HTUserStore.userBean?.val = userInfoMap["val"];
    }
    if (userInfoMap["pid"] != null) {
      HTUserStore.userBean?.pid = userInfoMap["pid"];
    }
    if (userInfoMap["fav_plid"] != null) {
      HTUserStore.userBean?.favplid = userInfoMap["fav_plid"];
    }
    if (userInfoMap["s1"] != null) {
      HTUserStore.userBean?.s1 = userInfoMap["s1"];
    }

    if (userInfoMap["phone"] != null) {
      HTUserStore.userBean?.phone = userInfoMap["phone"];
    }
    if (userInfoMap["email"] != null) {
      HTUserStore.userBean?.email = userInfoMap["email"];
    }
    if (userInfoMap["user_name"] != null) {
      HTUserStore.userBean?.userName = userInfoMap["user_name"];
    }
    if (userInfoMap["user_face"] != null) {
      HTUserStore.userBean?.userFace = userInfoMap["user_face"];
    }
    if (userInfoMap["user_gender"] != null) {
      HTUserStore.userBean?.userGender = userInfoMap["user_gender"];
    }
    if (userInfoMap["uid"] != null) {
      HTUserStore.userBean?.uid = userInfoMap["uid"];
    }
    if (userInfoMap["user_birth"] != null) {
      HTUserStore.userBean?.userBirth = userInfoMap["user_birth"];
    }
    if (userInfoMap["user_issync2"] != null) {
      HTUserStore.userBean?.userIssync2 = userInfoMap["user_issync2"];
    }
    if (userInfoMap["msync"] != null) {
      HTUserStore.userBean?.msync = userInfoMap["msync"];
    }
    prefs.setString(HTSharedKeys.htPersonMesaage,
        jsonEncode(HTUserStore.userBean?.toJson()));
    userBean = HTUserStore.userBean;
    isReloadHeader = !isReloadHeader;
    notifyListeners();
  }

  ///退出登录清空下用户数据刷新状态
  void logOutClearUserInfo() async {
    UserBean nullUserBean = UserBean();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(HTSharedKeys.htPersonMesaage);
    // prefs.clear();
    userBean = nullUserBean;
    HTUserStore.userBean = nullUserBean;
    isReloadHeader = !isReloadHeader;
    notifyListeners();
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }
}
