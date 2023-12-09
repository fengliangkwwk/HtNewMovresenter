import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/provider/premium_provider_base.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/provider/premium_provider_ximin.dart';

class PremiumProvider extends PremiumProviderBase with PremiumProviderMixin {
///数据请求
Future<void> loadData()async{
  await requesCheckVipApi();
  await requestPremiumApi();
  notifyListeners();
}
  ///点击家庭订阅和个人订阅
  void clickIndividualOrFamily(int index) {
    print('====================${index}');
    isFamilyOrIndividual = index;
    notifyListeners();
  }
}
