import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/providers/ht_searchresult_provider/ht_searchresult_provider.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/views/search_middlepage.dart';
import 'package:provider/provider.dart';

class HTClassSearchResultPage extends StatefulWidget {
  const HTClassSearchResultPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HTClassSearchResultPage> createState() => _HTClassSearchResultPageState();
}

class _HTClassSearchResultPageState extends State<HTClassSearchResultPage> {
  HTSearchResultProvider searchResultProvider = HTSearchResultProvider();
  var _htVarFieldFocusNode = FocusNode();
  @override
  void initState() {
    searchResultProvider.loadSearchResulrData();
    _htVarFieldFocusNode.addListener(() {
      if(_htVarFieldFocusNode.hasFocus){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return const HTClassSearchMidPage(title: "");
            }));
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context)=>searchResultProvider,
          )
      ],
      child:Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(child: Column(children: [
          Container(height: MediaQuery.of(context).padding.top),
          Container(height:56.0,child:Row(crossAxisAlignment:CrossAxisAlignment.center,children: [
            Container(width: 10.0),
            GestureDetector(child:Image.asset("image/icon_search_back_w.png",width: 24, height: 24),onTap: (){
              Navigator.of(context).pop();
            }),
            Container(width: 6.0),
            Expanded(child: Container(height: 36.0, decoration: BoxDecoration(color: Color(0xff36373C),borderRadius: BorderRadius.circular(10.0)),
              child: Row(crossAxisAlignment:CrossAxisAlignment.center,children: [
                Container(width: 11.3),
                Image.asset("image/icon_search_field_search.png",width: 16, height: 16),
                Container(width: 8),
                Expanded(child:TextField(controller: TextEditingController(),focusNode:_htVarFieldFocusNode,decoration: InputDecoration(hintText: "Search for Movies,TV",border:InputBorder.none,hintStyle: TextStyle(color: Color(0xffAEAFB1),fontSize: 15.0)))),
                Image.asset("image/icon_search_clear.png",width: 16, height: 16),
                Container(width: 10.0),
              ]),
            )),
            Container(width: 10.0),
          ])),
          Container(height: 10.0),
          GridView.count(crossAxisCount: 3,shrinkWrap:true,physics:NeverScrollableScrollPhysics(),childAspectRatio:0.575,
              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),mainAxisSpacing:10.0,crossAxisSpacing:9.5,children: [1,2,3,4,5,6,7,8,9].map((index) =>Container(width: 112.0,margin:EdgeInsets.only(right: 5.0),child: Stack(children: [
                Image.asset("image/pic_banner_test.png",height:180.0,fit: BoxFit.fill),
                Positioned(left:5.0,top:5.0,child: Row(crossAxisAlignment: CrossAxisAlignment.end,children: [
                  Text("8.",style: TextStyle(color: Color(0xffFF6D1C),fontSize: 20,fontWeight: FontWeight.w600)),
                  Text("0",style: TextStyle(color: Color(0xffFF6D1C),fontSize: 12,fontWeight: FontWeight.w600))
                ])),
                Positioned(bottom: 40.0, width: 120.0, child: Container(height:24.0,decoration: BoxDecoration(gradient:
                LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [Colors.transparent,Colors.black])),child: Row(children: [
                  Spacer(),Text("NEW",style: TextStyle(color: Color(0xffFF6D1C),fontSize: 8.0)),Text("|S07 E08",style: TextStyle(color: Colors.white,fontSize: 8.0))]))),
                Positioned(top:185.0,left:5.0,right: 5.0,child: Text("Minions:The Rise of Gru",maxLines: 2, style: TextStyle(color: Color(0xff828386),fontSize: 12.0)))
              ]))).toList()),
          Container(height: 60.0,width:double.infinity,margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),padding:EdgeInsets.only(left: 16.0),decoration: BoxDecoration(image: DecorationImage(image: AssetImage("image/img_main_advs.png"),fit: BoxFit.fill),borderRadius: BorderRadius.circular(6.0)),child:
          Column(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment:CrossAxisAlignment.start,children: [
            Text("special offer for you",style: TextStyle(color: Color(0xff222222),fontSize: 15.0,fontWeight: FontWeight.w600)),
            Container(height: 4.0),
            Row(crossAxisAlignment:CrossAxisAlignment.end,children: [
              Text("\$",style: TextStyle(color: Color(0xff222222),fontSize: 18.0,fontWeight: FontWeight.w600)),
              Text("2.99",style: TextStyle(color: Color(0xff222222),fontSize: 14.0,fontWeight: FontWeight.w600)),
              Container(width: 3.0),
              Text("for the 1 Month",style: TextStyle(color: Color(0xff222222),fontSize: 10.0)),
            ])
          ])
          ),

          Offstage(offstage:false,child:Container(margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),height:250.0,decoration: BoxDecoration(color: Color(0xff23252A),borderRadius: BorderRadius.circular(6.0)),child: Stack(children: [
            Positioned(right:15,top:15,child: Image.asset("image/icon_main_close.png",width: 24.0,height: 24.0))
          ]))),

          GridView.count(crossAxisCount: 3,shrinkWrap:true,physics:NeverScrollableScrollPhysics(),childAspectRatio:0.575,
              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),mainAxisSpacing:10.0,crossAxisSpacing:9.5,children: [1,2,3,4,5,6,7,8,9].map((index) =>Container(width: 112.0,margin:EdgeInsets.only(right: 5.0),child: Stack(children: [
                Image.asset("image/pic_banner_test.png",height:180.0,fit: BoxFit.fill),
                Positioned(left:5.0,top:5.0,child: Row(crossAxisAlignment: CrossAxisAlignment.end,children: [
                  Text("8.",style: TextStyle(color: Color(0xffFF6D1C),fontSize: 20,fontWeight: FontWeight.w600)),
                  Text("0",style: TextStyle(color: Color(0xffFF6D1C),fontSize: 12,fontWeight: FontWeight.w600))
                ])),
                Positioned(bottom: 40.0, width: 120.0, child: Container(height:24.0,decoration: BoxDecoration(gradient:
                LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [Colors.transparent,Colors.black])),child: Row(children: [
                  Spacer(),Text("NEW",style: TextStyle(color: Color(0xffFF6D1C),fontSize: 8.0)),Text("|S07 E08",style: TextStyle(color: Colors.white,fontSize: 8.0))]))),
                Positioned(top:185.0,left:5.0,right: 5.0,child: Text("Minions:The Rise of Gru",maxLines: 2, style: TextStyle(color: Color(0xff828386),fontSize: 12.0)))
              ]))).toList()),
        ])))
      );
    
    
    
    
  }
}