///   @ProjectName : ht_new_movpresenter
///   @Author : feng liang
///   @Date   : 2023-11-09 13:56:31
///   @Desc   : 个人中心页面

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/favorite_list/bean/history_bean.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/favorite_list/view/setting_watch_list.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/feed_back/view/setting_feedback.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/provider/setting_provider.dart';
import 'package:ht_new_movpresenter/provider/main_provider.dart';
import 'package:ht_new_movpresenter/utils/net_request/global.dart';
import 'package:ht_new_movpresenter/utils/share/ht_share.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:provider/provider.dart';

class HTClassSettingInfoPage extends StatefulWidget {
  const HTClassSettingInfoPage({Key? key, required this.title})
      : super(key: key);
  final String title;
  @override
  State<HTClassSettingInfoPage> createState() => _HTClassSettingInfoPageState();
}

class _HTClassSettingInfoPageState extends State<HTClassSettingInfoPage> {
  final SettingProvider provider = SettingProvider();
  @override
  void initState() {
    super.initState();
    provider.api1Net();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => provider,
        )
      ],
      child: Container(
        height: double.infinity,
        color: const Color(0xff111218),
        child: scrollWidget(),
      ),
    );
  }

  Widget scrollWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          headerWidget(),
          secondWidget(),
          historyWidget(),
          if (HTUserStore.historyList.isNotEmpty) historyList(),
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

  // Widget totalWidget() {
  //   return Container(
  //     alignment: Alignment.center,
  //     // height: 12.0,
  //     // decoration: BoxDecoration(
  //     //   image: DecorationImage(
  //     //     image: NetworkImage(ImageURL.url_244),
  //     //     fit: BoxFit.cover,
  //     //   ),
  //     // ),
  //     child: Column(
  //       children: [
  //         Container(height: MediaQuery.of(context).padding.top + 0.0),
  //         headerWidget(),
  //         secondWidget(),
  //         historyWidget(),
  //         historyList(),
  //         watchListWidget(),
  //         Container(
  //           height: 30,
  //         ),
  //         shareWidget(),
  //         Container(
  //           height: 30,
  //         ),
  //         feedbackWidget(),
  //       ],
  //     ),
  //   );
  // }

  ///第一行
  Widget headerWidget() {
    return Selector<SettingProvider, bool>(
      selector: ((p0, p1) => p1.isReloadHeader),
      builder: ((context, value, child) {
        return Container(
          height: 54 + MediaQuery.of(context).padding.top + 20,
          decoration: const BoxDecoration(
            ///顶部背景
            image: DecorationImage(
              image: CachedNetworkImageProvider(ImageURL.url_244),
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
                  child: Row(children: [
                    Container(width: 10.0),
                    Container(
                      width: 54.0,
                      height: 54.0,
                      decoration: BoxDecoration(
                          //头像
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                provider.userBean?.userFace ??
                                    ImageURL.url_347),
                          ),
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
                    CachedNetworkImage(imageUrl:ImageURL.url_289, width: 24.0, height: 24.0),
                    Container(width: 10.0),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
            onTap: () => provider.goLogin(context),
          ),
        );
      }),
    );
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
                image: CachedNetworkImageProvider(ImageURL.url_280), fit: BoxFit.fill),
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
      CachedNetworkImage(imageUrl:ImageURL.url_343, width: 16.0, height: 16.0),
      Container(width: 5.0),
      const Text("History",
          style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
              fontWeight: FontWeight.w600)),
      const Spacer(),
      GestureDetector(
          child: CachedNetworkImage(imageUrl:ImageURL.url_289, width: 24.0, height: 24.0),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HTClassWatchListPage(
                title: "Recently Played",
                state: 1,
              );
            }));
          }),
      Container(width: 10.0)
    ]);
  }

  ///historyListView列表
  Widget historyList() {
    return Selector<MainPovider, bool>(
      selector: (p0, p1) => p1.historyRefresh,
      builder: (context, value, child) {
        return Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          padding: const EdgeInsets.only(right: 5),
          height: 145,
          // width: double.infinity,
          child: ListView.builder(
            itemCount: HTUserStore.historyList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return historyListItem(index);
            },
          ),
        );
      },
    );
  }

  Widget historyListItem(int index) {
    var model = HTUserStore.historyList[index];
    return Column(
      children: [
        topPart(model),
        Container(
          margin: const EdgeInsets.only(top: 5),
          height: 20,
          child: Text(
            model.title ?? '',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xff828386), fontSize: 8.0),
          ),
        ),
      ],
    );
  }

  Widget topPart(HistoryBean model) {
    return Container(
        height: 120,
        width: 84,
        // color:Colors.green,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: CachedNetworkImageProvider(model.cover ?? ''),
        )),
        margin: const EdgeInsets.only(right: 5.0),
        child: Stack(alignment: Alignment.center, children: [
          CachedNetworkImage(imageUrl:ImageURL.url_268,
              width: 24.0, height: 24.0, fit: BoxFit.fill),
          Positioned(
              left: 5.0,
              top: 5.0,
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(model.rate ?? '',
                    style: const TextStyle(
                        color: Color(0xffFF6D1C),
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ])),
        ]));
  }

  ///watchList
  Widget watchListWidget() {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(top: 30, left: 10),
        color: Colors.transparent,
        child: Row(children: [
          CachedNetworkImage(imageUrl:ImageURL.url_344, width: 16.0, height: 16.0),
          Container(width: 5.0),
          const Text("Watchlist",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500)),
          const Spacer(),
          CachedNetworkImage(imageUrl:ImageURL.url_289, width: 24.0, height: 24.0),
          Container(width: 10.0)
        ]),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const HTClassWatchListPage(
            title: "Watchlist",
            state: 2,
          );
        }));
      },
    );
  }

  ///share
  Widget shareWidget() {
    return GestureDetector(
        child: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(left: 10),
          child: Row(children: [
            CachedNetworkImage(imageUrl:ImageURL.url_345, width: 16.0, height: 16.0),
            Container(width: 5.0),
            const Text("Share",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
            const Spacer(),
            CachedNetworkImage(imageUrl:ImageURL.url_289, width: 24.0, height: 24.0),
            Container(width: 10.0)
          ]),
        ),
        onTap: () {
          HTShare().share("app", "", "0", "", "");
        });
  }

  ///feedback
  Widget feedbackWidget() {
    return GestureDetector(
        child: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(left: 10),
          child: Row(children: [
            CachedNetworkImage(imageUrl:ImageURL.url_346, width: 16.0, height: 16.0),
            Container(width: 5.0),
            const Text("Feedback",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
            const Spacer(),
            CachedNetworkImage(imageUrl:ImageURL.url_289, width: 24.0, height: 24.0),
            Container(width: 10.0)
          ]),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const HTClassFeedbackPage(title: "");
          }));
        });
  }
}
