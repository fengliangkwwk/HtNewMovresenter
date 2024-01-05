import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_api.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_net_utils.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:ht_new_movpresenter/utils/tools/toast_tool.dart';

class AddMemberPageProvider extends ChangeNotifier {
  Future<bool> requestAddMemberApi({required String mail}) async {
    if (mail.isEmpty) {
      // Please enter your advice
      ToastUtil.showToast(msg: 'Please Enter email address');
    } else {
      EasyLoading.show();
      var res = await HTNetUtils.htPost(
        apiUrl: Global.addFamilyMembersUrl,
        params: {"fid": HTUserStore.vipInfoBean?.family?.fid, "mail": mail},
      );
      EasyLoading.dismiss();
      var json = jsonDecode(res?.data);
      int status = json['status'];
      String msg = json['msg'];
      int remain = json['remain'];
      if (status == 200 && remain > 0) {
        return true;
      } else {
        ToastUtil.showToast(msg: msg);
        return true;
      }

      // familyAccountBean = FamilyAccountBean.fromJson(json);
      // var _dataList = <Data>[];
      // print("---------" + res?.data);
      // if (json['status'] == 200) {
      //   for (Map<String, dynamic> element in json?['data'] ?? []) {
      //     _dataList.add(Data.fromJson(element));
      //   }
      //   familyAccountBean?.data = _dataList;
      // } else {
      //   ToastUtil.showToast(msg: familyAccountBean?.msg ?? "");

      /*
    * status状态判断
    * 200添加成功：remain=0时toast提示Family members reached the upper limit；remain>0时toast提示Added successfully
    * 300账号不存在：toast提示The account does not exist
    * 301账号已存在：toast提示The user already exists
    * 302账号已加入其他家庭：toast提示The user has already joined another family plan
    * 304添加成功(弹出分享弹窗)：分享title：Added successfully。分享msg：remain=0时Family members reached the upper limit；remain>0时Please ask your family to install this app and log in to an account with \(remain剩余人数) on the Mylibrary page.
    */
      // "status": 200,
      // "msg": "success",
      // "data": [],// 无用
      // "cur_cnts": 2,// 当前已添加人数
      // "remain": 3// 剩余可添加人数
    }
    return false;
  }
}
