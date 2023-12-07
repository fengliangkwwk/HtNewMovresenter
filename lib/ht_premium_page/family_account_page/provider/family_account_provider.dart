import 'package:ht_new_movpresenter/ht_premium_page/family_account_page/provider/family_account_provider_base.dart';
import 'package:ht_new_movpresenter/ht_premium_page/family_account_page/provider/family_account_provider_mixin.dart';

class FamilyAccountProvider extends FamilyAccountProviderBase
    with FamilyAccountProviderMixin {
  ///逻辑处理
  Future<void> loadData() async {
    await requestFamilyAccountApi();
  }
}
