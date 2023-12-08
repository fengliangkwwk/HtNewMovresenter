import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/bean/ht_premium_bean.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/provider/premium_provider_base.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_api.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_net_utils.dart';
import 'package:ht_new_movpresenter/utils/tools/toast_tool.dart';

mixin PremiumProviderMixin on PremiumProviderBase {
  HTPremiumBean? premiumBean;
  Future<void> requestPremiumApi() async {
    EasyLoading.show();
    var res = await HTNetUtils.htPost(
      apiUrl: Global.subscriptionBootConfigurationUrl,
      params: {
        "uid": "0",

        ///用户ID，没有传0
        "p1": "0",

        ///订阅状态：1VIP，0非VIP
      },
    );
    EasyLoading.dismiss();
    var json = jsonDecode(res?.data);

    if (json["status"] == 200) {
      premiumBean = HTPremiumBean.fromJson(json);
    }else{
      ToastUtil.showToast(msg: json["msg"]);
    }
  }
}
