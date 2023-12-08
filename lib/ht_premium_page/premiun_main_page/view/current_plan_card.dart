import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_premium_page/family_account_page/view/premium_familypage.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';

///当前计划卡片
///分三种：1️⃣ 个人计划   2️⃣家庭计划主账号版本   3️⃣ 家庭计划成员版本
/// ignore: must_be_immutable
class CurrentPlanCardWidget extends StatefulWidget {
  CurrentPlanCardWidget({Key? key, this.typeStr}) : super(key: key);
  String? typeStr;

  @override
  State<CurrentPlanCardWidget> createState() => _CurrentPlanCardWidgetState();
}

class _CurrentPlanCardWidgetState extends State<CurrentPlanCardWidget> {
  @override
  Widget build(BuildContext context) {
    return currentPlanPersonalWidget();
  }
  ///个人计划背景图片 250
  Widget currentPlanPersonalWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 69,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: CachedNetworkImageProvider(ImageURL.url_250),
            fit: BoxFit.fill),
      ),
      child: Row(children: [
        Container(width: 10.0),
        const Text("Current Plan",
            style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff222222),
                fontWeight: FontWeight.w600)),
        const Spacer(),
        Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Individual - Monthly",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xff222222),
                      fontWeight: FontWeight.w600)),
              Container(height: 6.0),
              const Text("Cancel On:July 3, 2023",
                  style: TextStyle(fontSize: 10.0, color: Color(0x80222222))),
            ]),
        Container(width: 10.0),
      ]),
    );
  }

  ///家庭计划主账号版本 / 家庭计划成员版本 背景 339
  Widget currentPlanFamilyMainWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 10),
      height: 112,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: CachedNetworkImageProvider(ImageURL.url_339),
            fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          //上半部分
          SizedBox(
            height: 68,
            child: Row(children: [
              Container(width: 10.0),
              const Text("Current Plan",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xff222222),
                      fontWeight: FontWeight.w600)),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Family - Monthly",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xff222222),
                          fontWeight: FontWeight.w600)),
                  Container(height: 6.0),
                  const Visibility(
                    visible: false,
                    child: Text("Cancel On:July 3, 2023",
                        style: TextStyle(
                            fontSize: 10.0, color: Color(0x80222222))),
                  ),
                ],
              ),
              Container(width: 10.0),
            ]),
          ),

          ///中间的横线
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.white.withAlpha(50),
          ),

          ///下半部分
          SizedBox(
            height: 43,
            width: double.infinity,
            child: Row(
              children: [
                Container(width: 10.0),
                const Text(
                  "my family",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff222222),
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                    width: 76,
                    height: 26,
                    alignment: Alignment.center,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: StadiumBorder(
                        side: BorderSide(width: 0, color: Colors.white),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        ///跳转到Family Account⻚面
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            //不携带参数
                            return const HTClassFamilyPage(
                              title: '',
                            );
                            //携带参数(例如带一个字符串参数)
                            //return NewRoute("abc");
                          }),
                        );
                      },
                      child: const Text(
                        "Manage",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    )),
                Container(width: 10.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}
