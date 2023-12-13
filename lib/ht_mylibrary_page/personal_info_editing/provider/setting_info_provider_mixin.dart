import 'package:ht_new_movpresenter/ht_mylibrary_page/personal_info_editing/provider/setting_info_provider_base.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_api.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_net_utils.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';

mixin SettingInfoProviderMixin on SettingInfoProviderBase {
  //编辑头像
  Future<void> setPersonData({
    String? name,
    String? birth,
    String? gender,
    String? faceflag,
    String? face,
  }) async {
    var res = HTNetUtils.htPost(apiUrl: Global.updateInfoUrl, params: {
      ///用户ID
      "uid": HTUserStore.userBean?.uid??"3159306",

      ///昵称
      "name": name,

      ///生日
      "birth": birth,

      ///性别：1男，2女，-1其他
      "gender": gender,

      ///头像：1修改，0不修改
      "faceflag": faceflag,

      ///用户头像，本地图片转data上传
      "face": face,
    });
  }

  //编辑姓名
  Future<void> setPersonName() async {}
  //编辑性别
  Future<void> setPersonSex() async {}
  //编辑年龄
  Future<void> setPersonAge() async {}
}
