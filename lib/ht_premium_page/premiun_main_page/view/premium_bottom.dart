import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/provider/premium_provider.dart';
import 'package:ht_new_movpresenter/provider/main_provider.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class PremiumBottomWidget extends StatefulWidget {
  const PremiumBottomWidget({Key? key}) : super(key: key);
  @override
  State<PremiumBottomWidget> createState() => _PremiumBottomWidgetState();
}

class _PremiumBottomWidgetState extends State<PremiumBottomWidget> {
  late PremiumProvider provider;
  List<String> list = [];
  @override
  void initState() {
    super.initState();
    list = [
      'Subscription automatically renews unless auto-renewal is disabled at least 24 hours before the end of the current period.',
      'Subscriptions can be managed by the user and automatic renewal can be disabled by going to the User Account Settings after purchase.',
      'You must confirm and pay the VIP subscription through the iTunes account in the purchase confirmation.',
      'Any unused portion of a free trial period, if offered, will be forfeited when the user purchases a subscription to that publication, where applicable.',
      'The VIP subscription is automatically renewed.',
      'Subscriptions length: Weekly,Monthly,Annually.',
      'terms of service:',
      'privacy policy:'
    ];
    provider = context.read<PremiumProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<MainPovider, bool>(
      selector: (p0, p1) => p1.purchaseRefresh,
      builder: (context, value, child) {
        return Container(
          margin: const EdgeInsets.only(top: 15),
          // color: Colors.amberAccent,
          child: Column(
            children: <Widget>[
              priceDesTextWidget(),
              //订阅按钮
              preiumButtonWidget(),
              //restore那行
              restoreButtonWidget(),
              lineWiget(),
              ...creatDescListWidget()
            ],
          ),
        );
      },
    );
  }

  ///订阅按钮上面的说明
  Widget priceDesTextWidget() {
    return Selector<PremiumProvider, Tuple3<int, int, int>>(
      selector: (p0, p1) =>
          Tuple3(p1.isFamilyOrIndividual, p1.selectFamaily, p1.selectPerson),
      builder: (context, value, child) {
        return Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          width: double.infinity,
          child: Text(
            provider.selectProductDis(),
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xff3cdef4),
              fontWeight: FontWeight.bold,
            ),
            maxLines: null,
            overflow: TextOverflow.visible,
          ),
        );
      },
    );
  }

  ///订阅按钮
  Widget preiumButtonWidget() {
    return Selector<PremiumProvider, Tuple3<int, int, int>>(
      selector: (p0, p1) =>
          Tuple3(p1.isFamilyOrIndividual, p1.selectFamaily, p1.selectPerson),
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            provider.go2Pay();
          },
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            width: 328,
            height: 44,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(22),
              ),
              image: DecorationImage(
                image: CachedNetworkImageProvider(ImageURL.url_264),
              ),
            ),
            child: Center(
              child: Text(
                provider.selectProductPrice(),
                style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff685034),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }

  ///Restore 按钮哪一行
  Widget restoreButtonWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 13, bottom: 12),
      child: Row(
        children: [
          const Spacer(),
          const Text(
            'if the ads still appears,tap ',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff999999),
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            child: const Text(
              'Restore',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
                decorationColor: Color(0xffFFFFFF),
                decorationThickness: 1,
              ),
            ),
            onTap: () {
              // print('点击了 Restore 按钮');
              EasyLoading.show();
              mainProvider.inAppPurchase.restorePurchases();
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget lineWiget() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 1,
      color: const Color(0xffececec).withAlpha(50),
    );
  }

  ///创建下面的几行文案说明
  List<Widget> creatDescListWidget() {
    var result = <Widget>[];
    for (var element in list) {
      result.add(descWiget(element));
    }
    return result;
  }

  Widget descWiget(String desStr) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 7, left: 0, right: 10),
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Expanded(
              child: Text(
                desStr,
                style: const TextStyle(
                  height: 1.5,
                  fontSize: 12,
                  color: Color(0xffececec),
                ),
                maxLines: null,
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
        Container(height: 10)
      ],
    );
  }
}
