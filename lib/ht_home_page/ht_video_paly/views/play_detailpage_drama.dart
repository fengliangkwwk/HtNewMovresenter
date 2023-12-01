/**
 * 电视剧播放页
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';

class HTClassDramaDetailPage extends StatefulWidget {
  const HTClassDramaDetailPage({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<HTClassDramaDetailPage> createState() => _HTClassDramaDetailPageState();
}

class _HTClassDramaDetailPageState extends State<HTClassDramaDetailPage> {
  var _htVarInfoShown = false;
  var _htVarScrollController = ScrollController();
  final FijkPlayer _htVarplayer = FijkPlayer();
  var _htVarSubtScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            controller: _htVarScrollController,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  height: 220.0,
                  margin:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  child: Stack(children: [
                    FijkView(
                      player: _htVarplayer,
                      fit: FijkFit.fill,
                      fsFit: FijkFit.fill,
                      panelBuilder: fijkPanel2Builder(),
                    ),
                    Positioned(
                        child: CachedNetworkImage(imageUrl: ImageURL.url_291,width: 24.0,
                          height: 24.0,
                          fit: BoxFit.fill
                        ),
                        left: 10.0,
                        top: 11.0),
                    Positioned(
                        right: 11.0,
                        top: 10.0,
                        child: Row(children: [
                          CachedNetworkImage(imageUrl:ImageURL.url_249,width: 100.0,height: 26.0),
                          Container(width: 10.0),
                          GestureDetector(
                              child:CachedNetworkImage(imageUrl: ImageURL.url_315,width: 24.0, height: 24.0),
                              onTap: () {
                                showModalBottomSheet(
                                    builder: (BuildContext context1) {
                                      return Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              270,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              2,
                                          color: Color(0xff111218),
                                          child: ListView(
                                              controller:
                                                  _htVarSubtScrollController,
                                              scrollDirection: Axis.horizontal,
                                              children: [1, 2]
                                                  .map((index) => index == 1
                                                      ? Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child: Column(
                                                              children: [
                                                                Container(
                                                                    height:
                                                                        51.0,
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    color: Color(
                                                                        0xff191B21),
                                                                    child: Row(
                                                                        children: [
                                                                          Container(
                                                                              width: 16.0),
                                                                          Image.asset(
                                                                              "image/icon_play_subtitle_exit.png",
                                                                              width: 16.0,
                                                                              height: 16.0),
                                                                          Expanded(
                                                                              child: Container(alignment: Alignment.center, child: Text("Subtitles", style: TextStyle(color: Color(0xffECECEC), fontSize: 18.0, fontWeight: FontWeight.w600)))),
                                                                          Container(
                                                                              width: 32.0),
                                                                        ])),
                                                                Container(
                                                                    margin: EdgeInsets.only(
                                                                        top:
                                                                            20.0,
                                                                        left:
                                                                            16.0),
                                                                    child: Row(
                                                                        children: [
                                                                          Image.asset(
                                                                              "image/icon_play_subtitle_off.png",
                                                                              width: 26.0,
                                                                              height: 26.0),
                                                                          Container(
                                                                              width: 10.0),
                                                                          Text(
                                                                              "Turn on Subtitles",
                                                                              style: TextStyle(color: Color(0xffECECEC), fontSize: 16.0)),
                                                                        ])),
                                                                GestureDetector(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(top: 24.0, left: 16.0),
                                                                        child: Row(children: [
                                                                          Image.asset(
                                                                              "image/icon_play_languages.png",
                                                                              width: 26.0,
                                                                              height: 26.0),
                                                                          Container(
                                                                              width: 10.0),
                                                                          Text(
                                                                              "Switch Languages",
                                                                              style: TextStyle(color: Color(0xffECECEC), fontSize: 16.0)),
                                                                        ])),
                                                                    onTap: () {
                                                                      _htVarSubtScrollController.animateTo(
                                                                          MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          duration: Duration(
                                                                              milliseconds:
                                                                                  500),
                                                                          curve:
                                                                              Curves.ease);
                                                                    }),
                                                              ]))
                                                      : Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child: Column(
                                                              children: [
                                                                Container(
                                                                    height:
                                                                        51.0,
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    color: Color(
                                                                        0xff191B21),
                                                                    child: Row(
                                                                        children: [
                                                                          Container(
                                                                              width: 16.0),
                                                                          Image.asset(
                                                                              "image/icon_play_language_back.png",
                                                                              width: 16.0,
                                                                              height: 16.0),
                                                                          Container(
                                                                              width: 10.0),
                                                                          Text(
                                                                              "Switch Language",
                                                                              style: TextStyle(color: Color(0xffECECEC), fontSize: 18.0, fontWeight: FontWeight.w600)),
                                                                          Container(
                                                                              width: 32.0),
                                                                        ])),
                                                                Expanded(
                                                                    child:
                                                                        ListView(
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  children: [
                                                                    1,
                                                                    2,
                                                                    3,
                                                                    4,
                                                                    5
                                                                  ]
                                                                      .map((index) => Container(
                                                                          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                                                                          height: 48.0,
                                                                          decoration: BoxDecoration(color: Color(0xff111218)),
                                                                          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                            Image.asset("image/icon_play_language_h.png",
                                                                                width: 16.0,
                                                                                height: 16.0),
                                                                            Container(width: 8.0),
                                                                            Text(
                                                                              "Chinese-Chinese Simplefied",
                                                                              style: TextStyle(color: Colors.white, fontSize: 14.0),
                                                                              maxLines: 1,
                                                                            ),
                                                                          ])))
                                                                      .toList(),
                                                                ))
                                                              ])))
                                                  .toList()));
                                    },
                                    backgroundColor: Colors.transparent, //重要
                                    context: context);
                              }),
                          Container(width: 10.0),
                          GestureDetector(
                              child: Image.asset("image/icon_player_tv.png",
                                  width: 24.0, height: 24.0),
                              onTap: () {
                                htMethodshowScreenSheet(context);
                              }),
                        ]))
                  ])),
              Container(
                  height: 60.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("image/pic_play_premium_bg.png"),
                          fit: BoxFit.fill)),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(width: 25.0),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("image/icon_play_forbidden.png",
                                  width: 20.0, height: 20.0),
                              Container(
                                  margin: EdgeInsets.only(top: 2.5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 0.0),
                                  child: Text("Remove\r\nAll Ads",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff685034),
                                          fontSize: 10.0)))
                            ]),
                        Container(width: 37.5),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("image/icon_play_movplay.png",
                                  width: 20.0, height: 20.0),
                              Container(
                                  margin: EdgeInsets.only(top: 2.5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 0.0),
                                  child: Text("Unlock\r\nAll Ads",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff685034),
                                          fontSize: 10.0)))
                            ]),
                        Container(width: 37.5),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("image/icon_play_movtv.png",
                                  width: 20.0, height: 20.0),
                              Container(
                                  margin: EdgeInsets.only(top: 2.5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 0.0),
                                  child: Text("Unlimited\r\nScreen Casting",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff685034),
                                          fontSize: 10.0)))
                            ]),
                        Spacer(),
                        Text("Get Premium",
                            style: TextStyle(
                                color: Color(0xff685034),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600)),
                        Container(width: 20.0)
                      ])),
              Container(
                  margin: EdgeInsets.only(top: 26.0, left: 10.0),
                  child: Text("Riverdance:the animated adventure",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600))),
              Container(
                  margin: EdgeInsets.only(top: 8.0, left: 10.0),
                  child: Row(children: [
                    RatingBar(
                        initialRating: 3,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 19.0,
                        ratingWidget: RatingWidget(
                          full: Image.asset('image/icon_play_rating_full.png'),
                          half: Image.asset('image/icon_play_rating_half.png'),
                          empty: Image.asset('image/icon_play_rating_none.png'),
                        ),
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        onRatingUpdate: (rating) {
                          print(rating);
                        }),
                    Container(width: 8.0),
                    Text("7.5",
                        style: TextStyle(fontSize: 14.0, color: Colors.white)),
                    Container(width: 8.0),
                    Text("|",
                        style: TextStyle(
                            fontSize: 14.0, color: Color(0xff2D2F33))),
                    Container(width: 8.0),
                    Text("2022",
                        style: TextStyle(fontSize: 14.0, color: Colors.white)),
                    Container(width: 8.0),
                    Text("|",
                        style: TextStyle(
                            fontSize: 14.0, color: Color(0xff2D2F33))),
                    Container(width: 8.0),
                    Text("United States",
                        style: TextStyle(fontSize: 14.0, color: Colors.white)),
                  ])),
              Container(
                  margin: EdgeInsets.only(top: 8.0, left: 10.0, bottom: 20.0),
                  child: Row(children: [
                    Text("Animation",
                        style: TextStyle(
                            fontSize: 14.0, color: Color(0xff999999))),
                    Container(width: 8.0),
                    Text("|",
                        style: TextStyle(
                            fontSize: 14.0, color: Color(0xff2D2F33))),
                    Container(width: 8.0),
                    Text("Comedy",
                        style: TextStyle(
                            fontSize: 14.0, color: Color(0xff999999))),
                    Container(width: 8.0),
                    Text("|",
                        style: TextStyle(
                            fontSize: 14.0, color: Color(0xff2D2F33))),
                    Container(width: 8.0),
                    Text("Family",
                        style: TextStyle(
                            fontSize: 14.0, color: Color(0xff999999))),
                    Container(width: 8.0),
                    Text("|",
                        style: TextStyle(
                            fontSize: 14.0, color: Color(0xff2D2F33))),
                    Container(width: 8.0),
                    Text("Music",
                        style: TextStyle(
                            fontSize: 14.0, color: Color(0xff999999))),
                    Spacer(),
                    Offstage(
                        offstage: _htVarInfoShown,
                        child: GestureDetector(
                            child: Row(children: [
                              Text("More Info",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Color(0xff999999))),
                              Container(width: 2.0),
                              Image.asset("image/icon_play_tag_more.png",
                                  width: 16.0, height: 16.0),
                            ]),
                            onTap: () {
                              setState(() {
                                _htVarInfoShown = true;
                              });
                            })),
                    Container(width: 10.0),
                  ])),
              Offstage(
                  offstage: _htVarInfoShown,
                  child: Column(children: [
                    Container(height: 10.0),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 15.0),
                          Column(children: [
                            Image.asset("image/icon_play_tasks.png",
                                width: 22, height: 22),
                            Container(height: 5.0),
                            Text("My List",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.0)),
                          ]),
                          Container(width: 40.0),
                          Column(children: [
                            Image.asset("image/icon_play_share.png",
                                width: 22, height: 22),
                            Container(height: 5.0),
                            Text("Share",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.0)),
                          ]),
                          Container(width: 40.0),
                          Column(children: [
                            Image.asset("image/icon_play_feedback.png",
                                width: 22, height: 22),
                            Container(height: 5.0),
                            Text("Feedback",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.0)),
                          ])
                        ]),
                    Container(height: 30.0),
                    Row(children: [
                      GestureDetector(
                          child: Container(
                              margin: EdgeInsets.only(left: 10.0),
                              width: 95.0,
                              height: 28.0,
                              decoration: BoxDecoration(
                                  color: Color(0xff23252A),
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Season 1",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0)),
                                    Container(width: 6.0),
                                    Image.asset(
                                        "image/icon_play_episode_down.png",
                                        width: 10.0,
                                        height: 8.0)
                                  ])),
                          onTap: () {
                            showQudsPopupMenu(
                                context: context,
                                backgroundColor: Color(0xff23252A),
                                startOffset: Offset(
                                    0,
                                    650.0 -
                                        _htVarScrollController.offset * 1.5),
                                items: [
                                  QudsPopupMenuItem(
                                      title: Text(
                                        'episode 1',
                                        style: TextStyle(
                                            color: Color(0xffECECEC),
                                            fontSize: 14.0),
                                      ),
                                      onPressed: () {}),
                                  QudsPopupMenuItem(
                                      title: Text('episode 2',
                                          style: TextStyle(
                                              color: Color(0xffECECEC),
                                              fontSize: 14.0)),
                                      onPressed: () {}),
                                  QudsPopupMenuItem(
                                      title: Text('episode 3',
                                          style: TextStyle(
                                              color: Color(0xffECECEC),
                                              fontSize: 14.0)),
                                      onPressed: () {}),
                                ]);
                          }),
                      Spacer(),
                      GestureDetector(
                          child: Row(children: [
                            Text("All Episodes",
                                style: TextStyle(
                                    color: Color(0xff999999), fontSize: 14.0)),
                            Container(width: 4.0),
                            Image.asset("image/icon_play_drama_arrowr.png",
                                width: 16.0, height: 16.0),
                          ]),
                          onTap: () {
                            showModalBottomSheet(
                                builder: (BuildContext context1) {
                                  return Container(
                                      height:
                                          MediaQuery.of(context).size.height -
                                              270,
                                      color: Color(0xff111218),
                                      child: Column(children: [
                                        Container(height: 20.0),
                                        Row(children: [
                                          Container(width: 10.0),
                                          Text("Episodes",
                                              style: TextStyle(
                                                  color: Color(0xffECECEC),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500)),
                                          Spacer(),
                                          Image.asset(
                                              "image/icon_play_eps_exit.png",
                                              width: 20.0,
                                              height: 20.0),
                                          Container(
                                            width: 10.0,
                                          )
                                        ]),
                                        Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10.0, 20.0, 10.0, 9.0),
                                            height: 30.0,
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [1, 2, 3, 4, 5]
                                                  .map((index) => Container(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              12, 8, 12, 8),
                                                      margin: EdgeInsets.only(
                                                          right: 10.0),
                                                      width: 74.0,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xff23252A),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0)),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("Season 1",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12.0),
                                                                maxLines: 1),
                                                          ])))
                                                  .toList(),
                                            )),
                                        Container(
                                            height: 1,
                                            color: Color(0xff3F3F5C)),
                                        Expanded(
                                            child: ListView(
                                          scrollDirection: Axis.vertical,
                                          children: [1, 2, 3, 4, 5]
                                              .map((index) => Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      16, 10, 16, 10),
                                                  margin: EdgeInsets.only(
                                                      top: 10.0),
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff23252A)),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Season 1",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16.0),
                                                            maxLines: 1),
                                                        Container(height: 4.0),
                                                        Text(
                                                          "when van helsing’s mysterious invention myster ious...",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.0),
                                                          maxLines: 1,
                                                        ),
                                                      ])))
                                              .toList(),
                                        ))
                                      ]));
                                },
                                backgroundColor: Colors.transparent, //重要
                                context: context);
                          }),
                      Container(width: 10.0)
                    ]),
                    Container(height: 9.0),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        height: 66.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [1, 2, 3, 4, 5]
                              .map((index) => Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  margin: EdgeInsets.only(right: 10.0),
                                  width: 140.0,
                                  height: 66.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xff23252A),
                                      borderRadius: BorderRadius.circular(4.0)),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("EP 1",
                                            style: TextStyle(
                                                color: Color(0xff999999),
                                                fontSize: 10.0)),
                                        Container(height: 4.0),
                                        Text(
                                          "Ryomen Sukuna\naisfhioa aios ryomen sukuna",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0),
                                          maxLines: 2,
                                        ),
                                      ])))
                              .toList(),
                        )),
                    Container(height: 35.0),
                    Row(children: [
                      Container(width: 10.0),
                      Text("Trending",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                      Spacer(),
                      Image.asset("image/icon_main_arrowright.png",
                          width: 24.0, height: 24.0),
                      Container(width: 10.0)
                    ]),
                    Container(
                        height: 192.0,
                        margin: EdgeInsets.only(top: 11.0, bottom: 0.0),
                        padding: EdgeInsets.fromLTRB(0.0, 0, 5, 0),
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [1, 2, 3, 4, 5]
                                .map((index) => GestureDetector(
                                    child: Container(
                                        width: 112.0,
                                        margin: EdgeInsets.only(right: 5.0),
                                        child: Stack(children: [
                                          Image.asset(
                                              "image/pic_banner_test.png",
                                              height: 158.0,
                                              fit: BoxFit.fill),
                                          Positioned(
                                              left: 5.0,
                                              top: 5.0,
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text("8.",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffFF6D1C),
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                    Text("0",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffFF6D1C),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600))
                                                  ])),
                                          Positioned(
                                              bottom: 34.0,
                                              width: 112.0,
                                              child: Container(
                                                  height: 24.0,
                                                  decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                        Colors.transparent,
                                                        Colors.black
                                                      ])),
                                                  child: Row(children: [
                                                    Spacer(),
                                                    Text("NEW",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffFF6D1C),
                                                            fontSize: 8.0)),
                                                    Text("|S07 E08",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 8.0))
                                                  ]))),
                                          Positioned(
                                              top: 163.0,
                                              left: 5.0,
                                              right: 5.0,
                                              child: Text(
                                                  "Minions:The Rise of Gru",
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      color: Color(0xff828386),
                                                      fontSize: 12.0)))
                                        ])),
                                    onTap: () {}))
                                .toList())),
                  ])),
              Offstage(
                  offstage: !_htVarInfoShown,
                  child: Column(children: [
                    Container(
                        height: 83.0,
                        child: ListView(
                          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                          scrollDirection: Axis.horizontal,
                          children: [1, 2, 3, 4, 5, 6, 7, 8]
                              .map((index) => new Container(
                                  margin: EdgeInsets.only(right: 15.0),
                                  width: 50.0,
                                  child: Column(children: [
                                    CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "image/pic_banner_test.png"),
                                        radius: 25.0),
                                    Container(height: 5.0),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0.0, horizontal: 0.0),
                                        child: Text("yanyuanmingzi",
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0)))
                                  ])))
                              .toList(),
                        )),
                    Container(
                        height: 1.0,
                        margin: EdgeInsets.fromLTRB(10.0, 19.0, 10.0, 20.0),
                        color: Color(0xff2A2C40)),
                    Row(children: [
                      Container(width: 10.0),
                      Text("Info",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ]),
                    Container(
                        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        child: Text(
                            "when van helsing’s mysterious invention,the “mons-terfiction ray,”goes haywire,drac and his monster palare when van helsing’s mysterious invention,the “monsterfiction ray,”goes haywire,drac and his monster pal arewhen van helsing’s mysterious invention,the “mons-terfiction ray,”goes haywire,drac and his monster palare when van helsing’s mysterious invention,the “monsterfiction ray,”goes haywire,drac and his monster pal arewhen van helsing’s mysterious invention,the “mons-terfiction ray,”goes haywire,drac and his monster palare when van helsing’s mysterious invention,the “monsterfiction ray,”goes haywire,drac and his monster pal are",
                            style: TextStyle(
                                color: Color(0xff999999),
                                fontSize: 14.0,
                                height: 1.5)))
                  ]))
            ])));
  }

  void htMethodshowScreenSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context1) {
          return Container(
              height: 331.0,
              decoration: BoxDecoration(
                  color: Color(0xff292A2F),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0))),
              child: Column(children: [
                Container(height: 53.7),
                Image.asset("image/icon_play_screen_logo.png",
                    width: 78.0, height: 78.0),
                Container(height: 28.7),
                Text("Install Castly APP to cast Overflow\n(Uncensored)",
                    style: TextStyle(
                        color: Color(0xffFFD770),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600)),
                Container(height: 18.2),
                Text("Jumping to Castly ...",
                    style: TextStyle(color: Color(0xff999999), fontSize: 14.0)),
              ]));
        });
  }
}
