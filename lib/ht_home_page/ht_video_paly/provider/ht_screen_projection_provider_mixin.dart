import 'dart:convert';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider_base.dart';
import 'package:ht_new_movpresenter/provider/main_provider.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:ht_new_movpresenter/utils/tools/device_info_tool.dart';
import 'package:ht_new_movpresenter/utils/tools/toast_tool.dart';
import 'package:url_launcher/url_launcher.dart';

mixin HTScreenProjectionProviderMixin on HTVideoDescProviderBase {
  Future<void> screenProjectionAction() async {
    ToastUtil.showToast(msg: '投屏');
    Map<String, dynamic> a = {
      'uid': HTUserStore.userBean?.uid ?? "0", //⽤⼾ID，同公参，未登录传0
      'vip': mainProvider.subscriptionPurchaseState()
          ? "1"
          : "0", //本包的订阅状态，订阅传1，未订阅传0
      'deviceNo': GetDeviceInfo.deviceNo(), //本包设备号，同公参
      'force': "1", //写死1
      'appType': "0", //本包类型：0.影视 1.动漫
      'appbundleid': "com.ding.movie", //本包的bundleid
      'appid': "93", //本包的appid
      'appleid': "6464025805", //"6463694667", //本包的appleId
      'applink': "https://waibao.page.link", //本包的deeplink域名，值为（取⾃接⼝84/
      'appname': "APP名⼉", //本包app名
      'type': "1", //深链类型，1.订阅，2.下架导量，3.投屏
      'product': mainProvider
          .selectProductNo, //点击的订阅产品编号（1:个⼈周 2:个⼈⽉ 3:个⼈年 4:家庭周 5:家庭⽉
      'activityProduct': "0", //正在搞活动的产品编号，值的获取⻅下⽅“常⻅错误2”
      'epsid': mtype2 == 'tt_mflx' ? vid : '0', //如果是电视剧，则传对应的ID。如果是电影，则传0.
      'mid': mtype2 == 'tt_mflx' ? '0' : vid, //如果是电视剧，则传0。如果是电影，则传电影ID
      'title': videoDescBean?.data?.title, //投屏资源的标题
      'tvname': "Chucky-Season 3-Eps 1: Murder at 1600", //如果是电视剧则传"剧名-季名-集
      'cover': videoDescBean?.data?.cover,
      'url': videoUrlStr,
      'callback': '1',

      ///回跳影视就也能走scheme了
    };
    var airplay = HTUserStore.toolConfigBean?.airplay;
    String jsonStringB = jsonEncode(a);

// Scheme方式跳转：
    String schemeLink =
        "${airplay?.scheme}://com.ding.tool?params=$jsonStringB";
    Uri schemeUrl = Uri.parse(schemeLink);

    //Deeplink方式跳转：
    String shopLink = 'https://apps.apple.com/app/id${airplay?.appleid}';
    String deepLink = '$shopLink?params=$jsonStringB';
    deepLink = Uri.encodeFull(deepLink);
    // String linkUrl = Uri.encodeComponent(
    //     'https://wbtool.page.link/app/id${airplay?.appleid}?params=$stringA'
    //         .toLowerCase());
    ///2.配置参数(airplay)
    final dynamicLinkParams = DynamicLinkParameters(
        link: Uri.parse(deepLink),
        uriPrefix: 'https://wbtool.page.link',
        iosParameters:
            IOSParameters(bundleId: airplay?.bundleid ?? 'com.ding.tool'),
        navigationInfoParameters: NavigationInfoParameters(
            forcedRedirectEnabled: airplay?.k2 == 1 ? true : false),
        socialMetaTagParameters: SocialMetaTagParameters(
            description: airplay?.c2, title: airplay?.c1));

    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);

    Clipboard.setData(ClipboardData(text: dynamicLink.query));
    if (kDebugMode) {
      print('🍊🍊🍊🍊🍊🍊🍊🍊🍊🍊🍊🍊🍊$dynamicLink');
      print('🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌${dynamicLink.toString()}');
      print('🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎${dynamicLink.query}');
      print('🍐🍐🍐🍐🍐🍐🍐🍐🍐🍐🍐🍐$dynamicLink');
    }
    bool isInstalled = await canLaunchUrl(schemeUrl);
    if (kDebugMode) {
      print('是否安装了:$isInstalled');
    }
    if (isInstalled) {
      ///scheme跳转
      await canLaunchUrl(schemeUrl);
    } else {
      //深链接跳转
      try {
        // var s = await canLaunchUrl(dynamicLink);
        if (await canLaunchUrl(dynamicLink)) {
          ///标记一下,跳转了工具包,需要进行刷新
          await launchUrl(dynamicLink);
        }
      } catch (e) {
        print(e);
      }
      print('App is not installed.');
    }
  }
}
