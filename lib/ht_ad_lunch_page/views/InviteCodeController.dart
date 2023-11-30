import 'dart:convert';

import 'package:ht_new_movpresenter/ht_ad_lunch_page/beans/invite_code_bean.dart';
import 'package:ht_new_movpresenter/utils/ht_api.dart';
import 'package:ht_new_movpresenter/utils/ht_net_utils.dart';
import 'dart:convert' as convert;
import 'package:ht_new_movpresenter/utils/ui_utils.dart';
class InviteCodeController {
  InviteCodeBean?  inviteCodeBean;
  Future<InviteCodeBean?> getInviteCode(String code) async {
    var res = await HTNetUtils.htPost(apiUrl: Global.invitationCode, params: {
      'sig': code,
    });
    Map<String, dynamic> jsonMap = jsonDecode(res?.data ?? '');
    inviteCodeBean = InviteCodeBean.fromJson(jsonMap["data"]);
    return inviteCodeBean;
  }
}
