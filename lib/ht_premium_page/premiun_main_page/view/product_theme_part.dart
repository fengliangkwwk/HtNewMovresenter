///订阅页面follow this link下面的部分
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:ht_new_movpresenter/utils/tools/ht_sys_tool.dart';

class ProductThemePartWidget extends StatefulWidget {
  const ProductThemePartWidget({Key? key}) : super(key: key);

  @override
  State<ProductThemePartWidget> createState() => _ProductThemePartWidgetState();
}

class _ProductThemePartWidgetState extends State<ProductThemePartWidget> {
  int? htVarTabselection = 0;
  List<String> list = [
    "Remove ADS",
    "Unlock All Movies",
    "HD resources",
    "Watch on TV",
    // "Watch on TV",
    // "Remove ADS",
    // "Unlock All Movies",
    // "HD resources",
    // "Watch on TV",
    // "Watch on TV",
    // "Remove ADS",
    // "Unlock All Movies",
    // "HD resources",
    // "Watch on TV",
    // "Watch on TV",
    // "Remove ADS",
    // "Unlock All Movies",
    // "HD resources",
    // "Watch on TV",
    // "Watch on TV",
    // "Remove ADS",
    // "Unlock All Movies",
    // "HD resources",
    // "Watch on TV",
    // "Watch on TV"
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
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 48,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              child: Container(
                  alignment: Alignment.center,
                  color: htVarTabselection == 0
                      ? const Color(0xff11101E)
                      : const Color(0xff161A26),
                  child: Text("Individual Plan",
                      style: TextStyle(
                          color: htVarTabselection == 0
                              ? Colors.white
                              : const Color(0xff727682),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600))),
              onTap: () {
                setState(() {
                  htVarTabselection = 0;
                });
              },
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Container(
                  alignment: Alignment.center,
                  color: htVarTabselection == 1
                      ? const Color(0xff11101E)
                      : const Color(0xff161A26),
                  child: Text("Family Plan",
                      style: TextStyle(
                          color: htVarTabselection == 1
                              ? Colors.white
                              : const Color(0xff727682),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600))),
              onTap: () {
                setState(() {
                  htVarTabselection = 1;
                });
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
          ],
        ),
      ),
    );
  }

  ///权益九宫格列表Remove ADS   Unlock All Movies等
  // ignore: dead_code
  Widget equityGridWiget() {
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
          children: list.map((name) => gridViewItemWidget(name)).toList()),
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
  Widget productListWidget(){
    return Container(
      height: 136,
      color: Colors.amber,

    );
  }
}
