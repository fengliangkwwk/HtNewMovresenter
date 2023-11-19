


  import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/providers/ht_home_provider_base.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/providers/ht_home_provider_mixin.dart';

var res;
///数据逻辑
class HTHomeProvider extends HTHomeProviderBase with HTHomeProviderMixin {
  Future<void> loadData() async {
    apiRequest();
  }

  ///下拉刷新
void onRefresh() {
  page = 1;
  dataList = [];
  droppingWaterDataList = [];
  droppingWaterPage = 1;
  apiRequest();
}


  ///上拉加载
  void onLoad() async{
      page ++;
      apiRequest();
  }
}
