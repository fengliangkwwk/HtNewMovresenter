///   @ProjectName : ht_new_movpresenter
///   @Author : feng liang
///   @Date   : 2023-11-09 13:56:31
///   @Desc   : 个人中心页面

import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/utils/url_getImageurl.dart';
import 'package:ht_new_movpresenter/view/setting/setting_feedback.dart';
import 'package:ht_new_movpresenter/view/setting/setting_persondata.dart';
import 'package:ht_new_movpresenter/view/setting/setting_play_history.dart';

class HTClassSettingInfoPage extends StatefulWidget {
  const HTClassSettingInfoPage({Key? key, required this.title})
      : super(key: key);
  final String title;
  @override
  State<HTClassSettingInfoPage> createState() => _HTClassSettingInfoPageState();
}

class _HTClassSettingInfoPageState extends State<HTClassSettingInfoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: scrollWidget(),
    );
  }

  Widget scrollWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          //  Container(height: MediaQuery.of(context).padding.top + 0.0),
          headerWidget(),
          secondWidget(),
          historyWidget(),
          historyList(),
          watchListWidget(),
          Container(
            height: 30,
          ),
          shareWidget(),
          Container(
            height: 30,
          ),
          feedbackWidget(),
        ],
      ),
    );
  }

  Widget totalWidget() {
    return Container(
        alignment: Alignment.center,
        // height: 12.0,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: NetworkImage(ImageURL.url_244),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Column(
          children: [
            Container(height: MediaQuery.of(context).padding.top + 0.0),
            headerWidget(),
            secondWidget(),
            historyWidget(),
            historyList(),
            watchListWidget(),
            Container(
              height: 30,
            ),
            shareWidget(),
            Container(
              height: 30,
            ),
            feedbackWidget(),
          ],
        ));
  }

  ///第一行
  Widget headerWidget() {
    return Container(
      height: 54 + MediaQuery.of(context).padding.top + 20 ,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(ImageURL.url_244),
            fit: BoxFit.cover,
          ),
          color: Colors.white,
        ),
        child: GestureDetector(
            child: Column(
              children: [
                 const Expanded(child: SizedBox()),
                 SizedBox(
                  height: 54,
                  child: Row(
                  
                  children: [
                  Container(width: 10.0),
                  Container(
                    width: 54.0,
                    height: 54.0,
                    decoration: BoxDecoration(
                        image:
                            const DecorationImage(image: NetworkImage(ImageURL.url_347)),
                        borderRadius: BorderRadius.circular(27.0),
                        border: Border.all(color: Colors.white)),
                  ),
                  Container(width: 15.0),
                  const Text("Login/Signup",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                  const Spacer(),
                  Image.network(ImageURL.url_289, width: 24.0, height: 24.0),
                  Container(width: 10.0),
                              ]),
                ),
               const SizedBox(height: 20,)
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HTClassPersondataPage(title: "");
              }));
            }));
  }

  /// 第二行
  Widget secondWidget() {
    return Container(
        height: 60.0,
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 23.0),
        padding: const EdgeInsets.only(left: 16.0),
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: NetworkImage(ImageURL.url_280), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(6.0)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("special offer for you",
                  style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600)),
              Container(height: 4.0),
              Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                const Text("\$",
                    style: TextStyle(
                        color: Color(0xff222222),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600)),
                const Text("2.99",
                    style: TextStyle(
                        color: Color(0xff222222),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600)),
                Container(width: 3.0),
                const Text("for the 1 Month",
                    style: TextStyle(color: Color(0xff222222), fontSize: 10.0)),
              ])
            ]));
  }

  ///第三行
  Widget historyWidget() {
    return Row(children: [
      Container(width: 10.0),
      Image.network(ImageURL.url_343, width: 16.0, height: 16.0),
      Container(width: 5.0),
      const Text("History",
          style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
              fontWeight: FontWeight.w600)),
      const Spacer(),
      GestureDetector(
          child: Image.network(ImageURL.url_289, width: 24.0, height: 24.0),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HTClassPresHistoryPage(title: "");
            }));
          }),
      Container(width: 10.0)
    ]);
  }

  ///historyListView列表
  Widget historyList() {
    return Container(
        height: 145.0,
        margin: const EdgeInsets.only(top: 11.0, bottom: 21.0),
        padding: const EdgeInsets.fromLTRB(5.0, 0, 5, 0),
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: [1, 2, 3, 4, 5]
                .map((index) => GestureDetector(
                    child: Container(
                        width: 112.0,
                        margin: EdgeInsets.only(right: 5.0),
                        child: Stack(alignment: Alignment.center, children: [
                          Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Image.network(ImageURL.url_254,
                                  height: 120.0,
                                  width: 84.0,
                                  fit: BoxFit.fill)),
                          Container(
                              // padding:const EdgeIns ets.only(bottom: 45.0),
                              child: Image.network(ImageURL.url_268,
                                  width: 24.0, height: 24.0, fit: BoxFit.fill)),
                          const Positioned(
                              left: 5.0,
                              top: 5.0,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("8.",
                                        style: TextStyle(
                                            color: Color(0xffFF6D1C),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                    Text("0",
                                        style: TextStyle(
                                            color: Color(0xffFF6D1C),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600))
                                  ])),
                          const Positioned(
                              top: 185.0,
                              left: 5.0,
                              right: 5.0,
                              child: Text("Minions:The Rise of Gru",
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Color(0xff828386),
                                      fontSize: 12.0)))
                        ])),
                    onTap: () {}))
                .toList()));
  }

  ///watchList
  Widget watchListWidget() {
    return GestureDetector(
        child: Row(children: [
          Image.network(ImageURL.url_344, width: 16.0, height: 16.0),
          Container(width: 5.0),
          const Text("Watchlist",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500)),
          const Spacer(),
          Image.network(ImageURL.url_289, width: 24.0, height: 24.0),
          Container(width: 10.0)
        ]),
        onTap: () {});
  }

  ///share
  Widget shareWidget() {
    return GestureDetector(
        child: Row(children: [
          Image.network(ImageURL.url_345, width: 16.0, height: 16.0),
          Container(width: 5.0),
          const Text("Feedback",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500)),
          const Spacer(),
          Image.network(ImageURL.url_289, width: 24.0, height: 24.0),
          Container(width: 10.0)
        ]),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const HTClassFeedbackPage(title: "");
          }));
        });
  }

  ///feedback
  Widget feedbackWidget() {
    return GestureDetector(
        child: Row(children: [
          Image.network(ImageURL.url_346, width: 16.0, height: 16.0),
          Container(width: 5.0),
          const Text("Feedback",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500)),
          const Spacer(),
          Image.network(ImageURL.url_289, width: 24.0, height: 24.0),
          Container(width: 10.0)
        ]),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const HTClassFeedbackPage(title: "");
          }));
        });
  }
}
