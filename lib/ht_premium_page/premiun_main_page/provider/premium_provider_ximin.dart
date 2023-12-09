import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/bean/ht_premium_bean.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/bean/vip_info_bean.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/provider/premium_provider_base.dart';
import 'package:ht_new_movpresenter/provider/main_provider.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_api.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_net_utils.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:ht_new_movpresenter/utils/tools/toast_tool.dart';

mixin PremiumProviderMixin on PremiumProviderBase {
  HTPremiumBean? premiumBean;

  ///校验vip
  Future<void> requesCheckVipApi({
    String? flag,
  }) async {
    var res = await HTNetUtils.htPost(apiUrl: Global.restoreUrl, params: {
      ///家庭id

      'fid': HTUserStore.vipInfoBean?.family?.fid ?? '0',

      ///0 restore  1购买

      'flag': flag ?? '0',

      ///订阅id

      'pid': mainProvider.purChaseProductId(),

      ///支付凭证

      'receipt': mainProvider.verificationList(),

      ///用户id

      'uid': HTUserStore.userBean?.uid ?? '0',

      ///是否本地订阅

      'vp': mainProvider.subscriptionPurchaseState() ? '1' : '0',
    });

    var json = jsonDecode(res?.data);
    if (json["status"] == 200) {
      HTUserStore.vipInfoBean = VipInfoBean.fromJson(json['data']);
      MainPovider.saveVipInfoAction();
    } else {
      ToastUtil.showToast(msg: json["msg"]);
    }
  }

  Future<void> requestPremiumApi() async {
    EasyLoading.show();
    var res = await HTNetUtils.htPost(
      apiUrl: Global.subscriptionBootConfigurationUrl,
      params: {
        ///用户ID，没有传0

        "uid": HTUserStore.userBean?.uid ?? '0',

        ///订阅状态：1VIP，0非VIP

        "p1": "0",
      },
    );
    EasyLoading.dismiss();
    var json = jsonDecode(res?.data);

    if (json["status"] == 200) {
      premiumBean = HTPremiumBean.fromJson(json['data']);
    } else {
      ToastUtil.showToast(msg: json["msg"]);
    }
  }
}
