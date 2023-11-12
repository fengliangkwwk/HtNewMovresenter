import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/utils/ht_api.dart';
import 'package:ht_new_movpresenter/utils/ui_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            ///flutter调用js
            controller.runJavaScript('getNativeParam({"name":"zz",})');

            ///js调用flutter
            controller.addJavaScriptChannel(
              'iOS',
              onMessageReceived: (p0) {

                if (p0.message.isEmpty) {
                  return;
                }
                var infoMap = jsonDecode(p0.message);

                if (infoMap['loginType'] == 16) {
                  ///退出页面
                  Navigator.of(context).pop();
                }
                
              },
            );
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );

    loadWeb();
  }

  void loadWeb() async {
    var params = <String, dynamic>{};
    await KTClassUIUtils.htMethodPutRequestCommonParams(params);

    Uri url = Uri.parse(Global.unLoginWebUrl + '?param=' + jsonEncode(params));

    controller.loadRequest(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: WebViewWidget(
        controller: controller,
          ),
      ),);
  }
}
