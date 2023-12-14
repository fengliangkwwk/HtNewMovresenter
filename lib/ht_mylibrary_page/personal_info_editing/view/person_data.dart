import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/bean/user_bean.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_api.dart';
import 'package:ht_new_movpresenter/utils/net_request/ui_utils.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_shared_keys.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PersonDataWidget extends StatefulWidget {
  const PersonDataWidget({Key? key}) : super(key: key);

  @override
  State<PersonDataWidget> createState() => _PersonDataWidgetState();
}

class _PersonDataWidgetState extends State<PersonDataWidget> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            EasyLoading.show();
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            EasyLoading.dismiss();
            //.app 给 web 发消息，采用的是 js 注入的方法，方法名：getNativeParam
            controller.runJavaScript('userInfoWebUrl("name":"zz")');

            controller.addJavaScriptChannel(
              "iOS",
              onMessageReceived: (p0) {
                print(p0.message);
                // flutter: {"loginType":6,"data":{"user_name":"Jackyyuuuu","user_birth":"2020-02-02","user_gender":2,"gender":2}}

                if (p0.message.isEmpty) {
                  return;
                }
                var infoMap = jsonDecode(p0.message);
                if (infoMap['loginType'] == 16) {
                  ///退出页面
                  Navigator.of(context).pop();
                }
                if (infoMap['loginType'] == 6 || infoMap['loginType'] == 10) {
                  //6:save按钮   10：弹出窗的确认按钮
                  var res = jsonDecode(infoMap["data"]);
                  savePersonData(res);
                }
                 if (infoMap['loginType'] == 12) {
                  ///弹出窗的cancel按钮
                  // Navigator.of(context).pop();
                }
              },
            );
          },
          onWebResourceError: (WebResourceError error) {
            EasyLoading.dismiss();
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    loadWeb();
    // ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  void loadWeb() async {
    var params = <String, dynamic>{"uid": HTUserStore.userBean?.uid};
    await KTClassUIUtils.htMethodPutRequestCommonParams(params);
    Uri url = Uri.parse(Global.userInfoWebUrl + '?param=' + jsonEncode(params));
    controller.loadRequest(url);
  }

  ///修改成功后保存个人信息
  void savePersonData(dynamic res) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // var res = {
    //   "phone": "1967584653",
    //   "email": "test_lvguorui8718@gmail.com",
    //   "user_name": "Jack",
    //   "user_face": "",
    //   "user_gender": 2,
    //   "uid": "3159306",
    //   "user_birth": "2020-02-02",
    //   "user_issync2": 0,
    //   "msync": 1
    // };
    await prefs.setString(HTSharedKeys.htPersonMesaage, res.toString());
    HTUserStore.userBean = UserBean.fromJson(res);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
