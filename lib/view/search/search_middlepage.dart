import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/view/search/search_resultpage.dart';
import '../../utils/ui_utils.dart';

class HTClassSearchMidPage extends StatefulWidget {
  const HTClassSearchMidPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HTClassSearchMidPage> createState() => _HTClassSearchMidPageState();
}

class _HTClassSearchMidPageState extends State<HTClassSearchMidPage> with SingleTickerProviderStateMixin {

  var _htVarTabController = null;
  var _htVarFieldFocusNode = FocusNode();
  var _htVarSearchValue = "";
  var _htVarFieldController = TextEditingController();

  @override
  void initState() {
    _htVarTabController = TabController(length:5, vsync: this);
    _htVarFieldFocusNode.addListener(() {
      if(_htVarFieldFocusNode.hasFocus){

      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
          Container(height: MediaQuery.of(context).padding.top),
          Container(height:56.0,child:Row(crossAxisAlignment:CrossAxisAlignment.center,children: [
            Container(width: 10.0),
            GestureDetector(child:Image.asset("image/icon_search_back_w.png",width: 24, height: 24),onTap: (){
              Navigator.pop(context);
            }),
            Container(width: 6.0),
            Expanded(child: Container(height: 36.0, decoration: BoxDecoration(color: Color(0xff36373C),borderRadius: BorderRadius.circular(10.0)),
              child: Row(crossAxisAlignment:CrossAxisAlignment.center,children: [
                Container(width: 11.3),
                Image.asset("image/icon_search_field_search.png",width: 16, height: 16),
                Container(width: 8),
                Expanded(child:TextField(controller: _htVarFieldController,autofocus:true,focusNode:_htVarFieldFocusNode,decoration: InputDecoration(hintText: "Search for Movies,TV",border:InputBorder.none,hintStyle: TextStyle(color: Color(0xffAEAFB1),fontSize: 15.0)),onChanged: (val){
                  if(_htVarFieldController.value.toString().length>0){
                    setState(() {
                      _htVarSearchValue = _htVarFieldController.value.text;
                    });
                  }
                })),
                Image.asset("image/icon_search_clear.png",width: 16, height: 16),
                Container(width: 10.0),
              ]),
            )),
            Container(width: 10.0),
          ])),
          Offstage(offstage:_htVarSearchValue.length>0,child:Column(children: [Container(height: 20.0),
          Offstage(offstage:false,child:Column(crossAxisAlignment:CrossAxisAlignment.start,children: [Row(children: [
            Container(width: 10.0),
            Text("History",style: TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.w600)),
            Spacer(),
            Image.asset("image/icon_main_arrowright.png",width: 24.0, height: 24.0),
            Container(width: 10.0)
          ]),
          Container(height: 20.0),
          Container(padding:EdgeInsets.only(left: 10.0),child:Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            runSpacing: 10,
            textDirection: TextDirection.ltr,
            children: [1,2,3,4,5,6].map((index) =>Container(padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),child: Text(index.toString(),style: TextStyle(color: Color(0xffBCBDBE),fontSize: 14.0)),decoration: BoxDecoration(color:Color(0xff23252A),borderRadius: BorderRadius.circular(15.0)))).toList(),
          ))])),
          Container(height: 20.0),
          Row(children: [
            Container(width: 10.0),
            Text("Top Search",style: TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.w600)),
          ]),
          Container(height: 10.0),
          Container(height:26.0,child:
          TabBar(
            controller: _htVarTabController,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Color(0xff3CDEF4),
            tabs: <Widget>[
              Tab(text: 'All'),
              Tab(text: 'Movie'),
              Tab(text: 'TV Shows'),
              Tab(text: 'Animated Series'),
              Tab(text: 'Focus')
            ])),
          Container(height: 20.0),
          GridView.count(crossAxisCount: 3,shrinkWrap:true,physics:NeverScrollableScrollPhysics(),childAspectRatio:0.575,
              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),mainAxisSpacing:10.0,crossAxisSpacing:9.5,children: [1,2,3,4,5,6,7,8,9,10,11,12].map((index) =>Container(width: 112.0,margin:EdgeInsets.only(right: 5.0),child: Stack(children: [
                Image.asset("image/pic_banner_test.png",height:180.0,fit: BoxFit.fill),
                Positioned(left:5.0,top:5.0,child: Row(crossAxisAlignment: CrossAxisAlignment.end,children: [
                  Text("8.",style: TextStyle(color: Color(0xffFF6D1C),fontSize: 20,fontWeight: FontWeight.w600)),
                  Text("0",style: TextStyle(color: Color(0xffFF6D1C),fontSize: 12,fontWeight: FontWeight.w600))
                ])),
                Positioned(left:0, top:0,child: Container(child:KTClassUIUtils.htMethodGetRankingNumbers(index))),
                Positioned(top:185.0,left:5.0,right: 5.0,child: Text("Minions:The Rise of Gru",maxLines: 2, style: TextStyle(color: Color(0xff828386),fontSize: 12.0,fontWeight: FontWeight.w600)))
              ]))).toList())])),
          Offstage(offstage:_htVarSearchValue.length==0,child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
            Container(height: 20.0),
            Container(padding:EdgeInsets.only(left: 10.0),child:Text("Search \"${_htVarSearchValue}\"",style: TextStyle(color: Color(0xff29D3EA),fontSize: 14.0))),
            Container(height: 20.0),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  //子Widget
                  return GestureDetector(child:Container(
                    height: 45,
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(crossAxisAlignment:CrossAxisAlignment.center,children: [
                      Image.asset("image/icon_search_search.png",width: 16.0, height: 16.0),
                      Container(width: 10.0),
                      Text("the closest one",style: TextStyle(color:Color(0xffECECEC),fontSize: 14.0))
                    ])
                  ),onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return const HTClassSearchResultPage(title: "");
                    }));
                  },);
                },
                //设置分割线，颜色为黑色，高度为1
                separatorBuilder: (BuildContext context, int index){
                  return Divider(color: Color(0x70ECECEC), height: 1,);
                },
            )
          ]))
        ])));
  }
}
