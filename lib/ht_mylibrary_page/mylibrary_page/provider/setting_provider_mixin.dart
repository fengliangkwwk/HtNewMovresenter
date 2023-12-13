import 'dart:convert';

import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/bean/user_bean.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/provider/settting_provider_base.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_api.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_net_utils.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';

///请求逻辑
mixin SettingProviderMixin on SettingProviderBase {
  Future<void> api1Net() async {
    var res = await HTNetUtils.htPost(apiUrl: Global.getInfoOrLogin, params: {
      ///用户ID
      "uid": HTUserStore.userBean?.uid ?? "3159306",
      "p1": "",
    });
    Map<String, dynamic> jsonMap = jsonDecode(res?.data.toString() ?? '');
    userBean = UserBean.fromJson(jsonMap);
    isReloadHeader = !isReloadHeader;
    notifyListeners();
  }
}
