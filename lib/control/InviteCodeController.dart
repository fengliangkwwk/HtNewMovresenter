import 'package:ht_new_movpresenter/bean/invite_code_bean.dart';
import 'package:dio/dio.dart';
import 'package:ht_new_movpresenter/utils/ht_api.dart';
import 'dart:convert' as convert;

import 'package:ht_new_movpresenter/utils/ui_utils.dart';

class InviteCodeController {
  Future<InviteCodeBean?> getInviteCode(String code) async {
    var dio = Dio();
    Map<String, dynamic> htVarparams = {"sig": code};
    await KTClassUIUtils.htMethodPutRequestCommonParams(htVarparams);
    var formData = FormData.fromMap(htVarparams);
    var response = await dio.post(
      Global.invitationCode,
      data: formData,
    );
    var result;

    result = InviteCodeBean.fromJson({
      "resolution":"100"
    });

    return result;
  }
}
