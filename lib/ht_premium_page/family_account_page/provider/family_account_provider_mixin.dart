import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_premium_page/family_account_page/bean/family_account_bean.dart';
import 'package:ht_new_movpresenter/ht_premium_page/family_account_page/provider/family_account_provider_base.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_api.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_net_utils.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:ht_new_movpresenter/utils/tools/toast_tool.dart';

mixin FamilyAccountProviderMixin on FamilyAccountProviderBase {
  Future<void> requestFamilyAccountApi() async {
    EasyLoading.show();
    var res = await HTNetUtils.htPost(
      apiUrl: Global.familyMemberListUrl,
      params: {
        "fid": HTUserStore.vipInfoBean?.family?.fid,
        "uid": HTUserStore.userBean?.uid
      },
    );
    EasyLoading.dismiss();
    var json = jsonDecode(res?.data);
    familyAccountBean = FamilyAccountBean.fromJson(json);
    var _dataList = <Data>[];
    print("---------" + res?.data);
    if (json['status'] == 200) {
      for (Map<String, dynamic> element in json?['data'] ?? []) {
        _dataList.add(Data.fromJson(element));
      }
      familyAccountBean?.data = _dataList;
    } else {
      ToastUtil.showToast(msg: familyAccountBean?.msg ?? "");
    }
    loading = !loading;
    notifyListeners();
// // 读取本地JSON文件并解析
// Future<String> _loadLocalJSON() async {
//   return await rootBundle.loadString('assets/data.json');
// }

// // 解析JSON
// void _parseJSON() async {
//   String jsonString = await _loadLocalJSON();
//   final jsonData = json.decode(jsonString);

//   // 现在你可以根据需要使用jsonData对象了
//   // 例如，访问特定字段:
//   String name = jsonData['msg'];
//   int age = jsonData['status'];

//   // // 或者遍历列表:
//   // List<String> hobbies = List<String>.from(jsonData['hobbies']);

//   // 打印解析结果
//   print('Name: $name');
//   print('Age: $age');
// }
  }

  ///解散家庭接口
  Future<bool> dissolveFamily() async {
    var hostMail = '';
    EasyLoading.show();
    for (var element in familyAccountBean?.data ?? List.empty()) {
      if (element.master == 1) {
        hostMail = element?.mail;
      }
    }
    var res = await HTNetUtils.htPost(
      apiUrl: Global.dissolveFamilyUrl,
      params: {"fid": HTUserStore.vipInfoBean?.family?.fid, "mail": hostMail},
    );
    EasyLoading.dismiss();
    var json = jsonDecode(res?.data);
    // familyAccountBean = FamilyAccountBean.fromJson(json);
    // var _dataList = <Data>[];
    // print("---------" + res?.data);
    ToastUtil.showToast(msg: json['msg']);
    if (json['status'] == 200) {
      return true;
    } else {
      return false;
    }
  }

  ///删除退出家庭成员deleteExitFamilyMemberUrl
  Future<bool> deleteFamilyMember(String hostMail) async {
    EasyLoading.show();
    var res = await HTNetUtils.htPost(
      apiUrl: Global.dissolveFamilyUrl,
      params: {"fid": HTUserStore.vipInfoBean?.family?.fid, "mail": hostMail},
    );
    EasyLoading.dismiss();
    var json = jsonDecode(res?.data);
    // familyAccountBean = FamilyAccountBean.fromJson(json);
    // var _dataList = <Data>[];
    // print("---------" + res?.data);
    ToastUtil.showToast(msg: json['msg']);
    if (json['status'] == 200) {
      return true;
    } else {
      return false;
    }
  }
}
