import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/view/login_page.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/provider/premium_provider_base.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/provider/premium_provider_data_mixin.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/provider/premium_provider_ximin.dart';
import 'package:ht_new_movpresenter/provider/main_provider.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:ht_new_movpresenter/utils/tools/device_info_tool.dart';
import 'package:ht_new_movpresenter/utils/tools/ht_sys_tool.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:url_launcher/url_launcher.dart';

class PremiumProvider extends PremiumProviderBase
    with PremiumProviderMixin, PremiumProviderDataMixin {
  ///数据请求
  Future<void> loadData() async {
    await requestPremiumApi();
    // await requesCheckVipApi();
    mainProvider.purchaseRefresh = !mainProvider.purchaseRefresh;
    mainProvider.notify();
    notifyListeners();
  }

  ///点击家庭订阅和个人订阅
  void clickIndividualOrFamily(int index) {
    print('====================${index}');
    isFamilyOrIndividual = index;
    notifyListeners();
  }

  ///点击产品
  void clickProductItemAction(int index) {
    if (isFamilyOrIndividual == 1) {
      selectFamaily = index;
    } else {
      selectPerson = index;
    }
    notifyListeners();
  }

  ///产品是否选中
  bool isSelect(int index) {
    if (isFamilyOrIndividual == 1 && index == selectFamaily) {
      return true;
    }

    if (isFamilyOrIndividual == 0 && index == selectPerson) {
      return true;
    }
    return false;
  }

  ///标题颜色 / 优惠价格颜色

  Color productTitleColor(bool selectState) {
    if (selectState == true) {
      return const Color(0xFF222222);
    }
    return const Color(0xFFECECEC);
  }

  Color productPriceColor(bool selectState) {
    if (selectState == true) {
      return const Color(0xFF222222);
    }

    return const Color(0xff999999);
  }

  ///选中产品的描述
  String selectProductDis() {
    ///1.获取数据源
    var dataList = productDataList();
    if (dataList.isEmpty) return '';

    ///获取选中数据
    var model =
        dataList[isFamilyOrIndividual == 1 ? selectFamaily : selectPerson];

    ///3.判断是否是优惠项
    if (HTUserStore.premiumBean?.discountProduct(model) == true) {
      return model?.t1 ?? '';
    }
    return 'You can cancel anytime';
  }

  String selectProductPrice() {
    ///1.获取数据源
    var dataList = productDataList();
    if (dataList.isEmpty) return '';

    ///获取选中数据
    var model =
        dataList[isFamilyOrIndividual == 1 ? selectFamaily : selectPerson];

    ///3.判断是否是优惠项
    if (HTUserStore.premiumBean?.discountProduct(model) == true) {
      return '${model?.h1 ?? ''}/${titleMap[model?.c1 ?? ''] ?? ''}';
    }
    return 'Pay \$${productPrice(model)}';
  }

  ///去订阅
  void go2Pay(BuildContext context) async {
    context = context;
    var dataList = productDataList();
    if (dataList.isEmpty) return;

    ///获取选中数据
    var model =
        dataList[isFamilyOrIndividual == 1 ? selectFamaily : selectPerson];
    if (HTUserStore.premiumBean?.isK12() == true) {
      ///服务器订阅
      ///1.
      Map<String, dynamic> a = {
        'uid': HTUserStore.userBean?.uid ?? "0", //⽤⼾ID，同公参，未登录传0
        'vip': mainProvider.subscriptionPurchaseState()
            ? "1"
            : "0", //本包的订阅状态，订阅传1，未订阅传0
        'deviceNo': await GetDeviceInfo.deviceNo(), //本包设备号，同公参
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
        'activityProduct': "0",//正在搞活动的产品编号，值的获取⻅下⽅“常⻅错误2”
        'callback':'1',///回跳影视就也能走scheme了
      };
      var airplay = HTUserStore.toolConfigBean?.airplay;
      String jsonStringB = jsonEncode(a);
      // Scheme方式跳转：
      String schemeLink =
          "${airplay?.scheme}://com.ding.tool?params=$jsonStringB";

      ///deepLink跳转
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
              description: airplay?.c5, title: airplay?.c4));

      final dynamicLink =
          await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);

      Clipboard.setData(ClipboardData(text: dynamicLink.query));

      // Clipboard.setData(ClipboardData(text: dynamicLink.toString()));
      if (kDebugMode) {
        print('🍊🍊🍊🍊🍊🍊🍊🍊🍊🍊🍊🍊🍊$dynamicLink');
        print('🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌${dynamicLink.toString()}');
        print('🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎${dynamicLink.query}');
        print('🍐🍐🍐🍐🍐🍐🍐🍐🍐🍐🍐🍐$schemeLink');
      }

      Uri schemeUrl = Uri.parse(schemeLink);
      bool isInstalled = await canLaunchUrl(schemeUrl);
      if (kDebugMode) {
        print('是否安装了:$isInstalled');
      }
      if (isInstalled) {
        ///scheme跳转
        launchApp(schemeUrl);
      } else {
        //深链接跳转
        try {
          // var s = await canLaunchUrl(dynamicLink);
          if (await canLaunchUrl(dynamicLink)) {
            ///标记一下,跳转了工具包,需要进行刷新
            toToolPackage = true;
            await launchUrl(dynamicLink);
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }
        if (kDebugMode) {
          print('App is not installed.');
        }
      }
      return;
    }

    ///本地订阅
    var purchaseParam = PurchaseParam(productDetails: model);
    EasyLoading.show();
    mainProvider.inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
  }

  ///scheme跳转
  void launchApp(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // 处理无法打开应用的情况
      if (kDebugMode) {
        print('Could not launch $url');
      }
    }
  }

  ///进入前后台
  void didChangeAppLifecycleState(
      AppLifecycleState state, BuildContext context) async {
    if (state == AppLifecycleState.resumed) {
      // 应用进入前台
      // 1.检查是否需要回来校验326
      if (toToolPackage == true) {
        await requesCheckVipApi();
      // 2.判断是否需要跳转登录
        go2Login(context);
      }
    } else if (state == AppLifecycleState.paused) {
      // 应用进入后台
    }
  }

  ///需要去登录
  void go2Login(BuildContext context) async {
    ///登录条件缺一不可
// /326/返回值⾥⾯ device中的val值 = @"1"；
// 当前⻚⾯不是登录⻚；
// 没有登录；
// /326/返回值⾥⾯ local中的value值 != @"1"。
    final String val = HTUserStore.vipInfoBean?.device?.val ?? '';
    final String value = (HTUserStore.vipInfoBean?.local?.value).toString();
    bool isLoginPage = SysTools.isCurrentPage(context, LoginPage());
    bool isLogin = HTUserStore.login();
    if (val == '1' &&
        value != '1' &&
        isLoginPage == false &&
        isLogin == false) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginPage(
              isLoginPage: true,
            );
          },
        ),
      );
    }
  }
}
