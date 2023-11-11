import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HTClassPresentDetailPage extends StatefulWidget {
  const HTClassPresentDetailPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HTClassPresentDetailPage> createState() => _HTClassPresentDetailPageState();
}

class _HTClassPresentDetailPageState extends State<HTClassPresentDetailPage> {

  var _htVarInfoShown = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FijkPlayer _htVarplayer = FijkPlayer();
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
                Positioned(child: Image.asset("image/icon_search_back_w.png",width: 24.0, height: 24.0,fit: BoxFit.fill,),left: 10.0, top: 11.0),
                Positioned(right:11.0, top:10.0,child: Row(children: [
                  Image.asset("image/icon_player_vip.png",width: 100.0,height: 26.0),
                  Container(width: 10.0),
                  Image.asset("image/icon_player_cc.png",width: 24.0,height: 24.0),
                  Container(width: 10.0),
                  Image.asset("image/icon_player_tv.png",width: 24.0,height: 24.0),
                ]))
              ])
            ),
          Container(height: 60.0,decoration: BoxDecoration(image: DecorationImage(image:AssetImage("image/pic_play_premium_bg.png"),fit: BoxFit.fill)),child: Row(crossAxisAlignment:CrossAxisAlignment.center,children: [
            Container(width: 25.0),
            Column(crossAxisAlignment:CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.center,children: [Image.asset("image/icon_play_forbidden.png",width: 20.0,height: 20.0),
              Container(margin:EdgeInsets.only(top: 2.5),padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 0.0),child: Text("Remove\r\nAll Ads",textAlign:TextAlign.center,style: TextStyle(color: Color(0xff685034),fontSize: 10.0)))
            ]),
            Container(width: 37.5),
            Column(crossAxisAlignment:CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.center,children: [Image.asset("image/icon_play_movplay.png",width: 20.0,height: 20.0),
              Container(margin:EdgeInsets.only(top: 2.5),padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 0.0),child: Text("Unlock\r\nAll Ads",textAlign:TextAlign.center,style: TextStyle(color: Color(0xff685034),fontSize: 10.0)))
            ]),
            Container(width: 37.5),
            Column(crossAxisAlignment:CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.center,children: [Image.asset("image/icon_play_movtv.png",width: 20.0,height: 20.0),
              Container(margin:EdgeInsets.only(top: 2.5),padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 0.0),child: Text("Unlimited\r\nScreen Casting",textAlign:TextAlign.center,style: TextStyle(color: Color(0xff685034),fontSize: 10.0)))
            ]),
            Spacer(),
            Text("Get Premium",style: TextStyle(color:Color(0xff685034),fontSize: 14.0,fontWeight: FontWeight.w600)),
            Container(width: 20.0)
          ])),
          Container(margin: EdgeInsets.only(top: 26.0,left: 10.0),child: Text("Riverdance:the animated adventure",style: TextStyle(color:Colors.white,fontSize: 18.0,fontWeight: FontWeight.w600))),
          Container(margin: EdgeInsets.only(top: 8.0,left: 10.0),child: Row(children: [
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
            Image.asset("image/icon_play_tag_more.png",width: 16.0, height: 16.0),
            ]),onTap: (){
              setState(() {
                _htVarInfoShown = true;
              });
            })),
            Container(width: 10.0),
          ])),
          Offstage(offstage:_htVarInfoShown,child:Column(children: [
          Container(height: 10.0),
          Row(crossAxisAlignment:CrossAxisAlignment.center,children: [
            Container(width: 15.0),
            Column(children: [
              Image.asset("image/icon_play_tasks.png",width: 22, height: 22),
              Container(height: 5.0),
              Text("My List",style: TextStyle(color: Colors.white,fontSize: 10.0)),
            ]),
            Container(width: 40.0),
            Column(children: [
              Image.asset("image/icon_play_share.png",width: 22, height: 22),
              Container(height: 5.0),
              Text("Share",style: TextStyle(color: Colors.white,fontSize: 10.0)),
            ]),
            Container(width: 40.0),
            Column(children: [
              Image.asset("image/icon_play_feedback.png",width: 22, height: 22),
              Container(height: 5.0),
              Text("Feedback",style: TextStyle(color: Colors.white,fontSize: 10.0)),
            ])
          ]),
          Container(height: 35.0),
          Row(children: [
            Container(width: 10.0),
            Text("Trending",style: TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.w600)),
            Spacer(),
            Image.asset("image/icon_main_arrowright.png",width: 24.0, height: 24.0),
            Container(width: 10.0)
          ]),
          Container(height:192.0,margin:EdgeInsets.only(top: 11.0,bottom: 0.0),padding:EdgeInsets.fromLTRB(0.0,0,5,0),child:ListView(
              scrollDirection: Axis.horizontal,
              children:[1,2,3,4,5].map((index) =>GestureDetector(child:Container(width: 112.0,margin:EdgeInsets.only(right: 5.0),child: Stack(children: [
                Image.asset("image/pic_banner_test.png",height:158.0,fit: BoxFit.fill),
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