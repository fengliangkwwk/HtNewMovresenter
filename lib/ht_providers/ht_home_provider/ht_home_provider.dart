
import 'package:ht_new_movpresenter/ht_providers/ht_home_provider/ht_home_provider_base.dart';
import 'package:ht_new_movpresenter/ht_providers/ht_home_provider/ht_home_provider_mixin.dart';

  var res;
///数据逻辑
class HTHomeProvider extends HTHomeProviderBase with HTHomeProviderMixin {
  Future<void> loadData() async {
    apiRequest();
  }
}
