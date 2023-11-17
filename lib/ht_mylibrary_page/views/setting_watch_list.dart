import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class HTClassWatchListPage extends StatefulWidget {
  const HTClassWatchListPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HTClassWatchListPage> createState() => _HTClassWatchListPageState();
}

class _HTClassWatchListPageState extends State<HTClassWatchListPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(backgroundColor: Color(0xff1A1C21),
            title: Text("Watchlist", style: TextStyle(color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600)),
            centerTitle: true,
            leadingWidth: 24.0,
            leading: GestureDetector(child:Image.asset("image/icon_setting_back_w.png", width: 24.0,
                height: 24.0,
                fit: BoxFit.scaleDown),onTap: (){Navigator.pop(context);})),
        body: SingleChildScrollView(child: Column(children: [
          GridView.count(crossAxisCount: 3,shrinkWrap:true,physics:NeverScrollableScrollPhysics(),childAspectRatio:0.575,
              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),mainAxisSpacing:10.0,crossAxisSpacing:9.5,children: [1,2,3,4,5,6,7,8,9].map((index) =>Container(width: 112.0,margin:EdgeInsets.only(right: 5.0),child: Column(children: [Stack(children: [
                Image.asset("image/pic_banner_test.png",height:160.0,fit: BoxFit.fill),
                Positioned(left:5.0,top:5.0,child: Row(crossAxisAlignment: CrossAxisAlignment.end,children: [
                  Text("8.",style: TextStyle(color: Color(0xffFF6D1C),fontSize: 20,fontWeight: FontWeight.w600)),
                  Container(padding:EdgeInsets.only(bottom: 2.0),child:Text("0",style: TextStyle(color: Color(0xffFF6D1C),fontSize: 12,fontWeight: FontWeight.w600)))
                ])),
                Positioned(bottom: 0.0, left: 0.0, right: 0.0, child: Container(height:24.0, decoration: BoxDecoration(gradient:
                LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [Colors.transparent,Colors.black])),child: Row(children: [
                  Spacer(),Text("NEW",style: TextStyle(color: Color(0xffFF6D1C),fontSize: 8.0)),Text("|S07 E08",style: TextStyle(color: Colors.white,fontSize: 8.0))]))),
                ]),
                Container(color:Colors.yellow,height:2.0,child:LinearProgressIndicator(
                  value: 0.5,
                  minHeight: 2,
                  valueColor: AlwaysStoppedAnimation(Color(0xff3CDEF4)),
                  backgroundColor: Color(0xff4B505B),
                )),
                Container(margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0),child: Row(children: [Expanded(child:Text("Minions:The Rise of Gru",maxLines: 2, style: TextStyle(color: Color(0xff828386),fontSize: 12.0))),
                Offstage(offstage: true,child:Image.asset("image/icon_history_more.png",width: 24.0, height: 24.0)),
                Offstage(offstage: false,child:RoundCheckBox(isChecked:true,size:28.0,uncheckedWidget:Image.asset("image/icon_history_check_n.png"),checkedWidget:Image.asset("image/icon_history_check_h.png"),borderColor:Colors.transparent,checkedColor:Colors.transparent,uncheckedColor:Colors.transparent,onTap: (htVarIsCheck){})),
                ]))
              ]))).toList()),
        ])));
  }
}