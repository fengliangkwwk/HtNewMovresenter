import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/bean/home_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/providers/ht_home_provider_base.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/providers/ht_home_provider_mixin.dart';
import 'package:ht_new_movpresenter/utils/ht_shared_keys.dart';
import 'package:ht_new_movpresenter/utils/ht_user_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

///数据逻辑
class HTHomeProvider extends HTHomeProviderBase with HTHomeProviderMixin {
  Future<void> loadData() async {
    EasyLoading.show(status: 'loading...');
    apiRequest();
  }

  ///下拉刷新
  void onRefresh() {
    EasyLoading.show();
    loading = true;
    page = 1;
    droppingWaterPage = 1;
    notifyListeners();
    apiRequest(refresh: false);
  }

  ///上拉加载
  void onLoad() async {
    EasyLoading.show(status: 'loading...');
    page++;
    loading = true;
    notifyListeners();
    apiRequest();
    print('上拉加载');
  }

  ///点击more
  void onTapMoreAction(DataList data) async {
    selectData = data;
    notifyListeners();

    ///1.请求更多接口
    await moreNet(data: data);
  }

  ///点击Hidden
  void hiddenAction(DataList data) async {
    HTUserStore.list18.add(data.playListId ?? '');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(HTSharedKeys.htHomeHideKey, HTUserStore.list18);
    loading = !loading;
    notifyListeners();
  }
}
