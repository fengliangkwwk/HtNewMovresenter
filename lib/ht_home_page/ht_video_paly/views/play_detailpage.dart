/**
 * 电影播放页
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:ht_new_movpresenter/utils/url_getImageurl.dart';

class HTClassPresentDetailPage extends StatefulWidget {
  const HTClassPresentDetailPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HTClassPresentDetailPage> createState() => _HTClassPresentDetailPageState();
}

class _HTClassPresentDetailPageState extends State<HTClassPresentDetailPage> {
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
    'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4'
  ];
  final FijkPlayer _htVarplayer = FijkPlayer();
  ///more info 是否展开
  var _htVarInfoShown = false;
  @override
  void initState() {
    //     if(videoList[2].contains("rtsp")){
    //     //rtsp视频关键配置
    //    _htVarplayer.setOption(FijkOption.formatCategory, "rtsp_transport", "tcp");
    //     // fijkPlayer 初始化不启用缓冲，避免画面卡死不动
    //    _htVarplayer.setOption(FijkOption.playerCategory, 'packet-buffering', 0);
    //    _htVarplayer.setOption(FijkOption.playerCategory, 'framedrop', 1);
    // }
    super.initState();
        _htVarplayer .setDataSource(videoList[2], autoPlay: true);
  }
  @override
  void dispose(){
    super.dispose();
    _htVarplayer.release();
  }

  @override
  Widget build(BuildContext context) {
     FijkPlugin.keepScreenOn( true ) ;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
            Container(height:220.0,margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Stack(children: [
                FijkView(
                  player: _htVarplayer,
                  fit: FijkFit.fill,
                  fsFit: FijkFit.fill,
                  panelBuilder: fijkPanel2Builder(),
                ),
                Positioned(
                  left: 10,
                  top: 11,
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: CachedNetworkImage(imageUrl:ImageURL.url_291,width: 24.0, height: 24.0,fit: BoxFit.fill,),
                  )
                ),
                  //  CachedNetworkImage(imageUrl:ImageURL.url_291,width: 24.0, height: 24.0,fit: BoxFit.fill,),left: 10.0, top: 11.0),//返回图标
                Positioned(right:11.0, top:10.0,child: 
                Row(children: [
                  CachedNetworkImage(imageUrl:ImageURL.url_249,width: 100.0,height: 26.0),///remove ads 图标
                  Container(width: 10.0),
                  CachedNetworkImage(imageUrl: ImageURL.url_315,width: 24.0, height: 24.0),///cc 图标
                  Container(width: 10.0),
                  CachedNetworkImage(imageUrl: ImageURL.url_329,width: 24.0, height: 24.0),///投屏图标
                ]))
              ])
            ),
            Container(height: 60.0,decoration: BoxDecoration(image: DecorationImage(image:CachedNetworkImageProvider(ImageURL.url_252,),fit: BoxFit.fill)),child: Row(crossAxisAlignment:CrossAxisAlignment.center,children: [
            Container(width: 25.0),
            Column(crossAxisAlignment:CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.center,children: [CachedNetworkImage(imageUrl: ImageURL.url_260,width: 20.0,height: 20.0),
              Container(margin:EdgeInsets.only(top: 2.5),padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 0.0),child: Text("Remove\r\nAll Ads",textAlign:TextAlign.center,style: TextStyle(color: Color(0xff685034),fontSize: 10.0)))
            ]),
            Container(width: 37.5),
            Column(crossAxisAlignment:CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.center,children: [CachedNetworkImage(imageUrl: ImageURL.url_261,width: 20.0,height: 20.0),
              Container(margin:EdgeInsets.only(top: 2.5),padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 0.0),child: Text("Unlock\r\nAll Ads",textAlign:TextAlign.center,style: TextStyle(color: Color(0xff685034),fontSize: 10.0)))
            ]),
            Container(width: 37.5),
            Column(crossAxisAlignment:CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.center,children: [CachedNetworkImage(imageUrl: ImageURL.url_262,width: 20.0,height: 20.0),
              Container(margin:EdgeInsets.only(top: 2.5),padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 0.0),child: Text("Unlimited\r\nScreen Casting",textAlign:TextAlign.center,style: TextStyle(color: Color(0xff685034),fontSize: 10.0)))
            ]),
            Spacer(),
            Text("Get Premium",style: TextStyle(color:Color(0xff685034),fontSize: 14.0,fontWeight: FontWeight.w600)),
            Container(width: 20.0)
          ])),
          Container(margin: EdgeInsets.only(top: 26.0,left: 10.0),child: Text("Riverdance:the animated adventure",style: TextStyle(color:Colors.white,fontSize: 18.0,fontWeight: FontWeight.w600))),
          Container(margin: EdgeInsets.only(top: 8.0,left: 10.0),child: Row(children: [
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
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            onRatingUpdate: (rating) {
              print(rating);
            }),
            Container(width: 8.0),
            Text("7.5",style: TextStyle(fontSize: 14.0,color: Colors.white)),
            Container(width: 8.0),
            Text("|",style: TextStyle(fontSize: 14.0,color: Color(0xff2D2F33))),
            Container(width: 8.0),
            Text("2022",style: TextStyle(fontSize: 14.0,color: Colors.white)),
            Container(width: 8.0),
            Text("|",style: TextStyle(fontSize: 14.0,color: Color(0xff2D2F33))),
            Container(width: 8.0),
            Text("United States",style: TextStyle(fontSize: 14.0,color: Colors.white)),
          ])),
          Container(margin: EdgeInsets.only(top: 8.0,left: 10.0,bottom: 20.0),child: Row(children: [
            Text("Animation",style: TextStyle(fontSize: 14.0,color: Color(0xff999999))),
            Container(width: 8.0),
            Text("|",style: TextStyle(fontSize: 14.0,color: Color(0xff2D2F33))),
            Container(width: 8.0),
            Text("Comedy",style: TextStyle(fontSize: 14.0,color: Color(0xff999999))),
            Container(width: 8.0),
            Text("|",style: TextStyle(fontSize: 14.0,color: Color(0xff2D2F33))),
            Container(width: 8.0),
            Text("Family",style: TextStyle(fontSize: 14.0,color: Color(0xff999999))),
            Container(width: 8.0),
            Text("|",style: TextStyle(fontSize: 14.0,color: Color(0xff2D2F33))),
            Container(width: 8.0),
            Text("Music",style: TextStyle(fontSize: 14.0,color: Color(0xff999999))),
            Spacer(),
            Offstage(offstage:_htVarInfoShown,child:GestureDetector(child:Row(children: [Text("More Info",style: TextStyle(fontSize: 14.0,color: Color(0xff999999))),
            Container(width: 2.0),
            CachedNetworkImage(imageUrl:_htVarInfoShown? ImageURL.url_303:ImageURL.url_302,width: 16.0, height: 16.0),
            ]),onTap: (){
              setState(() {
                if(_htVarInfoShown == false){
                  _htVarInfoShown = true;
                }else{
                  _htVarInfoShown = false;
                }
              });
            })),
            Container(width: 10.0),
          ])),
          Offstage(offstage:_htVarInfoShown,child:Column(children: [
          Container(height: 10.0),
          Row(crossAxisAlignment:CrossAxisAlignment.center,children: [
            Container(width: 15.0),
            Column(children: [
              CachedNetworkImage(imageUrl:ImageURL.url_258,width: 22, height: 22),///258
              Container(height: 5.0),
              Text("My List",style: TextStyle(color: Colors.white,fontSize: 10.0)),
            ]),
            Container(width: 40.0),
            Column(children: [
              CachedNetworkImage(imageUrl: ImageURL.url_105,width: 22, height: 22),///105
              Container(height: 5.0),
              Text("Share",style: TextStyle(color: Colors.white,fontSize: 10.0)),
            ]),
            Container(width: 40.0),
            Column(children: [
              CachedNetworkImage(imageUrl: ImageURL.url_100,width: 22, height: 22),
              Container(height: 5.0),
              Text("Feedback",style: TextStyle(color: Colors.white,fontSize: 10.0)),
            ])
          ]),
          Container(height: 35.0),
          Row(children: [
            Container(width: 10.0),
            Text("Trending",style: TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.w600)),
            Spacer(),
            CachedNetworkImage(imageUrl: ImageURL.url_308,width: 24.0, height: 24.0),
            Container(width: 10.0)
          ]),
          ///Trending 下面的横滑列表
          Container(height:192.0,margin:EdgeInsets.only(top: 11.0,bottom: 0.0),padding:EdgeInsets.fromLTRB(0.0,0,5,0),child:ListView(
              scrollDirection: Axis.horizontal,
              children:[1,2,3,4,5].map((index) =>GestureDetector(child:Container(width: 112.0,margin:EdgeInsets.only(right: 5.0),child: Stack(children: [
                CachedNetworkImage(imageUrl: imgList[2],height:158.0,fit: BoxFit.fill),
                Positioned(left:5.0,top:5.0,child: Row(crossAxisAlignment: CrossAxisAlignment.end,children: [
                  Text("8.",style: TextStyle(color: Color(0xffFF6D1C),fontSize: 20,fontWeight: FontWeight.w600)),
                  Text("0",style: TextStyle(color: Color(0xffFF6D1C),fontSize: 12,fontWeight: FontWeight.w600))
                ])),
                Positioned(bottom: 34.0, width: 112.0, child: Container(height:24.0,decoration: BoxDecoration(gradient:
                LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [Colors.transparent,Colors.black])),child: Row(children: [
                  Spacer(),Text("NEW",style: TextStyle(color: Color(0xffFF6D1C),fontSize: 8.0)),Text("|S07 E08",style: TextStyle(color: Colors.white,fontSize: 8.0))]))),
                Positioned(top:163.0,left:5.0,right: 5.0,child: Text("Minions:The Rise of Gru",maxLines: 2, style: TextStyle(color: Color(0xff828386),fontSize: 12.0)))
              ])),onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return const HTClassPresentDetailPage(title: "");
                    }));
              })).toList())),
          ])),
          ///点击 more info 的更多内容
          Offstage(offstage:!_htVarInfoShown,child: Column(children: [
            Container(height:83.0,child:ListView(
            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            scrollDirection: Axis.horizontal,
            children: [1,2,3,4,5,6,7,8].map((index)=>new Container(margin:EdgeInsets.only(right: 15.0),width:50.0,child: Column(children: [
              CircleAvatar(backgroundImage: AssetImage("image/pic_banner_test.png"),radius:25.0),
              Container(height: 5.0),
              Container(padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),child: Text("yanyuanmingzi",maxLines:2,style: TextStyle(color: Colors.white,fontSize: 12.0)))
            ]))).toList(),
          )),
          Container(height: 1.0,margin: EdgeInsets.fromLTRB(10.0, 19.0, 10.0, 20.0),color:Color(0xff2A2C40)),
          Row(children: [
            Container(width: 10.0),
            Text("Info",style: TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.w600)),
          ]),
          Container(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),child: Text("when van helsing’s mysterious invention,the “mons-terfiction ray,”goes haywire,drac and his monster palare when van helsing’s mysterious invention,the “monsterfiction ray,”goes haywire,drac and his monster pal arewhen van helsing’s mysterious invention,the “mons-terfiction ray,”goes haywire,drac and his monster palare when van helsing’s mysterious invention,the “monsterfiction ray,”goes haywire,drac and his monster pal arewhen van helsing’s mysterious invention,the “mons-terfiction ray,”goes haywire,drac and his monster palare when van helsing’s mysterious invention,the “monsterfiction ray,”goes haywire,drac and his monster pal are",
          style: TextStyle(color:Color(0xff999999),fontSize: 14.0, height: 1.5)))
          ]))
        ])));
  }
}