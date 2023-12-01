import 'package:ht_new_movpresenter/ht_mylibrary_page/feed_back/provider/feed_back_provider_base.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/feed_back/provider/feed_back_provider_mixin.dart';
import 'package:ht_new_movpresenter/utils/ht_tools/toast_tool.dart';

class FeedBackProvider extends FeedBackProviderBase with FeedBackProviderMiXin {
  ///业务逻辑
  Future<void> submit(
      {required String content,
      required String email,
      String? vid,
      String? sid,
      String? eid}) async {
    if (content.isEmpty && email.isEmpty) {
      ///Please enter your advice and email address
      ToastUtil.showToast(msg: 'Please enter your advice and email address');
    } else if (content.isEmpty) {
      // Please enter your advice
      ToastUtil.showToast(msg: 'Please enter your advice');
    } else if (email.isEmpty) {
      //Please enter your e-mail
      ToastUtil.showToast(msg: 'Please enter your e-mail');
    } else {
      await requestSubmitApi(content: content, mail: email,vid: vid,sid: sid,eid: eid);
    }
  }
}
