import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ht_new_movpresenter/control/HomePageController.dart';
import 'package:ht_new_movpresenter/control/InviteCodeController.dart';
import 'package:ht_new_movpresenter/utils/ui_utils.dart';
import 'package:ht_new_movpresenter/view/premium_launcherpage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart' show ModalProgressHUD;


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
  var _htVarShowIndicator = false;
  var _htVarInviteCodeControl = InviteCodeController();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    KTClassUIUtils.setDeviceResolution(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(child:Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children:[
          const Text("APP",style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.w600,color: Colors.green)),
          Container(height: 50.0),
          Container(margin: EdgeInsets.symmetric(horizontal: 110.0),height:44.0,padding:EdgeInsets.symmetric(horizontal: 10.0),decoration: BoxDecoration(border: Border.all(color: Colors.black)),child: TextField(controller:_htVarSearchController,decoration: InputDecoration(border: InputBorder.none),onEditingComplete: () async {
            var htVarSearchText = _htVarSearchController.value.text;
            setState(() {
              _htVarShowIndicator = true;
            });
            var htVarinviteCodeBean = await _htVarInviteCodeControl.getInviteCode(_htVarSearchController.value.text);
            setState(() {
              _htVarShowIndicator = false;
            });
            if (kDebugMode) {
              print(htVarinviteCodeBean);
            }
             Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return const HTClassPremiumLauncherPage(title: "");
                  }));
            if(htVarSearchText == "OPEN" || htVarSearchText== "open"){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return const HTClassPremiumLauncherPage(title: "");
                  }));
            // ignore: unnecessary_null_comparison
            }else if(htVarinviteCodeBean!=null  && htVarinviteCodeBean.resolution.toString() == "100"){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return const HTClassPremiumLauncherPage(title: "");
                  }));
            }
          }))
        ]),inAsyncCall: _htVarShowIndicator)
        );
  }
}

