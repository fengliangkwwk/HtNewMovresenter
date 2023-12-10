//邀请码界面
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_ad_lunch_page/beans/invite_code_bean.dart';
import 'package:ht_new_movpresenter/ht_ad_lunch_page/views/InviteCodeController.dart';
import 'package:ht_new_movpresenter/ht_ad_lunch_page/views/premium_launcherpage.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_shared_keys.dart';
import 'package:ht_new_movpresenter/utils/net_request/ui_utils.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart'
    show ModalProgressHUD;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HTClassLauncherPage extends StatefulWidget {
  const HTClassLauncherPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;

  @override
  State<HTClassLauncherPage> createState() => _HTClassLauncherPageState();
}

class _HTClassLauncherPageState extends State<HTClassLauncherPage> {
  var _htVarSearchController = TextEditingController();
  var _htVarShowIndicator = false; //加载指示器是否显示
  var _htVarInviteCodeControl = InviteCodeController();
  @override
  void initState() {
    super.initState();
    _checkAndRequestPermission();

  }
 // 请求网络访问权限
    Future<void> _checkAndRequestPermission() async {
    var status = await Permission.location.status;
    if (status.isPermanentlyDenied) {
      ///被永久拒绝
      // If permission is undetermined, request it
      var result = await Permission.location.request();
      if (result == PermissionStatus.granted) {
        // User granted permission, handle accordingly
        _onPermissionGranted();
      } else {
        // User denied permission, handle accordingly
        _onPermissionDenied();
      }
    } else if (status.isGranted) {
      ///同意
      // Permission is already granted, handle accordingly
      _onPermissionGranted();
    } else {
      ///拒绝
      // Permission is denied, handle accordingly
      _onPermissionDenied();
    }
  }

  void _onPermissionGranted() {
    // Handle actions when permission is granted
    print('Permission granted. You can now access the location.');
  }

  void _onPermissionDenied() {
    // Handle actions when permission is denied
    print('Permission denied. You cannot access the location.');
  }

  @override
  Widget build(BuildContext context) {
    KTClassUIUtils.setDeviceResolution(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("APP",
                      style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.green)),
                  Container(height: 50.0),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 110.0),
                      height: 44.0,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: TextField(
                          controller: _htVarSearchController,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          onEditingComplete: () async {
                            setState(() {
                              _htVarShowIndicator = true;
                            });
                            InviteCodeBean? inviteCodeBean =
                                await _htVarInviteCodeControl.getInviteCode(
                                    _htVarSearchController.value.text);

                            if (inviteCodeBean?.resolution != "100") {
                              setState(() {
                                _htVarShowIndicator = false;
                              });
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setBool(HTSharedKeys.isFirstInto, false);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const HTClassPremiumLauncherPage(
                                    title: "");
                              }));
                            } else {
                              setState(() {
                                _htVarShowIndicator = false;
                              });
                            }
                          }))
                ]),
            inAsyncCall: _htVarShowIndicator));
  }
}
