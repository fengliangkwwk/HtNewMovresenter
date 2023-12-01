import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/feed_back/provider/feed_back_provider_base.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_api.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_net_utils.dart';
import 'package:ht_new_movpresenter/utils/tools/toast_tool.dart';

mixin FeedBackProviderMiXin on FeedBackProviderBase {
  ///数据请求接口你
  Future<void> requestSubmitApi(
      {required String content,
      required String mail,
      String? vid = '0', //电影或电视剧ID（没有传0）
      String? sid = '0', //电视剧季ID（没有传0）
      String? eid = '0' //电视剧集ID（没有传0）
      }) async {
    EasyLoading.show();
    var res = await HTNetUtils.htPost(
      apiUrl: Global.feedbackUrl,
      params: {
        'content': content,
        'mail': mail,
        'vid': vid,
        'sid': sid,
        'eid': eid
      },
    );
    EasyLoading.dismiss();
    var json = jsonDecode(res?.data);
    if (json['status'] == 200) {
      // Submitted successfully
      ToastUtil.showToast(msg: 'Submitted successfully');
    } else {
      // Submit failed.
      ToastUtil.showToast(msg: 'Submit failed.');
    }
  }
}
