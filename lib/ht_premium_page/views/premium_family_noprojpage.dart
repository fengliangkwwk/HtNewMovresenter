import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_premium_page/views/premium_family_addpage.dart';

class HTClassFamilyNoProjPage extends StatefulWidget {
  const HTClassFamilyNoProjPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HTClassFamilyNoProjPage> createState() => _HTClassFamilyNoProjPageState();
}

class _HTClassFamilyNoProjPageState extends State<HTClassFamilyNoProjPage> {

  var htVarIsEditMode = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: AppBar(backgroundColor: Color(0xff1A1C21),
            title: Text("Family Account", style: TextStyle(color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600)),
            centerTitle: true,
            leadingWidth: 24.0,
            leading: Image.asset("image/icon_setting_back_w.png", width: 24.0,
                height: 24.0,
                fit: BoxFit.scaleDown),
            ),
        body: Column(children: [
          Container(margin: EdgeInsets.fromLTRB(63.0, 49.0, 62.0, 0),child: Text("You Have Not Purchased Or Joined Any \nFamily Plan",style: TextStyle(
            color: Color(0xff999999),fontSize: 13.0))),
          GestureDetector(child:Container(margin: EdgeInsets.fromLTRB(38.0, 50.0, 37.0, 0.0),height: 44.0,width:double.infinity,alignment:Alignment.center,decoration: BoxDecoration(borderRadius:BorderRadius.circular(22.0),gradient: LinearGradient(begin:Alignment.centerLeft,end:Alignment.centerRight,stops:[0.0,1.0],colors: [Color(0xffedc391),Color(0xfffdddb7)])),child:
          Text("Buy Family Plan",style: TextStyle(color:Color(0xff685034),fontSize: 16.0,fontWeight: FontWeight.w600,)),
          ),onTap: (){
            Navigator.pop(context);
          }),
          Container(height: 20.0),
          GestureDetector(child:Container(child: Text("Or wait for invitation",style: TextStyle(color:Color(0xff999999),fontSize: 13.0))),onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return HTClassFamilyAddPage(title: "");
                }));
          }),
        ]));
  }
}