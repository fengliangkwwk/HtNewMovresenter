import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/bean/user_bean.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/provider/setting_provider_mixin.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/provider/settting_provider_base.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/view/login_page.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/personal_info_editing/view/person_data.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/personal_info_editing/view/setting_persondata.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_shared_keys.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

///处理逻辑  model
class SettingProvider extends SettingProviderBase with SettingProviderMixin {
  Future<void> loadData() async {
    await api1Net();
  }

  // 去登录
  void goLogin(BuildContext context) async {
    if (HTUserStore.login()) {
      ///1. 已登录
      await Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const PersonDataWidget();
      }));
    } else {
      ///2. 未登录 -> 去登录
      await Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const LoginPage();
      }));

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var res = {
        "phone": "1967584653",
        "email": "test_lvguorui8718@gmail.com",
        "user_name": "Jack",
        "user_face": "",
        "user_gender": 2,
        "uid": "3159306",
        "user_birth": "2020-02-02",
        "user_issync2": 0,
        "msync": 1
      };
      await prefs.setString(HTSharedKeys.htPersonMesaage, res.toString());
      HTUserStore.userBean = UserBean.fromJson(res);
    }
  }

  // ///谷歌登录方法
  // void googleLoginAction(BuildContext context) async {
  //   UserCredential? userCredential = await signInWithGoogle();
  //   if (userCredential != null) {
  //     print("User signed in: ${userCredential.user?.displayName}");
  //     // 在这里处理登录成功后的操作
  //   }
  // }

  // ///谷歌登录
  // Future<UserCredential?> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     if (googleUser == null) return null;

  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //     final OAuthCredential googleCredential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     return await FirebaseAuth.instance.signInWithCredential(googleCredential);
  //   } catch (e) {
  //     print("Google sign in error: $e");
  //     return null;
  //   }
  // }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }
}
