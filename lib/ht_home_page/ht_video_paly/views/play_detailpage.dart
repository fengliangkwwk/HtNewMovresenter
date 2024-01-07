///播放页面
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/bean/ht_season_and_episode_bean.dart'
    as desc;
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/bean/ht_season_and_episode_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/bean/ht_video_desc_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/views/custom_player_view.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/views/tv_play_all_episodes.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/views/tv_play_part.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/feed_back/view/setting_feedback.dart';
import 'package:ht_new_movpresenter/provider/main_provider.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:ht_new_movpresenter/utils/share/ht_share.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class HTClassVideoDetailPage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const HTClassVideoDetailPage(
      // ignore: non_constant_identifier_names
      {Key? key,
      // ignore: non_constant_identifier_names
      required this.m_type_2,
      required this.id})
      : super(key: key);

  ///"m_type_2": "myfx",// myfx电影，tt_mflx电视剧
  // ignore: non_constant_identifier_names
  final String m_type_2;

  ///电影 id 或者 电视剧 id
  final String id;
  @override
  State<HTClassVideoDetailPage> createState() => _HTClassVideoDetailPageState();
}

class _HTClassVideoDetailPageState extends State<HTClassVideoDetailPage>with WidgetsBindingObserver {
  bool isSaved = false;
  final HTVideoDescProvider provider = HTVideoDescProvider();

  @override
  void initState() {
    provider.loadData(widget.m_type_2, widget.id);
        WidgetsBinding.instance.addObserver(this);

    // provider.playerOption();
    super.initState();
    
  }
  @override
void didChangeAppLifecycleState(AppLifecycleState state) {
  provider.didChangeAppLifecycleState(state,context);
}

  @override
  void dispose() {
    super.dispose();
    provider.addHistoryAciton();
    provider.dismissEasyLoading();
    provider.player.release();
  }

  @override
  Widget build(BuildContext context) {
    // FijkPlugin.keepScreenOn(true);
    return ChangeNotifierProvider(
      create: (context) => provider,
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Selector<
              HTVideoDescProvider,
              Tuple5<bool, HtVideoDescBean?, desc.HtSeasonAndEpisodeBean?, bool,
                  bool>>(
            selector: (p0, p1) => Tuple5(p1.isAllEpisodes, p1.videoDescBean,
                p1.tv202Bean, p1.htVarInfoShown, p1.isCollected),
            builder: (context, value, child) {
              return Column(
                children: [
                  ///播放器
                  videoPlayerViewWidget(),
                  ///带背景图的第一行
                  firstPartWidget(),

                  ///AllEpisodes界面
                  Visibility(
                    visible: value.item1,
                    child: const Expanded(child: AllEpisodesWidget()),
                  ),
                  Visibility(
                    visible: !value.item1,
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ///第二行标题哪一行
                            secondPartWidget(),

                            ///第三行评分那一行
                            scorePartWidget(),

                            ///第四行moreInfo按钮那一行
                            moreInfoClickPartWidget(),

                            ///moreInfo内容那一行
                            moreInfoWidget(),

                            ///分享那一行
                            sharePartWidget(),
                            ///如果是电视剧播放页的话会有这部分
                            (widget.m_type_2 == 'tt_mflx')
                                ? TVPlayPartWidget()
                                : Container(
                                    height: 0,
                                  ),
                            ///专题列表那部分
                            ...creatspecialSubjectListWidget(),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          )),
    );
  }

  ///播放器
  Widget videoPlayerViewWidget() {
    return Container(
        // height: 220.0,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(children: [
          Container(
            color: Colors.red,
            child: FijkView(
              width: double.infinity,
              height: 220,
              player: provider.player,
              fit: FijkFit.cover,
              fsFit: FijkFit.cover,
              panelBuilder: fijkPanel2Builder1(
                  callBack: provider.playerCallBack,
                  isSave: provider.isSave(provider.dataId)),
              // panelBuilder: (player, data, context, viewSize, texturePos) {
              //   return const CustomPlayerView();
              // },
            ),
          ),
          Positioned(
              left: 10,
              top: 11,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CachedNetworkImage(
                  imageUrl: ImageURL.url_291,
                  width: 24.0,
                  height: 24.0,
                  fit: BoxFit.fill,
                ),
              )),
        ]));
  }

  ///带背景图的第一行
  Widget firstPartWidget() {
    return GestureDetector(
      onTap: () => provider.jumpToPremiumPage(context),
      child: Visibility(
        visible: !mainProvider.subscriptionPurchaseState(),
        child: Container(
            height: 60.0,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      ImageURL.url_252,
                    ),
                    fit: BoxFit.fill)),
            child: Row(

                ///均等分
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                            imageUrl: ImageURL.url_260,
                            width: 20.0,
                            height: 20.0),
                        Container(
                            margin: const EdgeInsets.only(top: 2.5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 0.0),
                            child: const Text("Remove\r\nAll Ads",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff685034), fontSize: 10.0)))
                      ]),
                  // Container(width: 37.5),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                            imageUrl: ImageURL.url_261,
                            width: 20.0,
                            height: 20.0),
                        Container(
                            margin: const EdgeInsets.only(top: 2.5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 0.0),
                            child: const Text("Unlock\r\nAll Ads",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff685034), fontSize: 10.0)))
                      ]),
                  // Container(width: 37.5),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                            imageUrl: ImageURL.url_262,
                            width: 20.0,
                            height: 20.0),
                        Container(
                            margin: const EdgeInsets.only(top: 2.5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 0.0),
                            child: const Text("Unlimited\r\nScreen Casting",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff685034), fontSize: 10.0)))
                      ]),
                  const Text("Get Premium",
                      style: TextStyle(
                          color: Color(0xff685034),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600)),
                ])),
      ),
    );
  }

  ///第二行标题那部分
  Widget secondPartWidget() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20.0, left: 10.0),
      child: Text(
        provider.title(),
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  ///第三行评分那一行
  Widget scorePartWidget() {
    return Container(
        margin: const EdgeInsets.only(top: 8.0, left: 10.0),
        child: Row(children: [
          ///星级评分
          RatingBar(
            initialRating: provider.rate(),
            direction: Axis.horizontal,
            allowHalfRating: false,
            ignoreGestures: true,
            itemCount: 5,
            itemSize: 19.0,
            ratingWidget: RatingWidget(
              full: CachedNetworkImage(imageUrl: ImageURL.url_44),
              half: CachedNetworkImage(imageUrl: ImageURL.url_46),
              empty: CachedNetworkImage(imageUrl: ImageURL.url_45),
            ),
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            onRatingUpdate: (double value) {},
          ),
          Container(width: 8.0),
          Text(
            provider.rate().toString(),
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
          Container(width: 8.0),
          const Text(
            "|",
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xff2D2F33),
            ),
          ),
          Container(width: 8.0),
          Text(provider.year(),
              style: const TextStyle(fontSize: 14.0, color: Colors.white)),
          Container(width: 8.0),
          const Text("|",
              style: TextStyle(fontSize: 14.0, color: Color(0xff2D2F33))),
          Container(width: 8.0),
          Expanded(
            child: Text(
              provider.country(),
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          ),
        ]));
  }

  ///moreInfo 点击按钮那一行
  Widget moreInfoClickPartWidget() {
    return Container(
        margin:
            const EdgeInsets.only(top: 8.0, left: 10.0, bottom: 0.0, right: 10),
        child: Row(children: [
          const Text("Animation",
              style: TextStyle(fontSize: 14.0, color: Color(0xff999999))),
          Container(width: 8.0),
          const Text("|",
              style: TextStyle(fontSize: 14.0, color: Color(0xff2D2F33))),
          Container(width: 8.0),
          const Text("Comedy",
              style: TextStyle(fontSize: 14.0, color: Color(0xff999999))),
          Container(width: 8.0),
          const Text("|",
              style: TextStyle(fontSize: 14.0, color: Color(0xff2D2F33))),
          Container(width: 8.0),
          const Text("Family",
              style: TextStyle(fontSize: 14.0, color: Color(0xff999999))),
          Container(width: 8.0),
          const Text("|",
              style: TextStyle(fontSize: 14.0, color: Color(0xff2D2F33))),
          Container(width: 8.0),
          const Text("Music",
              style: TextStyle(fontSize: 14.0, color: Color(0xff999999))),
          const Spacer(),
          Visibility(
            visible: !provider.htVarInfoShown,
            child: GestureDetector(
              child: Row(children: [
                const Text("More Info",
                    style: TextStyle(fontSize: 14.0, color: Color(0xff999999))),
                Container(width: 2.0),
                CachedNetworkImage(
                    imageUrl: ImageURL.url_302, width: 16.0, height: 16.0),
              ]),
              onTap: () {
                provider.moreInfoEvent();
              },
            ),
          ),
        ]));
  }

  ///第五行分享那一行
  Widget sharePartWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, left: 10.0, bottom: 0.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(width: 15.0),
        GestureDetector(
          onTap: provider.saveAction,
          child: Column(children: [
            ///ImageURL.url_258已收藏   ImageURL.url_259未收藏
            CachedNetworkImage(
                imageUrl:
                    provider.isCollected ? ImageURL.url_258 : ImageURL.url_259,
                width: 22,
                height: 22),
            Container(height: 5.0),
            const Text("My List",
                style: TextStyle(color: Colors.white, fontSize: 10.0)),
          ]),
        ),
        Container(width: 40.0),
        GestureDetector(
          onTap: (() {
            HTShare().share(widget.m_type_2, provider.playLock(), "1",
                provider.videoId(), provider.title());
          }),
          child: Column(children: [
            CachedNetworkImage(
                imageUrl: ImageURL.url_105, width: 22, height: 22),

            ///105
            Container(height: 5.0),
            const Text("Share",
                style: TextStyle(color: Colors.white, fontSize: 10.0)),
          ]),
        ),
        Container(width: 40.0),
        GestureDetector(
          ///跳转到反馈界面
          onTap: (() {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return (widget.m_type_2 == 'tt_mflx')
                  ? HTClassFeedbackPage(
                      title: 'Feedback',
                      vid: provider.videoId(),
                      sid: provider.sid,
                      eid: provider.eid,
                    )
                  : HTClassFeedbackPage(
                      title: 'Feedback',
                      vid: provider.videoId(),
                    );
            }));
          }),
          child: Column(children: [
            CachedNetworkImage(
                imageUrl: ImageURL.url_100, width: 22, height: 22),
            Container(height: 5.0),
            const Text("Feedback",
                style: TextStyle(color: Colors.white, fontSize: 10.0)),
          ]),
        )
      ]),
    );
  }

  ///点击 more info 的更多内容
  Widget moreInfoWidget() {
    var dataList = provider.actionList();
    return Visibility(
        visible: provider.htVarInfoShown,
        child: Container(
          margin: const EdgeInsets.only(top: 20.0, left: 10.0, bottom: 0.0),
          child: Column(children: [
            Visibility(
              visible: dataList?.isNotEmpty == true,
              child: SizedBox(
                  height: 83.0,
                  child: ListView.builder(
                    itemCount: dataList?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var model = dataList?[index];
                      return Container(
                          margin: const EdgeInsets.only(right: 15.0),
                          width: 50.0,
                          child: Column(children: [
                            Expanded(
                              child: CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(
                                  model?.cover ?? '',
                                ),
                                radius: 25.0,
                              ),
                            ),
                            Container(height: 5.0),
                            Container(
                              height: 30,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 0.0),
                              child: Text(
                                provider.isTV()
                                    ? model?.starName ?? ''
                                    : model?.title ?? '',
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ]));
                    },
                  )),
            ),
            Container(
                height: 1.0,
                margin: const EdgeInsets.fromLTRB(10.0, 19.0, 10.0, 20.0),
                color: const Color(0xff2A2C40)),
            Row(children: [
              Container(width: 10.0),
              const Text("Info",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            ]),
            Container(
              margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Text(
                provider.info(),
                style: const TextStyle(
                    color: Color(0xff999999), fontSize: 14.0, height: 1.5),
              ),
            ),
            InkWell(
              onTap: () {
                provider.moreInfoEvent();
              },
              child: const Center(
                child: Image(
                  image: CachedNetworkImageProvider(ImageURL.url_303),
                  width: 24,
                  height: 24,
                ),
              ),
            )
          ]),
        ));
  }

  List<Widget> creatspecialSubjectListWidget() {
    var listRes = <Widget>[];
    var dataList = provider.projectList();
    for (var element in dataList ?? []) {
      if (element.dataType == '1' &&
          (element.data.length > 0 || element.data != null)) {
        listRes.add(specialSubjectTitleWidget(element.name));
        listRes.add(specialSubjectWidget(element));
      }
    }
    return listRes;
  }

  ///专题列表title那一部分
  Widget specialSubjectTitleWidget(String titleName) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, left: 10.0, bottom: 0.0),
      child: Row(children: [
        Text(titleName,
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w600)),
      ]),
    );
  }

  ///专题列表
  Widget specialSubjectWidget(dynamic data) {
    var dataList = data.data;
    return Container(
      height: 193.0,
      margin: const EdgeInsets.only(top: 11.0, bottom: 0.0, right: 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataList?.length,
        itemBuilder: (context, index) {
          var model = dataList?[index];
          return GestureDetector(
            onTap: () {
              // provider.loadData(model.mType2, model.id);
              provider.changePlayerType(model.mType2 ?? '', model.id ?? '');
            },
            child: Container(
                width: 112.0,
                margin: const EdgeInsets.only(right: 5.0),
                child: Stack(children: [
                  CachedNetworkImage(
                    imageUrl: model.cover ?? '',
                    height: 158.0,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                      left: 5.0,
                      top: 5.0,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(model.rate ?? '',
                                style: const TextStyle(
                                    color: Color(0xffFF6D1C),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600)),
                          ])),
                  Visibility(
                    visible: model.mType2 == 'tt_mflx' ? true : false,
                    child: Positioned(
                        bottom: 34.0,
                        width: 112.0,
                        child: Container(
                            height: 24.0,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                  Colors.transparent,
                                  Colors.black
                                ])),
                            child: const Row(children: [
                              Spacer(),
                              Text("NEW",
                                  style: TextStyle(
                                      color: Color(0xffFF6D1C), fontSize: 8.0)),
                              Text("|S07 E08",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8.0))
                            ]))),
                  ),
                  Positioned(
                      top: 163.0,
                      left: 5.0,
                      right: 5.0,
                      child: Text(model.title ?? '',
                          maxLines: 2,
                          style: const TextStyle(
                              color: Color(0xff828386), fontSize: 12.0)))
                ])),
          );
        },
      ),
    );
  }
}
