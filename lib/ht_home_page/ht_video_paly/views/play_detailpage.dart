/**
 * 电影播放页
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/views/tv_play_all_episodes.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/views/tv_play_part.dart';
import 'package:ht_new_movpresenter/utils/url_getImageurl.dart';
import 'package:provider/provider.dart';

class HTClassVideoDetailPage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const HTClassVideoDetailPage(
      {Key? key, required this.m_type_2, required this.id})
      : super(key: key);
  // ignore: non_constant_identifier_names
  final String m_type_2;

  ///"m_type_2": "myfx",// myfx电影，tt_mflx电视剧
  final String id;

  ///电影 id 或者 电视剧 id

  @override
  State<HTClassVideoDetailPage> createState() => _HTClassVideoDetailPageState();
}

class _HTClassVideoDetailPageState extends State<HTClassVideoDetailPage> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  final List<String> videoList = [
    'http://playertest.longtailvideo.com/adaptive/bipbop/gear4/prog_index.m3u8',
    'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
    'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4',
    'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
  ];
    final HTVideoDescProvider videoDescProvider = HTVideoDescProvider();

  FijkPlayer player = FijkPlayer();

  ///more info 是否展开
  var _htVarInfoShown = false;

  /// isAllEpisodes 是否展开剧集详情
  var isAllEpisodes = false;
 // 回调函数，用于接收子widget传递的数据
  void allEpisodesEvent(bool isEpisodesDes) {
    print('点击了大块头点击了大块头');
    isAllEpisodes = isEpisodesDes;
    setState(() {});
  }
  
  @override
  void initState() {
    videoDescProvider.loadData(widget.m_type_2, widget.id);
    if (videoList[2].contains("rtsp")) {
      //rtsp视频关键配置
      player.setOption(FijkOption.formatCategory, "rtsp_transport", "tcp");
      // fijkPlayer 初始化不启用缓冲，避免画面卡死不动
      player.setOption(FijkOption.playerCategory, 'packet-buffering', 0);
      player.setOption(FijkOption.playerCategory, 'framedrop', 1);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    FijkPlugin.keepScreenOn(true);
    return ChangeNotifierProvider(
      create: (context) => videoDescProvider,
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [

              ///播放器
              videoPlayerViewWidget(),
    
              ///带背景图的第一行
              firstPartWidget(),
    
              ///AllEpisodes界面
              Visibility(
                visible: isAllEpisodes,
                child: const Expanded(child: AllEpisodesWidget()),
              ),
              Visibility(
                visible: !isAllEpisodes,
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
                            ? TVPlayPartWidget(allEpisodesEvent: allEpisodesEvent)
                            : Container(
                                height: 0,
                              ),
    
                        ///专题 title 那一行
                        specialSubjectTitleWidget(),
    
                        ///专题列表那部分
                        specialSubjectListWidget(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

 
  ///播放器
  Widget videoPlayerViewWidget() {
    return Container(
        height: 220.0,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(children: [
          FijkView(
            width: double.infinity,
            height: 220,
            player: player,
            fit: FijkFit.fill,
            fsFit: FijkFit.fill,
            panelBuilder: fijkPanel2Builder(),
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
          Positioned(
              right: 11.0,
              top: 10.0,
              child: Row(children: [
                CachedNetworkImage(
                    imageUrl: ImageURL.url_249, width: 100.0, height: 26.0),

                ///remove ads 图标
                Container(width: 10.0),
                CachedNetworkImage(
                    imageUrl: ImageURL.url_315, width: 24.0, height: 24.0),

                ///cc 图标
                Container(width: 10.0),
                CachedNetworkImage(
                    imageUrl: ImageURL.url_329, width: 24.0, height: 24.0),

                ///投屏图标
              ]))
        ]));
  }

  ///带背景图的第一行
  Widget firstPartWidget() {
    return Container(
        height: 60.0,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(
                  ImageURL.url_252,
                ),
                fit: BoxFit.fill)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(width: 25.0),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                    imageUrl: ImageURL.url_260, width: 20.0, height: 20.0),
                Container(
                    margin: const EdgeInsets.only(top: 2.5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 0.0),
                    child: const Text("Remove\r\nAll Ads",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff685034), fontSize: 10.0)))
              ]),
          Container(width: 37.5),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                    imageUrl: ImageURL.url_261, width: 20.0, height: 20.0),
                Container(
                    margin: const EdgeInsets.only(top: 2.5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 0.0),
                    child: const Text("Unlock\r\nAll Ads",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff685034), fontSize: 10.0)))
              ]),
          Container(width: 37.5),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                    imageUrl: ImageURL.url_262, width: 20.0, height: 20.0),
                Container(
                    margin: const EdgeInsets.only(top: 2.5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 0.0),
                    child: const Text("Unlimited\r\nScreen Casting",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff685034), fontSize: 10.0)))
              ]),
          const Spacer(),
          const Text("Get Premium",
              style: TextStyle(
                  color: Color(0xff685034),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600)),
          Container(width: 20.0)
        ]));
  }

  ///第二行那部分
  Widget secondPartWidget() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20.0, left: 10.0),
      child: const Text(
        "Riverdance:the animated adventure",
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600),
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
            initialRating: 3.5,
            direction: Axis.horizontal,
            allowHalfRating: true,
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
          const Text("7.5",
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
          Container(width: 8.0),
          const Text("|",
              style: TextStyle(fontSize: 14.0, color: Color(0xff2D2F33))),
          Container(width: 8.0),
          const Text("2022",
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
          Container(width: 8.0),
          const Text("|",
              style: TextStyle(fontSize: 14.0, color: Color(0xff2D2F33))),
          Container(width: 8.0),
          const Text("United States",
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
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
              visible: !_htVarInfoShown,
              child: GestureDetector(
                  child: Row(children: [
                    const Text("More Info",
                        style: TextStyle(
                            fontSize: 14.0, color: Color(0xff999999))),
                    Container(width: 2.0),
                    CachedNetworkImage(
                        imageUrl: ImageURL.url_302, width: 16.0, height: 16.0),
                  ]),
                  onTap: () {
                    setState(() {
                      if (_htVarInfoShown == false) {
                        _htVarInfoShown = true;
                      } else {
                        _htVarInfoShown = false;
                      }
                    });
                  })),
        ]));
  }

  ///第五行分享那一行
  Widget sharePartWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, left: 10.0, bottom: 0.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(width: 15.0),
        Column(children: [
          CachedNetworkImage(imageUrl: ImageURL.url_258, width: 22, height: 22),

          ///258
          Container(height: 5.0),
          const Text("My List",
              style: TextStyle(color: Colors.white, fontSize: 10.0)),
        ]),
        Container(width: 40.0),
        Column(children: [
          CachedNetworkImage(imageUrl: ImageURL.url_105, width: 22, height: 22),

          ///105
          Container(height: 5.0),
          const Text("Share",
              style: TextStyle(color: Colors.white, fontSize: 10.0)),
        ]),
        Container(width: 40.0),
        Column(children: [
          CachedNetworkImage(imageUrl: ImageURL.url_100, width: 22, height: 22),
          Container(height: 5.0),
          const Text("Feedback",
              style: TextStyle(color: Colors.white, fontSize: 10.0)),
        ])
      ]),
    );
  }

  ///点击 more info 的更多内容
  Widget moreInfoWidget() {
    return Visibility(
        visible: _htVarInfoShown,
        child: Container(
          margin: const EdgeInsets.only(top: 20.0, left: 10.0, bottom: 0.0),
          child: Column(children: [
            SizedBox(
                height: 83.0,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  scrollDirection: Axis.horizontal,
                  children: [1, 2, 3, 4, 5, 6, 7, 8]
                      .map((index) => Container(
                          margin: const EdgeInsets.only(right: 15.0),
                          width: 50.0,
                          child: Column(children: [
                            const CircleAvatar(
                                backgroundImage:
                                    AssetImage("image/pic_banner_test.png"),
                                radius: 25.0),
                            Container(height: 5.0),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 0.0),
                                child: const Text("yanyuanmingzi",
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.0)))
                          ])))
                      .toList(),
                )),
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
                child: const Text(
                    "when van helsing’s mysterious invention,the “mons-terfiction ray,”goes haywire,drac and his monster palare when van helsing’s mysterious invention,the “monsterfiction ray,”goes haywire,drac and his monster pal arewhen van helsing’s mysterious invention,the “mons-terfiction ray,”goes haywire,drac and his monster palare when van helsing’s mysterious invention,the “monsterfiction ray,”goes haywire,drac and his monster pal arewhen van helsing’s mysterious invention,the “mons-terfiction ray,”goes haywire,drac and his monster palare when van helsing’s mysterious invention,the “monsterfiction ray,”goes haywire,drac and his monster pal are",
                    style: TextStyle(
                        color: Color(0xff999999),
                        fontSize: 14.0,
                        height: 1.5))),
            InkWell(
              onTap: () {
                setState(() {
                  if (_htVarInfoShown == false) {
                    _htVarInfoShown = true;
                  } else {
                    _htVarInfoShown = false;
                  }
                });
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

  ///专题列表title那一部分
  Widget specialSubjectTitleWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, left: 10.0, bottom: 0.0),
      child: const Row(children: [
        Text("Trending",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w600)),
        Spacer(),
        // CachedNetworkImage(
        //     imageUrl: ImageURL.url_308, width: 24.0, height: 24.0),
      ]),
    );
  }

  ///专题列表
  Widget specialSubjectListWidget() {
    return Container(
      height: 192.0,
      margin: const EdgeInsets.only(top: 11.0, bottom: 0.0, right: 0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [1, 2, 3, 4, 5]
            .map(
              (index) => GestureDetector(
                child: Container(
                    width: 112.0,
                    margin: const EdgeInsets.only(right: 5.0),
                    child: Stack(children: [
                      CachedNetworkImage(
                          imageUrl: imgList[2],
                          height: 158.0,
                          fit: BoxFit.fill),
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
                      Positioned(
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
                                        color: Color(0xffFF6D1C),
                                        fontSize: 8.0)),
                                Text("|S07 E08",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8.0))
                              ]))),
                      const Positioned(
                          top: 163.0,
                          left: 5.0,
                          right: 5.0,
                          child: Text("Minions:The Rise of Gru",
                              maxLines: 2,
                              style: TextStyle(
                                  color: Color(0xff828386), fontSize: 12.0)))
                    ])),
                onTap: () {},
              ),
            )
            .toList(),
      ),
    );
  }
}
