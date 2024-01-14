///   @ProjectName : ht_new_movpresenter
///   @Author : feng liang
///   @Date   : 2023-11-09 13:56:31
///   @Desc   : 个人中心页面

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/views/play_detailpage.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/favorite_list/bean/history_bean.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/favorite_list/view/setting_watch_list.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/feed_back/view/setting_feedback.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/provider/setting_provider.dart';
import 'package:ht_new_movpresenter/ht_premium_page/family_account_page/view/premium_familypage.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/view/premium_indexerpage.dart';
import 'package:ht_new_movpresenter/provider/main_provider.dart';
import 'package:ht_new_movpresenter/utils/share/ht_share.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:provider/provider.dart';

class HTClassSettingInfoPage extends StatefulWidget {
  const HTClassSettingInfoPage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  State<HTClassSettingInfoPage> createState() => _HTClassSettingInfoPageState();
}

class _HTClassSettingInfoPageState extends State<HTClassSettingInfoPage> {
  final SettingProvider provider = SettingProvider();
  @override
  void initState() {
    super.initState();
    // provider.api1Net();
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
        child: scrollWidget(context),
      ),
    );
  }

  Widget scrollWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          headerWidget(context),
          secondWidget(context),
          historyWidget(context),
          if (HTUserStore.historyList.isNotEmpty) historyList(context),
          watchListWidget(context),
          Container(height: 30),
          shareWidget(context),
          Container(height: 30),
          feedbackWidget(context),
        ],
      ),
    );
  }

  ///第一行
  Widget headerWidget(BuildContext context) {
    return Selector<SettingProvider, bool>(
      selector: (p0, p1) => p1.isReloadHeader,
      builder: ((context, value, child) {
        // print('zzs:1');
        return GestureDetector(
          onTap: () {
            provider.goLogin(context);
          },
          child: Container(
            height: 54 + MediaQuery.of(context).padding.top + 20,
            decoration: const BoxDecoration(
              ///顶部背景
              image: DecorationImage(
                image: CachedNetworkImageProvider(ImageURL.url_244),
                fit: BoxFit.cover,
              ),
              color: Colors.white,
            ),
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
                            //头像
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  HTUserStore.userBean?.userFace ??
                                      ImageURL.url_347),
                            ),
                            borderRadius: BorderRadius.circular(27.0),
                            border: Border.all(color: Colors.white)),
                      ),
                      Container(width: 15.0),
                      HTUserStore.login()
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Spacer(),
                                Text(
                                  HTUserStore.userBean?.userName ?? "",
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                GestureDetector(
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
                                    "Family Account>",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0xff999999)),
                                  ),
                                )
                              ],
                            )
                          : const Text(
                              "Login/Signup",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => provider.goLogin(context),
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
                          child: CachedNetworkImage(
                              imageUrl: ImageURL.url_289,
                              width: 24.0,
                              height: 24.0),
                        ),
                      ),
                      Container(width: 10.0),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  /// 第二行
  Widget secondWidget(BuildContext context) {
    return Selector<MainPovider,bool>(
      selector: (p0, p1) => p1.purchaseRefresh,
      builder: (context, value, child) {
        return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const HTClassUnPremiumPage(
                title: "Premium",
              );
            }),
          );
        },
        child: Container(
            height: 60.0,
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 23.0),
            padding: const EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: CachedNetworkImageProvider(ImageURL.url_280),
                    fit: BoxFit.fill),
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
                        style:
                            TextStyle(color: Color(0xff222222), fontSize: 10.0)),
                  ])
                ])),
      );
      },
    );
  }

  ///第三行  播放历史
  Widget historyWidget(BuildContext context) {
    return GestureDetector(
       onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HTClassWatchListPage(
                  title: "Recently Played",
                  state: 1,
                );
              },
            ),
          );
        },
      child: Row(children: [
        Container(width: 10.0),
        CachedNetworkImage(imageUrl: ImageURL.url_343, width: 16.0, height: 16.0),
        Container(width: 5.0),
        const Text("History",
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.w600)),
        const Spacer(),
        CachedNetworkImage(
            imageUrl: ImageURL.url_289, width: 24.0, height: 24.0),
        Container(width: 10.0)
      ]),
    );
  }

  ///historyListView列表
  Widget historyList(BuildContext context) {
    return Selector<MainPovider, bool>(
      selector: (p0, p1) => p1.historyRefresh,
      builder: (context, value, child) {
        return Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          padding: const EdgeInsets.only(right: 5),
          height: HTUserStore.historyList.isNotEmpty ? 145 : 0,
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HTClassVideoDetailPage(
                m_type_2: model.mType2 ?? "",
                id: model.id ?? "",
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          topPart(model),
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 20,
            width: 84,
            child: Text(
              model.title ?? '',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xff828386), fontSize: 8.0),
            ),
          ),
        ],
      ),
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
          CachedNetworkImage(
              imageUrl: ImageURL.url_268,
              width: 24.0,
              height: 24.0,
              fit: BoxFit.fill),
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
  Widget watchListWidget(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(top: 30, left: 10),
        color: Colors.transparent,
        child: Row(children: [
          CachedNetworkImage(
              imageUrl: ImageURL.url_344, width: 16.0, height: 16.0),
          Container(width: 5.0),
          const Text("Watchlist",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500)),
          const Spacer(),
          CachedNetworkImage(
              imageUrl: ImageURL.url_289, width: 24.0, height: 24.0),
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
  Widget shareWidget(BuildContext context) {
    return GestureDetector(
        child: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(left: 10),
          child: Row(children: [
            CachedNetworkImage(
                imageUrl: ImageURL.url_345, width: 16.0, height: 16.0),
            Container(width: 5.0),
            const Text("Share",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
            const Spacer(),
            CachedNetworkImage(
                imageUrl: ImageURL.url_289, width: 24.0, height: 24.0),
            Container(width: 10.0)
          ]),
        ),
        onTap: () {
          HTShare().share("app", "", "0", "", "");
        });
  }

  ///feedback
  Widget feedbackWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HTClassFeedbackPage(
                title: 'Feedback',
              );
            },
          ),
        );
      },
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.only(left: 10),
        child: Row(children: [
          CachedNetworkImage(
              imageUrl: ImageURL.url_346, width: 16.0, height: 16.0),
          Container(width: 5.0),
          const Text("Feedback",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500)),
          const Spacer(),
          CachedNetworkImage(
              imageUrl: ImageURL.url_289, width: 24.0, height: 24.0),
          Container(width: 10.0)
        ]),
      ),
    );
  }
}
