///   @ProjectName : ht_new_movpresenter
///   @Author : feng liang
///   @Date   : 2023-11-09 13:56:31
///   @Desc   : 登录界面/个人中心页面
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/provider/setting_provider.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/personal_info_editing/view/service_privacy_policy.dart';
import 'package:ht_new_movpresenter/utils/net_request/ht_api.dart';
import 'package:ht_new_movpresenter/utils/net_request/ui_utils.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  // final SettingProvider provider;
  LoginPage({
    this.isLoginPage,
    Key? key,
    // required this.provider,
  }) : super(key: key);
  bool? isLoginPage;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late BuildContext myContext;
  WebViewController _controller = WebViewController();
   SettingProvider provider =  SettingProvider();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
    // provider = widget.provider;
    webViewControllerInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          controller: _controller,
        ),
      ),
    );
  }

  void loadWeb() async {
    Uri url;
    if (widget.isLoginPage == true) {
      var params = <String, dynamic>{
        "force": HTUserStore.premiumBean?.k13 ?? "0"
      };
      await KTClassUIUtils.htMethodPutRequestCommonParams(params);
      url = Uri.parse(Global.unLoginWebUrl + '?param=' + jsonEncode(params));
    } else {
      ///个人信息详情页面
      var params = <String, dynamic>{"uid": HTUserStore.userBean?.uid};
      await KTClassUIUtils.htMethodPutRequestCommonParams(params);
      url = Uri.parse(Global.userInfoWebUrl + '?param=' + jsonEncode(params));
    }
    // print(params);
    // print(url);
    _controller.loadRequest(url);
  }

  ///初始化谷歌登录
  void webViewControllerInit() {
    _controller = WebViewController()
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
            _controller.runJavaScript('getNativeParam({"name":"iOS"})');

            ///js调用flutter
            _controller.addJavaScriptChannel(
              'iOS',
              onMessageReceived: (p0) async {
                print("点击了${p0.message}");
                if (p0.message.isEmpty) {
                  return;
                }
                var infoMap = jsonDecode(p0.message);
                if (infoMap['loginType'] == 1) {
                  ///1:点击了 web 页面的谷歌登录按钮,app 端需要做后续的谷歌登录逻辑.
                  googleLoginAction(context);
                }
                if (infoMap['loginType'] == 5) {
                  // :web 端登录注册完毕,会将数据传给 app 端,app 端做后续的数据保存.
                  await provider.saveUserInfo(infoMap["data"]);
                }
                if (infoMap['loginType'] == 6 || infoMap['loginType'] == 10) {
                  //6: web 端获取用户信息完毕,会将数据传给 app 端,app 端做后续的数据保存.并退出 web 页 面,刷新 app
                  //10 web 端更新了用户信息,app 端需要更新本地的用户数据,并退出 web 页面,刷新 app
                  //6:save按钮   10：弹出窗的确认按钮
                  await provider.saveUserInfo(infoMap["data"]);
                  Navigator.of(context).pop(true);
                }
                if (infoMap['loginType'] == 9) {
                  ///9:web 端执行了退出登录操作,app 端需要清空下用户数据,并退出 web 页面,刷新 app
                  await provider.logOutClearUserInfo();
                  Navigator.of(context).pop(true);
                }
                if (infoMap['loginType'] == 12) {
                  // 12:web 页面放弃了修改用户信息,app 端需要退出 web 页面
                  ///弹出窗的cancel按钮
                  Navigator.of(context).pop();
                }
                if (infoMap['loginType'] == 13) {
                  ///13:web 页面点击了 terms of service 按钮,app 端需要在本应用内打开网址链接 (https://www.baidu.com)
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ServicePrivacyPolicyWidget(
                      url: Uri.parse("https://www.baidu.com"),
                    );
                  }));
                }
                if (infoMap['loginType'] == 14) {
                  ///14:web 页面点击了 privacy policy 按钮,app 端需要在本应用内打开网址链接 (https://www.sina.com)
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ServicePrivacyPolicyWidget(
                      url: Uri.parse("https://www.sina.com"),
                    );
                  }));
                }
                if (infoMap['loginType'] == 16) {
                  ///16:退出 web 页面//返回按钮
                  Navigator.of(context).pop();
                }
              },
            );
          },
          onWebResourceError: (WebResourceError error) {
            EasyLoading.dismiss();
          },
          onNavigationRequest: (NavigationRequest request) {
            // if (request.url.startsWith('https://www.youtube.com/')) {
            //   return NavigationDecision.prevent;
            // }
            return NavigationDecision.navigate;
          },
        ),
      );
    loadWeb();
  }

  ///谷歌登录方法
  void googleLoginAction(BuildContext context) async {
    Map<String, dynamic> googleLoginMap = {};
    UserCredential? userCredential = await signInWithGoogle();
    if (userCredential != null) {
      googleLoginMap["type"] = "2";
      googleLoginMap["thridparty_g"] = "1";
      googleLoginMap["loginType"] = "1";
      googleLoginMap["tp_tpid"] = userCredential.user?.uid;

      ///用户的唯一 id
      googleLoginMap["tp_name"] = userCredential.user?.displayName;
      googleLoginMap["tp_face"] = userCredential.user?.photoURL;
      googleLoginMap["email"] = userCredential.user?.email;
      ///将 map转成 json字符串
      String jsonMap = jsonEncode(googleLoginMap);
      // 在这里处理登录成功后的操作
      // 将值通过JavaScript注入方式传递给Web端
      // _controller.addJavaScriptChannel(name, onMessageReceived: onMessageReceived)
     await _controller.runJavaScript('getNativeParam({"name":$jsonMap,}');
    }
  }

  ///谷歌登录
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // 开始谷歌登录过程
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount == null) return null;
      // 获取身份验证凭据
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;
      // print("苹果苹果+${googleAuth.accessToken}");
      // print("苹果苹果+${googleAuth.idToken}");
      // 创建谷歌登录令牌
      final OAuthCredential googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // 使用谷歌登录令牌进行 Firebase 身份验证
      // await FirebaseAuth.instance.signInWithCredential(googleCredential);
      return await _auth.signInWithCredential(googleCredential);
    } catch (error, stackTrace) {
      Map<String, dynamic> googleLoginErrorMap = {};
      googleLoginErrorMap["loginType"] = '7';
      googleLoginErrorMap["msg"] = 'Failed';
      googleLoginErrorMap["msgDetails"] = error.hashCode.toString() + '-$error';
      //转字符串
      String erorMapString = jsonEncode(googleLoginErrorMap);

      print('登录失败：${error.hashCode}');
      print("Google sign in error: $error");
      // 根据错误类型执行相应的处理
      print('Stack Trace: $stackTrace');

      if (error is FirebaseAuthException) {
        // 处理 Firebase 身份验证错误
        print('🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎');
      } else {
        // 其他错误类型的处理
        print('🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌');
      }
      return null;
    }
  }
}
