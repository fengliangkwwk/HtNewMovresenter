//／启动广告页
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ht_new_movpresenter/main.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_shared_keys.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HTClassPremiumLauncherPage extends StatefulWidget {
  const HTClassPremiumLauncherPage({Key? key, required this.title})
      : super(key: key);
  final String title;
  @override
  State<HTClassPremiumLauncherPage> createState() =>
      _HTClassPremiumLauncherPageState();
}

class _HTClassPremiumLauncherPageState
    extends State<HTClassPremiumLauncherPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(ImageURL.url_86),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(width: 16.0),
              const Text("Stay Connected \nWith Us",
                  style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ]),
            Container(height: 8.0),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(width: 16.0),
              const Text(
                  "Get notifications, you can receive the following \nmessages in time",
                  style: TextStyle(fontSize: 14.0, color: Color(0xff999999)))
            ]),
            Container(height: 24.0),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(width: 16.0),
              CachedNetworkImage(
                  imageUrl: ImageURL.url_89, width: 24.0, height: 24.0),
              // Image.network(ImageURL.url_89, width: 24.0, height: 24.0),
              // Image.asset("image/icon_premium_launcher_1.png",width: 24.0, height: 24.0),
              Container(width: 8.0),
              const Text("The latest popular movies and TV shows",
                  style: TextStyle(color: Colors.white, fontSize: 16.0))
            ]),
            Container(height: 24.0),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(width: 16.0),
              CachedNetworkImage(
                  imageUrl: ImageURL.url_88, width: 24.0, height: 24.0),
              Container(width: 8.0),
              const Text("Important news, APP updates and more",
                  style: TextStyle(color: Colors.white, fontSize: 16.0))
            ]),
            Container(height: 24.0),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(width: 16.0),
              CachedNetworkImage(
                  imageUrl: ImageURL.url_87, width: 24.0, height: 24.0),
              Container(width: 8.0),
              const Text("Personalized Recommendations",
                  style: TextStyle(color: Colors.white, fontSize: 16.0))
            ]),
            Container(height: 85),
            GestureDetector(
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    alignment: Alignment.center,
                    height: 45.0,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: CachedNetworkImageProvider(ImageURL.url_348),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(22.5),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: const Text("Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600))),
                onTap: () {
                  _requestNotificationPermission();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       Permission.notification.request();
                  //       return const HTClassBtmNavPage();
                  //     },
                  //   ),
                  // );
                }),
            Container(height: 18.0),
            Container(
                alignment: Alignment.center,
                child: const Text(
                    "Manage your notifications in your phone settings",
                    style: TextStyle(color: Colors.white, fontSize: 12.0))),
            Container(height: 70.0),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  void _requestNotificationPermission() async {
    // 请求推送通知权限
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // 用户已授予推送通知权限
      if (kDebugMode) {
        print("Notification permission granted");
      }
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool(HTSharedKeys.isClickMessageRequest, true);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            Permission.notification.request();
            return const HTClassBtmNavPage();
          },
        ),
      );
    } else {
      // 用户拒绝了推送通知权限
      if (kDebugMode) {
        print("Notification permission denied");
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            Permission.notification.request();
            return const HTClassBtmNavPage();
          },
        ),
      );
    }
    // // 请求通知权限
    // var status = await Permission.notification.request();
    // // 检查是否授予了通知权限
    // if (status == PermissionStatus.granted) {
    //   if (kDebugMode) {
    //     print('Notification permission granted');
    //   }
    // } else {
    //   if (kDebugMode) {
    //     print('Notification permission not granted');
    //   }
    // }
  }
}
