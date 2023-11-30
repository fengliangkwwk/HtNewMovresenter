import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_ad_lunch_page/views/home_launcherpage.dart';
import 'package:ht_new_movpresenter/ht_ad_lunch_page/views/premium_launcherpage.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/views/home_mainpage.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/views/setting_mineinfo.dart';
import 'package:ht_new_movpresenter/ht_premium_page/views/premium_indexerpage.dart';
import 'package:ht_new_movpresenter/utils/ht_init_app.dart';
import 'package:ht_new_movpresenter/utils/ht_user_store.dart';

void main() async {
  ///
  await initApp();

  runApp(
    DevicePreview(
      // enabled: !kReleaseMode,
      enabled: false,
      builder: (context) => const HTClassApp(), // Wrap your app
    ),
  );
}

class HTClassApp extends StatelessWidget {
  const HTClassApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      // builder: EasyLoading.init(),
      builder: (context, child) {
        return DevicePreview.appBuilder(
            context, EasyLoading.init()(context, child));
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:HTUserStore.isFirstInto?const HTClassLauncherPage(title: ""):const HTClassPremiumLauncherPage(title: ""), //正常进入启动页
      // home: const HTClassBtmNavPage(),
      // home: const HTClassPremiumLauncherPage(title: '',),
    );
  }
}

class HTClassBtmNavPage extends StatefulWidget {
  const HTClassBtmNavPage({Key? key}) : super(key: key);
  @override
  State<HTClassBtmNavPage> createState() => _HTClassBtmNavPageState();
}

class _HTClassBtmNavPageState extends State<HTClassBtmNavPage> {
  int _htVarCurrentIndex = 0;
  final htBarPages = [
    HTClassHomeMainPage(title: ""),
    HTClassUnPremiumPage(title: ""),
    HTClassSettingInfoPage(title: ""),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: htBarPages[_htVarCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _htVarCurrentIndex,
        unselectedItemColor: Color(0xff666666),
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _htVarCurrentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              // icon: Image.network("https://autoeq.top/img/ios/1@3x.png",width: 18.0,height: 18.0,),
              // activeIcon: Image.network('https://autoeq.top/img/ios/1@3x.png',width: 39.0,height: 39.0,),
              icon: Image.asset(
                'assets/images/httabbar_images/icon_home_off@3x.png',
                width: 39.0,
                height: 39.0,
              ),
              activeIcon: Image.asset(
                'assets/images/httabbar_images/icon_home_on@3x.png',
                width: 39.0,
                height: 39.0,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/httabbar_images/icon_vip_off@3x.png',
                width: 39.0,
                height: 39.0,
              ),
              activeIcon: Image.asset(
                'assets/images/httabbar_images/icon_vip_on@3x.png',
                width: 39.0,
                height: 39.0,
              ),
              label: 'Premlum'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/httabbar_images/icon_library_off@3x.png',
                width: 39.0,
                height: 39.0,
              ),
              activeIcon: Image.asset(
                'assets/images/httabbar_images/icon_library_on@3x.png',
                width: 39.0,
                height: 39.0,
              ),
              label: 'My Library'),
        ],
      ),
    );
  }
}
