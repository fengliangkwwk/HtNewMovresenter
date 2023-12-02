

import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/bean/ht_share_bean.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_api.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_net_utils.dart';

class OtherRequest{
  HTShareBean? shareBean;
///分享
// p1:订阅ProductID
// p2:订阅状态：0未订阅，1本地订阅，2服务器(账号)订阅
// t1:订阅来源：0未订阅，1影视包订阅，2工具包订阅
// sub1:本地续订状态：0取消续订，1续订
// sub2:服务器(账号)续订状态：0取消续订，1续订
// subid:服务器(账号)订阅来源appid
// VIP时：
// 参数t1来源：接口326/和325/  server-t1
// 参数app_id来源：接口326/和325/  server-t1
// 参数p2来源：接口326/和325/  local-value=1时，传1；其他传2
// 非VIP时，传默认值0
  Future<void> shareRequest()async{
    EasyLoading.show();
    var res = await HTNetUtils.htPost(apiUrl: Global.getShareUrl, params: {
      'p1': 'month',
      'p2': '0',
      't1': '0',
      'sub1': '0',
      'sub2': '0',
      'subid': '0'
    });
    EasyLoading.dismiss();
    Map<String, dynamic> jsonMap = jsonDecode(res?.data ?? '');
    shareBean = HTShareBean.fromJson(jsonMap["data"]);
    print(shareBean?.link);
  }
}