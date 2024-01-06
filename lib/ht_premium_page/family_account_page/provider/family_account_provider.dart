import 'package:ht_new_movpresenter/ht_premium_page/family_account_page/provider/family_account_provider_base.dart';
import 'package:ht_new_movpresenter/ht_premium_page/family_account_page/provider/family_account_provider_mixin.dart';

class FamilyAccountProvider extends FamilyAccountProviderBase
    with FamilyAccountProviderMixin {
  ///家庭成员列表
  Future<void> loadData() async {
    await requestFamilyAccountApi();
  }

  ///解散家庭
  Future<void> dissolveFamilyApi() async {
    bool isSuccess = await dissolveFamily();
    if (isSuccess) {
      loadData();
    }
  }
  ///删除退出家庭成员deleteExitFamilyMemberUrl
  Future<void> deleteFamilyMemberApi(String hostMail) async {
    bool isSuccess = await deleteFamilyMember(hostMail);
    if (isSuccess) {
      loadData();
    }
  }
}
