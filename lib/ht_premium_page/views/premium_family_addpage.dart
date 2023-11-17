import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/utils/url_getImageurl.dart';

class HTClassFamilyAddPage extends StatefulWidget {
  const HTClassFamilyAddPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HTClassFamilyAddPage> createState() => _HTClassFamilyAddPageState();
}

class _HTClassFamilyAddPageState extends State<HTClassFamilyAddPage> {

  var htVarIsEditMode = false;
  var htVarTextFieldController = TextEditingController();
  var htVarhasContent = false;
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
          title: Text("Add Members", style: TextStyle(color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w600)),
          centerTitle: true,
          leadingWidth: 24.0,
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CachedNetworkImage(
                imageUrl: ImageURL.url_291,
                width: 24.0,
                height: 24.0,
                fit: BoxFit.contain,
              ),
            ),
        ),
        body: Column(children: [
          Container(margin: EdgeInsets.fromLTRB(32.0, 56.0, 31.0, 0.0),height: 26.0,child: Row(children: [
            Expanded(child:TextField(controller:htVarTextFieldController,style: TextStyle(color:Colors.white,fontSize: 16.0),
            decoration: InputDecoration(border: InputBorder.none,hintText: "Enter email address", hintStyle: TextStyle(color:Color(0xff999999),fontSize: 16.0)),onChanged: (val){
              setState(() {
                htVarhasContent = val.length>0;
              });
            })),Container(width: 10.0),GestureDetector(child:Container(padding:EdgeInsets.only(bottom: 5.0),child:Image.asset("image/icon_family_add_help.png",width: 20.0,height: 20.0)),onTap:(){
                htMethodShowHelpDialog(context);
            })])),
          Container(margin: EdgeInsets.fromLTRB(32.0, 0, 31.0, 0),height: 0.5,color: Color(0xff999999)),
          GestureDetector(child:Container(alignment:Alignment.center,margin:EdgeInsets.fromLTRB(38.0, 75.0, 37.0, 0.0),height: 44.0,width: double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(22.0),color: !htVarhasContent?Color(0xff111218):Color(0xffffffff)),child: Text("Add",style: TextStyle(color: !htVarhasContent?Color(0xff999999):Colors.black,fontSize: 16.0,fontWeight: FontWeight.w600))),onTap:(){
            htMethodShowSuccessDialog(context);
          }),
          Container(alignment:Alignment.centerLeft,margin: EdgeInsets.fromLTRB(32.0, 24.0, 31.0, 0),child: Text("*You can add up to four additional family members",style: TextStyle(color: Color(0xffcccccc),fontSize: 12.0,height: 1.5))),
          Container(alignment:Alignment.centerLeft,margin: EdgeInsets.fromLTRB(32.0, 0.0, 31.0, 0),child: Text("*You cannot add users with family plan accounts and individual subscription",style: TextStyle(color: Color(0xffcccccc),fontSize: 12.0,height: 1.5))),
        ]));
  }

  Future<void> htMethodShowHelpDialog (BuildContext ctx) async {
    await showDialog(
        context: context,
        builder: (context1) {
      return Dialog(backgroundColor:Colors.transparent,child: Container(height: 432.0,child:Column(children: [
        Row(children: [
          Spacer(),
          Image.asset("image/icon_family_dialog_triangle.png",width: 18.0,height: 18.0),
          Container(width: 10.0),
        ]),
        Container(height: 334, width:double.infinity,padding:EdgeInsets.symmetric(horizontal: 18.0),decoration: BoxDecoration(color:Color(0xfff6f6f6),borderRadius:BorderRadius.circular(12.0)),child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
          Container(height: 20.0),
          Text("How to add family accounts:",style: TextStyle(fontSize: 16.0,color: Color(0xff222222),fontWeight: FontWeight.w600)),
          Container(height: 10.0),
          RichText(text: TextSpan(text:"Enter the email address of a family member and click ",style: TextStyle(color: Color(0xff222222),fontSize: 14.0,height: 1.4),children: [
            TextSpan(text:"Add ",style: TextStyle(color: Color(0xff4F4CEE),fontSize: 14.0,height: 1.4)),
            TextSpan(text:"to add it successfully.",style: TextStyle(color: Color(0xff222222),fontSize: 14.0,height: 1.4))
          ])),
          Container(height:30.0),
          Row(mainAxisAlignment:MainAxisAlignment.start,crossAxisAlignment:CrossAxisAlignment.start,children: [Container(padding:EdgeInsets.only(top: 4.0),child:Text("Note:",style: TextStyle(fontSize: 12.0,color:Color(0xff555555),fontWeight: FontWeight.bold))),
          Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
            RichText(softWrap:true,maxLines:5,text: TextSpan(text:"Family members need to ",style: TextStyle(color: Color(0xff222222),fontSize: 14.0,height: 1.4),children: [
              TextSpan(text:"LOG IN ",style: TextStyle(color: Color(0xff4F4CEE),fontSize: 14.0,height: 1.4)),
              TextSpan(text:"to their family account to get the premium version.",style: TextStyle(color: Color(0xff222222),fontSize: 14.0,height: 1.4))
            ])),
            Container(height:10.0),
            RichText(softWrap:true,maxLines:5,text: TextSpan(text:"Your family members can register by ",style: TextStyle(color: Color(0xff222222),fontSize: 14.0,height: 1.4),children: [
              TextSpan(text:"email ",style: TextStyle(color: Color(0xff4F4CEE),fontSize: 14.0,height: 1.4)),
              TextSpan(text:"or ",style: TextStyle(color: Color(0xff222222),fontSize: 14.0,height: 1.4)),
              TextSpan(text:"Google ",style: TextStyle(color: Color(0xff4F4CEE),fontSize: 14.0,height: 1.4)),
              TextSpan(text:"in the My Library page or Settings page of the application.",style: TextStyle(color: Color(0xff222222),fontSize: 14.0,height: 1.4))
            ])),
             ]))]),
          Container(height:16.0),
          GestureDetector(child:Container(margin: EdgeInsets.fromLTRB(18.0, 0, 18.0, 0),height:40.0,width:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0),color: Color(0xff4F4CEE)),alignment:Alignment.center,child: Text("OK",style: TextStyle(fontSize: 16.0,color:Colors.white),)),onTap:(){
            Navigator.pop(context1);
          })
        ]))
      ])));
    });
  }

  Future<void> htMethodShowSuccessDialog(BuildContext context) async{
    await showDialog(
        context: context,
        builder: (context1) {
      return Dialog(backgroundColor:Colors.transparent,child: Container(height: 234.0,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0),color: Color(0xff292A2F)),child: Column(children: [Container(height: 16.0),
        Row(crossAxisAlignment:CrossAxisAlignment.start,children: [
          Container(width: 40.0),
          Expanded(child: Container(alignment: Alignment.bottomCenter,padding: EdgeInsets.only(top: 19.2),child: Image.asset("image/icon_family_add_success.png",width: 41.7,height: 41.7))),
          Image.asset("image/icon_family_delete.png",width: 24.0,height: 24.0),
          Container(width: 16.0)
        ]),
        Container(height: 8.0),
        Container(alignment:Alignment.center,child: Text("Added Successfully",style: TextStyle(color: Colors.white,fontSize: 16.0,fontWeight: FontWeight.w600))),
        Container(margin: EdgeInsets.fromLTRB(15.0, 58.0, 15.0, 0),height: 44.0,decoration: BoxDecoration(color:Color(0xff4F4CEE),borderRadius: BorderRadius.circular(22.0)),alignment: Alignment.center,child: Text("Share The App With My Family",style: TextStyle(color: Colors.white,fontSize: 14.0,fontWeight: FontWeight.w600)))
      ])));
      });
  }
}