///订阅页面follow this link下面的部分
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/provider/premium_provider.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/view/premium_bottom.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:ht_new_movpresenter/utils/tools/ht_sys_tool.dart';
import 'package:provider/provider.dart';

class ProductThemePartWidget extends StatefulWidget {
 ProductThemePartWidget({Key? key}) : super(key: key);

  @override
  State<ProductThemePartWidget> createState() => _ProductThemePartWidgetState();
}

class _ProductThemePartWidgetState extends State<ProductThemePartWidget> {

  List<String> list = [
    "Remove All Ads",
    "Unlock All Movies",
    "Unlimited Casting",
    "High-definition",
    "Up To 5 Members",
  ];
  @override
  Widget build(BuildContext context) {

    return productThemePartWidget();
  }

  Widget productThemePartWidget() {
    return Expanded(
      child: Column(
        children: [
          sectonSelectWidget(),
          productSingleScrollWidget(),
        ],
      ),
    );
  }
  ///individual plan / family plan 切换按钮
  Widget sectonSelectWidget() {
    print(context.read<PremiumProvider>().isFamilyOrIndividual);
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 48,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              child: Container(
                  alignment: Alignment.center,
                  color:  context.read<PremiumProvider>().isFamilyOrIndividual == 0
                      ? const Color(0xff11101E)
                      : const Color(0xff161A26),
                  child: Text("Individual Plan",
                      style: TextStyle(
                          color:  context.read<PremiumProvider>().isFamilyOrIndividual == 1
                              ? Colors.white
                              : const Color(0xff727682),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600))),
              onTap: () {
                 context.read<PremiumProvider>().clickIndividualOrFamily(0);
              },
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Container(
                  alignment: Alignment.center,
                  color:  context.read<PremiumProvider>().isFamilyOrIndividual == 1
                      ? const Color(0xff11101E)
                      : const Color(0xff161A26),
                  child: Text("Family Plan",
                      style: TextStyle(
                          color:  context.read<PremiumProvider>().isFamilyOrIndividual == 0
                              ? Colors.white
                              : const Color(0xff727682),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600))),
              onTap: () {
                 context.read<PremiumProvider>().clickIndividualOrFamily(1);
              },
            ),
          )
        ],
      ),
    );
  }

  ///整体上下可滑动的ScrollWidget
  Widget productSingleScrollWidget() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            equityGridWiget(),
            productListWidget(),
            const PremiumBottomWidget(),
          ],
        ),
      ),
    );
  }

  ///权益九宫格列表Remove ADS   Unlock All Movies等
  // ignore: dead_code
  Widget equityGridWiget() {
    List<String> equityList =  context.read<PremiumProvider>().isFamilyOrIndividual == 0
        ? list.sublist(0, list.length - 1)
        : list;
    return Container(
      color: Colors.transparent,
      child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: (SysTools.getScreenSize(context).width / 2) / 30,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 9.5,
          children:
              equityList.map((name) => gridViewItemWidget(name)).toList()),
    );
  }

  ///九宫格 item
  Widget gridViewItemWidget(String str) {
    return Row(
      children: [
        const Spacer(),
        const Image(
          image: CachedNetworkImageProvider(ImageURL.url_212),
          width: 14,
          height: 14,
        ),
        Container(
          width: 10,
        ),
        Text(
          str,
          style: const TextStyle(
            color: Color(0xffeae9ee),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
      ],
    );
  }

  /// 订阅产品列表 List
  Widget productListWidget() {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      margin: const EdgeInsets.only(top: 10),
      height: 136,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return productItemWidget();
        },
      ),
    );
  }

  ///订阅产品列表Item.
  Widget productItemWidget() {
    return Row(
      children: [
        Container(
          width: 15,
        ),
        Container(
          width: 106,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            //背景图
            image: DecorationImage(
                image: CachedNetworkImageProvider(ImageURL.url_227),
                fit: BoxFit.fill),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///trial 图标
              Container(
                width: 72.0,
                height: 24.0,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(ImageURL.url_238),
                  ),
                ),
                child: const Text(
                  "Trial",
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                ),
              ),
              Container(height: 14.0),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Monthly",
                  style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(height: 14.0),
              Container(
                  alignment: Alignment.center,
                  child: const Text("\$4.99",
                      style: TextStyle(
                          color: Color(0xff222222),
                          fontSize: 28.0,
                          fontWeight: FontWeight.w600))),
              Container(height: 4.0),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "\$8.53",
                  style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: 11.0,
                      decoration: TextDecoration.lineThrough),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
