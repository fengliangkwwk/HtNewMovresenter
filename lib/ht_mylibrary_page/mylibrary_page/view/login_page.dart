import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/provider/setting_provider.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_api.dart';
import 'package:ht_new_movpresenter/utils/net_request/ui_utils.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late BuildContext myContext;
  WebViewController controller = WebViewController();
  SettingProvider provider = SettingProvider();
  @override
  void initState() {
    super.initState();
    webViewControllerInit();
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

  void loadWeb() async {
    var params = <String, dynamic>{"force": HTUserStore.premiumBean?.k13};
    await KTClassUIUtils.htMethodPutRequestCommonParams(params);
    Uri url = Uri.parse(Global.unLoginWebUrl + '?param=' + jsonEncode(params));
    controller.loadRequest(url);
  }

  void webViewControllerInit() {
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

            ///flutter调用js
            controller.runJavaScript('getNativeParam({"name":"zz",})');

            ///js调用flutter
            controller.addJavaScriptChannel(
              'iOS',
              onMessageReceived: (p0) {
                print(p0.message);
                if (p0.message.isEmpty) {
                  return;
                }
                var infoMap = jsonDecode(p0.message);
                print(infoMap);
                if (infoMap['loginType'] == 16) {
                  ///退出页面
                  Navigator.of(context).pop();
                }
                if (infoMap['loginType'] == 1) {
                  ///谷歌登录
                  googleLoginAction(context);
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
  }

  ///谷歌登录方法
  void googleLoginAction(BuildContext context) async {
    UserCredential? userCredential = await signInWithGoogle();
    if (userCredential != null) {
      print("User signed in: ${userCredential.user?.displayName}");
      // 在这里处理登录成功后的操作
    }
  }

  ///谷歌登录
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(googleCredential);
    } catch (e) {
      print("Google sign in error: $e");
      return null;
    }
  }
}
