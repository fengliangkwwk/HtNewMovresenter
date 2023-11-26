import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/providers/ht_home_provider_base.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/providers/ht_home_provider_mixin.dart';


///数据逻辑
class HTHomeProvider extends HTHomeProviderBase with HTHomeProviderMixin {
  Future<void> loadData() async {
    EasyLoading.show(status: 'loading...');

    await apiRequest();

    EasyLoading.dismiss();
  }

  ///下拉刷新
  void onRefresh() {
    loading = true;
    page = 1;
    droppingWaterPage = 1;
    notifyListeners();
    apiRequest(refresh: false);
  }

  ///上拉加载
  void onLoad() async {
    page++;
    loading = true;
    notifyListeners();
    apiRequest();
    print('上拉加载');
  }
}
