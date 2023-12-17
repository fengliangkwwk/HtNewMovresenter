import 'dart:convert';

import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/bean/user_bean.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/provider/settting_provider_base.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/bean/ht_premium_bean.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_api.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_net_utils.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';

///请求逻辑
///(获取用户信息)115
mixin SettingProviderMixin on SettingProviderBase {
  Future<void> api1Net() async {
    var res = await HTNetUtils.htPost(apiUrl: Global.getInfoOrLogin, params: {
      ///用户ID
      "uid": HTUserStore.userBean?.uid ?? "3159306",
      "p1": "",
    });
    Map<String, dynamic> jsonMap = jsonDecode(res?.data.toString() ?? '');
    HTUserStore.userBean = UserBean.fromJson(jsonMap['data']);
    isReloadHeader = !isReloadHeader;
    notifyListeners();
  }



// ///订阅引导等相关配置300
//   Future<void> requestPremiumApi() async {
//     var res = await HTNetUtils.htPost(
//       apiUrl: Global.subscriptionBootConfigurationUrl,
//       params: {
//         ///用户ID，没有传0
//         "uid": HTUserStore.userBean?.uid ?? '0',
//         ///订阅状态：1VIP，0非VIP
//         "p1": "0",
//       },
//     );
//     var json = jsonDecode(res?.data);
//     // var json = res?.data;
//     if (json["status"] == 200) {
//       HTUserStore.premiumBean = HTPremiumBean.fromJson(json['data']);
//     } 
  // }










}
