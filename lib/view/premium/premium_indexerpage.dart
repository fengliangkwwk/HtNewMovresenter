import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/view/premium/premium_familypage.dart';
import 'package:ht_new_movpresenter/view/premium/premium_family_noprojpage.dart';

class HTClassUnPremiumPage extends StatefulWidget {
  const HTClassUnPremiumPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HTClassUnPremiumPage> createState() => _HTClassUnPremiumPageState();
}
class _HTClassUnPremiumPageState extends State<HTClassUnPremiumPage>{
  var htVarTabselection = 0;
  var htVarHasFamilyProj = false;
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
            title: const Text("Premium", style: TextStyle(color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600)),
            centerTitle: true,
            leadingWidth: 24.0,
            leading: Image.asset("image/icon_setting_back_w.png", width: 24.0,
                height: 24.0,
                fit: BoxFit.scaleDown)),
        body: Container(color: Color(0xff11101e),child: Column(crossAxisAlignment:CrossAxisAlignment.center,children:[
          Offstage(offstage: htVarTabselection ==1, child: Container(
              margin: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0),height:69.0,
              decoration: BoxDecoration(image: DecorationImage(image:AssetImage("image/img_premium_sel_bg.png"),fit: BoxFit.fill)),
              child:Row(children: [
                Container(width: 10.0),
                Text("Current Plan",style: TextStyle(fontSize: 18.0,color:Color(0xff222222),fontWeight: FontWeight.w600)),
                Spacer(),
                Column(crossAxisAlignment:CrossAxisAlignment.end,mainAxisAlignment:MainAxisAlignment.center,children: [
                  Text("Individual - Monthly",style: TextStyle(fontSize: 14.0,color:Color(0xff222222),fontWeight: FontWeight.w600)),
                  Container(height: 6.0),
                  Text("Cancel On:July 3, 2023",style: TextStyle(fontSize: 10.0,color:Color(0x80222222))),
                ]),
                Container(width: 10.0),
              ])
          )),
          Offstage(offstage: htVarTabselection == 0, child: Container(
              margin: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0),height:112.0,
              decoration: BoxDecoration(image: DecorationImage(image:AssetImage("image/img_premium_sel_bg2.png"),fit: BoxFit.fill)),
              child:Row(children: [
                Container(width: 10.0),
                Column(crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment:MainAxisAlignment.center,children: [
                  Text("Current Plan",style: TextStyle(fontSize: 18.0,color:Color(0xff222222),fontWeight: FontWeight.w600)),
                  Container(height: 36.0),
                  Text("My Family",style: TextStyle(fontSize: 14.0,color:Color(0xff222222))),
                ]),
                Spacer(),
                Column(crossAxisAlignment:CrossAxisAlignment.end,mainAxisAlignment:MainAxisAlignment.center,children: [
                  Text("Family - Monthly",style: TextStyle(fontSize: 14.0,color:Color(0xff222222),fontWeight: FontWeight.w600)),
                  Column(children: [Container(height: 6.0),
                  Text("Cancel On:July 3, 2023",style: TextStyle(fontSize: 10.0,color:Color(0x80222222))),
                  Container(height: 26.0),
                  ]),
                  Offstage(offstage: true,child:Container(height: 33.0)),
                  Container(alignment:Alignment.center,width: 59.0, height: 26.0, decoration: BoxDecoration(borderRadius: BorderRadius.circular(13.0),color: Colors.white),child:
                  GestureDetector(child:Text("View",style: TextStyle(color:Color(0xff222222),fontSize: 12.0,fontWeight: FontWeight.w600)),onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return htVarHasFamilyProj==true?HTClassFamilyPage(title: ""):HTClassFamilyNoProjPage(title: "");
                        }));
                  }))
                ]),
                Container(width: 10.0),
              ])
          )),
          Offstage(offstage: false, child: Container(margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),height:60.0,decoration:BoxDecoration(color:Color(0xff1B1C20),borderRadius: BorderRadius.circular(8.0)),child: Row(children: [
            Container(width: 10.0),
            Column(crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment:MainAxisAlignment.center,children: [
              Text("follow this link",style: TextStyle(fontSize: 14.0,color:Color(0xffececec),fontWeight: FontWeight.w600)),
            ]),
            Spacer(),
            Image.asset("image/icon_premium_plane.png",width:44.0, height:44.0),
            Container(width: 10.0)
          ]))),
          Row(children: [//不需要分流开始
            Expanded(child: GestureDetector(child:Container(alignment:Alignment.center,height: 48.0,color: htVarTabselection==0?Color(0xff11101E):Color(0xff161A26),child: Text("Individual Plan",style: TextStyle(color: htVarTabselection==0?Colors.white:Color(0xff727682),fontSize: 14.0,fontWeight: FontWeight.w600))),onTap: (){
              setState(() {
                htVarTabselection = 0;
              });
            })),
            Expanded(child: GestureDetector(child:Container(alignment:Alignment.center,height: 48.0,color: htVarTabselection==1?Color(0xff11101E):Color(0xff161A26),child: Text("Family Plan",style: TextStyle(color: htVarTabselection==1?Colors.white:Color(0xff727682),fontSize: 14.0,fontWeight: FontWeight.w600))),onTap: (){
              setState(() {
                htVarTabselection = 1;
              });
            }))
          ]),
          Expanded(child:Stack(children: [Offstage(
            offstage: htVarTabselection==1,
            child:Expanded(child:SingleChildScrollView(child: Column(children: [
              Container(margin: EdgeInsets.fromLTRB(26.7, 20.0, 26.0, 0),child: Row(children: [
                Expanded(child: Row(children: [Image.asset("image/icon_play_language_h.png",width: 15.0,height: 15.0),Container(width: 9.3),Text("Remove ADS",style:TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600,color:Colors.white))])),
                Expanded(child: Row(children: [Container(width: 17.5),Image.asset("image/icon_play_language_h.png",width: 15.0,height: 15.0),Container(width: 9.3),Text("Unlock All Movies",style:TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600,color:Colors.white))]))
              ])),Container(height: 24.0),
              Container(margin: EdgeInsets.fromLTRB(26.7, 0.0, 26.0, 0),child: Row(children: [
                Expanded(child: Row(children: [Image.asset("image/icon_play_language_h.png",width: 15.0,height: 15.0),Container(width: 9.3),Text("HD Resources",style:TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600,color:Colors.white))])),
                Expanded(child: Row(children: [Container(width: 17.5),Image.asset("image/icon_play_language_h.png",width: 15.0,height: 15.0),Container(width: 9.3),Text("Watch On TV",style:TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600,color:Colors.white))]))
              ])),
              Container(height:26.0),
              Row(children: [
                Container(width: 15.7),
                Expanded(child:Container(height: 136.0,decoration:BoxDecoration(image:DecorationImage(image: AssetImage("image/img_unsub_bg.png"),fit: BoxFit.fill)),child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                  Container(width: 72.0, height: 24.0,alignment:Alignment.center,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("image/img_bargain_bg.png"))),child: Text("Trial",style: TextStyle(fontSize: 14.0,color:Colors.white))),
                  Container(height: 14.0),
                  Container(alignment: Alignment.center,child:Text("Monthly",style: TextStyle(color: Color(0xff222222),fontSize: 12.0,fontWeight: FontWeight.w600))),
                  Container(height: 14.0),
                  Container(alignment: Alignment.center,child:Text("\$4.99",style: TextStyle(color: Color(0xff222222),fontSize: 28.0,fontWeight: FontWeight.w600))),
                  Container(height: 4.0),
                  Container(alignment: Alignment.center,child:Text("\$8.53",style: TextStyle(color: Color(0xff222222),fontSize: 11.0,decoration: TextDecoration.lineThrough))),
                ]))),
                Container(width: 12.0),
                Expanded(child:Container(height: 136.0,decoration:BoxDecoration(image:DecorationImage(image: AssetImage("image/img_unsub_bg.png"),fit: BoxFit.fill)),child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                  Container(width: 72.0, height: 24.0,alignment:Alignment.center,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("image/img_bargain_bg.png"))),child: Text("Trial",style: TextStyle(fontSize: 14.0,color:Colors.white))),
                  Container(height: 14.0),
                  Container(alignment: Alignment.center,child:Text("Monthly",style: TextStyle(color: Color(0xff222222),fontSize: 12.0,fontWeight: FontWeight.w600))),
                  Container(height: 14.0),
                  Container(alignment: Alignment.center,child:Text("\$4.99",style: TextStyle(color: Color(0xff222222),fontSize: 28.0,fontWeight: FontWeight.w600))),
                  Container(height: 4.0),
                  Container(alignment: Alignment.center,child:Text("\$8.53",style: TextStyle(color: Color(0xff222222),fontSize: 11.0,decoration: TextDecoration.lineThrough))),
                ])),),
                Container(width: 12.0),
                Expanded(child:Container(height: 136.0,decoration:BoxDecoration(image:DecorationImage(image: AssetImage("image/img_unsub_bg.png"),fit: BoxFit.fill)),child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                  Container(width: 72.0, height: 24.0,alignment:Alignment.center,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("image/img_bargain_bg.png"))),child: Text("Trial",style: TextStyle(fontSize: 14.0,color:Colors.white))),
                  Container(height: 14.0),
                  Container(alignment: Alignment.center,child:Text( "Monthly",style: TextStyle(color: Color(0xff222222),fontSize: 12.0,fontWeight: FontWeight.w600))),
                  Container(height: 14.0),
                  Container(alignment: Alignment.center,child:Text("\$4.99",style: TextStyle(color: Color(0xff222222),fontSize: 28.0,fontWeight: FontWeight.w600))),
                  Container(height: 4.0),
                  Container(alignment: Alignment.center,child:Text("\$8.53",style: TextStyle(color: Color(0xff222222),fontSize: 11.0,decoration: TextDecoration.lineThrough))),
                ])),),
                Container(width: 17.0)
              ]),
              Container(height:10.0),
              Row(children: [Container(width: 15.7),Expanded(child:RichText(softWrap:true,maxLines:2,text: TextSpan(text:"*\$2.99 for 1st month trial, \$4.99/mo thereafter.",style: TextStyle(fontSize: 12.0,color: Color(0xff3CDEF4)),children: [TextSpan(text: "You can cancel anytime.",style: TextStyle(fontSize: 12.0,color: Color(0xff999999)))]))),Container(width: 17)]),
              GestureDetector(child:Container(margin: EdgeInsets.fromLTRB(23.5, 20.0, 23.5, 13.0),height: 44.0,decoration: BoxDecoration(borderRadius:BorderRadius.circular(22.0),gradient: LinearGradient(begin:Alignment.centerLeft,end:Alignment.centerRight,stops:[0.0,1.0],colors: [Color(0xffedc391),Color(0xfffdddb7)])),child:
                Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                  Text("\$2.99",style: TextStyle(color:Color(0xff685034),fontSize: 20.0,fontWeight: FontWeight.w600,)),
                  Container(padding:EdgeInsets.only(top:3.0,left: 2.0),child:Text("1st month trial",style: TextStyle(color:Color(0xff685034),fontSize: 14.0,fontWeight: FontWeight.w600))),
                ])
              ),onTap: (){
                htMethodShowPayProptDialog(context);
              },),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                RichText(text: TextSpan(text: "If the ad still appears, tap ",style: TextStyle(fontSize: 12.0,color: Color(0xff999999)),children: [
                  TextSpan(text:"Restore",style: TextStyle(fontSize: 12.0,color:Colors.white,decoration: TextDecoration.underline))
                ]))
              ]),
              Container(height: 0.3,color: Color(0xffECECEC),margin: EdgeInsets.only(top: 12.0)),
              Container(height: 20.0),
              Row(crossAxisAlignment:CrossAxisAlignment.start,children:[Container(width: 15.7),Container(margin:EdgeInsets.only(top:6.0,right: 8.0),width:6.0,height:6.0,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(3.0)),),
                Expanded(child:RichText(softWrap:true,text: TextSpan(text:"Subscription automatically renews ",style: TextStyle(fontSize: 12.0,color: Colors.white,height: 1.5),children: [
                    TextSpan(text:"unless auto-renewal is disabled at least 24 hours before the end of the current period.",style: TextStyle(fontSize: 12.0,color: Color(0xff999999),height: 1.5)
                )])))
              ]),
              Container(height: 10.0),
              Row(crossAxisAlignment:CrossAxisAlignment.start,children:[Container(width: 15.7),Container(margin:EdgeInsets.only(top:6.0,right: 8.0),width:6.0,height:6.0,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(3.0)),),
                Expanded(child:RichText(softWrap:true,text: TextSpan(text:"Subscriptions can be managed by the user and ",style: TextStyle(fontSize: 12.0,color: Color(0xff999999),height: 1.5),children: [
                  TextSpan(text:"automatic renewal can be disabled ",style: TextStyle(fontSize: 12.0,color: Colors.white,height: 1.5)),
                  TextSpan(text:"by going to the User Account Settings after purchase.",style: TextStyle(fontSize: 12.0,color: Color(0xff999999),height: 1.5),
                  )])))
              ]),
              Container(height: 10.0),
              Row(crossAxisAlignment:CrossAxisAlignment.start,children:[Container(width: 15.7),Container(margin:EdgeInsets.only(top:6.0,right: 8.0),width:6.0,height:6.0,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(3.0)),),
                Expanded(child:RichText(softWrap:true,text: TextSpan(text:"You must confirm and pay the VIP subscription through the iTunes account in the purchase confirmation.",style: TextStyle(fontSize: 12.0,color: Color(0xff999999),height: 1.5))))
              ]),
            ]))
          )),
          new Offstage(
            offstage: htVarTabselection==0,
            child:Expanded(child:SingleChildScrollView(child: Column(children: [
              Container(margin: EdgeInsets.fromLTRB(26.7, 20.0, 26.0, 0),child: Row(children: [
                Expanded(child: Row(children: [Image.asset("image/icon_play_language_h.png",width: 15.0,height: 15.0),Container(width: 9.3),Text("Remove ADS",style:TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600,color:Colors.white))])),
                Expanded(child: Row(children: [Container(width: 17.5),Image.asset("image/icon_play_language_h.png",width: 15.0,height: 15.0),Container(width: 9.3),Text("Unlock All Movies",style:TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600,color:Colors.white))]))
              ])),Container(height: 24.0),
              Container(margin: EdgeInsets.fromLTRB(26.7, 0.0, 26.0, 0),child: Row(children: [
                Expanded(child: Row(children: [Image.asset("image/icon_play_language_h.png",width: 15.0,height: 15.0),Container(width: 9.3),Text("HD Resources",style:TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600,color:Colors.white))])),
                Expanded(child: Row(children: [Container(width: 17.5),Image.asset("image/icon_play_language_h.png",width: 15.0,height: 15.0),Container(width: 9.3),Text("Watch On TV",style:TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600,color:Colors.white))]))
              ])),
              Container(margin: EdgeInsets.fromLTRB(26.7, 20.0, 26.0, 0),child: Row(children: [
                Expanded(child: Row(children: [Image.asset("image/icon_play_language_h.png",width: 15.0,height: 15.0),Container(width: 9.3),Text("Up To 5 Members",style:TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600,color:Colors.white))])),
                Expanded(child: Container())
              ])),
              Container(height:26.0),
              Row(children: [
                Container(width: 15.7),
                Expanded(child:Container(height: 136.0,decoration:BoxDecoration(image:DecorationImage(image: AssetImage("image/img_unsub_bg.png"),fit: BoxFit.fill)),child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                  Container(width: 72.0, height: 24.0,alignment:Alignment.center,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("image/img_bargain_bg.png"))),child: Text("Trial",style: TextStyle(fontSize: 14.0,color:Colors.white))),
                  Container(height: 14.0),
                  Container(alignment: Alignment.center,child:Text("Monthly",style: TextStyle(color: Color(0xff222222),fontSize: 12.0,fontWeight: FontWeight.w600))),
                  Container(height: 14.0),
                  Container(alignment: Alignment.center,child:Text("\$4.99",style: TextStyle(color: Color(0xff222222),fontSize: 28.0,fontWeight: FontWeight.w600))),
                  Container(height: 4.0),
                  Container(alignment: Alignment.center,child:Text("\$8.53",style: TextStyle(color: Color(0xff222222),fontSize: 11.0,decoration: TextDecoration.lineThrough))),
                ]))),
                Container(width: 12.0),
                Expanded(child:Container(height: 136.0,decoration:BoxDecoration(image:DecorationImage(image: AssetImage("image/img_unsub_bg.png"),fit: BoxFit.fill)),child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                  Container(width: 72.0, height: 24.0,alignment:Alignment.center,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("image/img_bargain_bg.png"))),child: Text("Trial",style: TextStyle(fontSize: 14.0,color:Colors.white))),
                  Container(height: 14.0),
                  Container(alignment: Alignment.center,child:Text("Monthly",style: TextStyle(color: Color(0xff222222),fontSize: 12.0,fontWeight: FontWeight.w600))),
                  Container(height: 14.0),
                  Container(alignment: Alignment.center,child:Text("\$4.99",style: TextStyle(color: Color(0xff222222),fontSize: 28.0,fontWeight: FontWeight.w600))),
                  Container(height: 4.0),
                  Container(alignment: Alignment.center,child:Text("\$8.53",style: TextStyle(color: Color(0xff222222),fontSize: 11.0,decoration: TextDecoration.lineThrough))),
                ])),),
                Container(width: 12.0),
                Expanded(child:Container(height: 136.0,decoration:BoxDecoration(image:DecorationImage(image: AssetImage("image/img_unsub_bg.png"),fit: BoxFit.fill)),child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                  Container(width: 72.0, height: 24.0,alignment:Alignment.center,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("image/img_bargain_bg.png"))),child: Text("Trial",style: TextStyle(fontSize: 14.0,color:Colors.white))),
                  Container(height: 14.0),
                  Container(alignment: Alignment.center,child:Text( "Monthly",style: TextStyle(color: Color(0xff222222),fontSize: 12.0,fontWeight: FontWeight.w600))),
                  Container(height: 14.0),
                  Container(alignment: Alignment.center,child:Text("\$4.99",style: TextStyle(color: Color(0xff222222),fontSize: 28.0,fontWeight: FontWeight.w600))),
                  Container(height: 4.0),
                  Container(alignment: Alignment.center,child:Text("\$8.53",style: TextStyle(color: Color(0xff222222),fontSize: 11.0,decoration: TextDecoration.lineThrough))),
                ])),),
                Container(width: 17.0)
              ]),
              Container(height:10.0),
              Row(children: [Container(width: 15.7),Expanded(child:RichText(softWrap:true,maxLines:2,text: TextSpan(text:"*\$2.99 for 1st month trial, \$4.99/mo thereafter.",style: TextStyle(fontSize: 12.0,color: Color(0xff3CDEF4)),children: [TextSpan(text: "You can cancel anytime.",style: TextStyle(fontSize: 12.0,color: Color(0xff999999)))]))),Container(width: 17)]),
              GestureDetector(child:Container(margin: EdgeInsets.fromLTRB(23.5, 20.0, 23.5, 13.0),height: 44.0,decoration: BoxDecoration(borderRadius:BorderRadius.circular(22.0),gradient: LinearGradient(begin:Alignment.centerLeft,end:Alignment.centerRight,stops:[0.0,1.0],colors: [Color(0xffedc391),Color(0xfffdddb7)])),child:
              Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                Text("\$2.99",style: TextStyle(color:Color(0xff685034),fontSize: 20.0,fontWeight: FontWeight.w600,)),
                Container(padding:EdgeInsets.only(top:3.0,left: 2.0),child:Text("1st month trial",style: TextStyle(color:Color(0xff685034),fontSize: 14.0,fontWeight: FontWeight.w600))),
              ])
              ),onTap: (){
                htMethodShowPayProptDialog(context);
              }),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                RichText(text: TextSpan(text: "If the ad still appears, tap ",style: TextStyle(fontSize: 12.0,color: Color(0xff999999)),children: [
                  TextSpan(text:"Restore",style: TextStyle(fontSize: 12.0,color:Colors.white,decoration: TextDecoration.underline))
                ]))
              ]),
              Container(height: 0.3,color: Color(0xffECECEC),margin: EdgeInsets.only(top: 12.0)),
              Container(height: 20.0),
              Row(crossAxisAlignment:CrossAxisAlignment.start,children:[Container(width: 15.7),Container(margin:EdgeInsets.only(top:6.0,right: 8.0),width:6.0,height:6.0,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(3.0)),),
                Expanded(child:RichText(softWrap:true,text: TextSpan(text:"Subscription automatically renews ",style: TextStyle(fontSize: 12.0,color: Colors.white,height: 1.5),children: [
                  TextSpan(text:"unless auto-renewal is disabled at least 24 hours before the end of the current period.",style: TextStyle(fontSize: 12.0,color: Color(0xff999999),height: 1.5)
                  )])))
              ]),
              Container(height: 10.0),
              Row(crossAxisAlignment:CrossAxisAlignment.start,children:[Container(width: 15.7),Container(margin:EdgeInsets.only(top:6.0,right: 8.0),width:6.0,height:6.0,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(3.0)),),
                Expanded(child:RichText(softWrap:true,text: TextSpan(text:"Subscriptions can be managed by the user and ",style: TextStyle(fontSize: 12.0,color: Color(0xff999999),height: 1.5),children: [
                  TextSpan(text:"automatic renewal can be disabled ",style: TextStyle(fontSize: 12.0,color: Colors.white,height: 1.5)),
                  TextSpan(text:"by going to the User Account Settings after purchase.",style: TextStyle(fontSize: 12.0,color: Color(0xff999999),height: 1.5),
                  )])))
              ]),
              Container(height: 10.0),
              Row(crossAxisAlignment:CrossAxisAlignment.start,children:[Container(width: 15.7),Container(margin:EdgeInsets.only(top:6.0,right: 8.0),width:6.0,height:6.0,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(3.0)),),
                Expanded(child:RichText(softWrap:true,text: TextSpan(text:"You must confirm and pay the VIP subscription through the iTunes account in the purchase confirmation.",style: TextStyle(fontSize: 12.0,color: Color(0xff999999),height: 1.5))))
              ]),
            ])))
          )])),//不需要分流结束
          // Offstage(offstage:true,child:Expanded(child: SingleChildScrollView(child: Column(children: [
          //   Container(height: 22.0),
          //   Container(alignment:Alignment.centerLeft,margin:EdgeInsets.only(left: 16.0),child: Text("- All Privileges -",style: TextStyle(fontSize:16.0,color:Colors.white,fontWeight:FontWeight.w600))),
          //   Container(margin:EdgeInsets.only(top:6.0,left:16.0,right:16.0),decoration:BoxDecoration(borderRadius: BorderRadius.circular(6.0),color:Color(0xff1B1C20)),child: Column(children: [
          //   Container(margin: EdgeInsets.fromLTRB(10.7, 16.0, 10.0, 0),child: Row(children: [
          //     Expanded(child: Row(children: [Image.asset("image/icon_play_language_h.png",width: 15.0,height: 15.0),Container(width: 9.3),Text("Remove ADS",style:TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600,color:Colors.white))])),
          //     Expanded(child: Row(children: [Container(width: 17.5),Image.asset("image/icon_play_language_h.png",width: 15.0,height: 15.0),Container(width: 9.3),Text("Unlock All Movies",style:TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600,color:Colors.white))]))
          //   ])),Container(height: 24.0),
          //   Container(margin: EdgeInsets.fromLTRB(10.7, 0.0, 10.0, 16.0),child: Row(children: [
          //     Expanded(child: Row(children: [Image.asset("image/icon_play_language_h.png",width: 15.0,height: 15.0),Container(width: 9.3),Text("HD Resources",style:TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600,color:Colors.white))])),
          //     Expanded(child: Row(children: [Container(width: 17.5),Image.asset("image/icon_play_language_h.png",width: 15.0,height: 15.0),Container(width: 9.3),Text("Watch On TV",style:TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600,color:Colors.white))]))
          //   ])),
          //   ])),
          // Container(height:30.0),
          // Row(mainAxisAlignment:MainAxisAlignment.center,children: [
          //   Image.asset("image/icon_import_banner_left.png",width:32.0,height:16.0),
          //   Container(width:2.5),
          //   Text("WARNING",style: TextStyle(color:Colors.white,fontSize:18.0,fontWeight:FontWeight.w600)),
          //   Container(width:2.5),
          //   Image.asset("image/icon_import_banner_right.png",width:32.0,height:16.0),
          // ]),
          //   Container(height:16.0),
          //   Container(child:Text("Because of Apple Policy, you cannot \nsubscribe here.",textAlign:TextAlign.center,style: TextStyle(fontSize: 15.0,color:Colors.white,fontWeight: FontWeight.w600,height: 1.3))),
          //   Container(margin:EdgeInsets.only(top:6.0),child:Text("You can download the new APP to \nsubscribe.",textAlign:TextAlign.center,style: TextStyle(fontSize: 15.0,color:Colors.white,fontWeight: FontWeight.w600,height: 1.3))),
          //   Container(height:32.0),
          //   Container(margin:EdgeInsets.fromLTRB(57.5, 0, 57.5, 0),height:44.0,decoration:BoxDecoration(gradient: LinearGradient(begin:Alignment.centerLeft,end:Alignment.centerRight,stops: [0.0,1.0],colors: [Color(0xff5a64e9),Color(0xff357abc)]),borderRadius: BorderRadius.circular(12.0)),alignment: Alignment.center,child:
          //   Text("DOWNLOAD NOW",style: TextStyle(color:Colors.white,fontSize:16.0,fontWeight:FontWeight.w600)))
          // ]))))//需要分流结束
        ])));
  }

  Future<void> htMethodShowPayProptDialog(BuildContext ctx) async {
    await showDialog(
        context: context,
        builder: (context1) {
      return Dialog(backgroundColor:Colors.transparent,child: Container(height: 422.0,decoration: BoxDecoration(color: Color(0xff292A2F),borderRadius: BorderRadius.circular(12.0)),child:
          Column(children: [
            Container(height: 45.4),
            Stack(children: [
              Container(margin: EdgeInsets.fromLTRB(33.0, 0, 29.0, 0),height: 190.0),
              Positioned(left: 51.0,right: 54.0,height: 190.0,top:0.0,child:Image.asset("image/img_premium_paydialog_body.png")),
              Positioned(left:33.0,right:29.0,top:0.0,height:44.0,child: Image.asset("image/icon_premium_paydialog_header.png")),
            ]),
            Container(height: 28.6),
            Container(child: Text("Subscribe at XXX to become PREM",style: TextStyle(color:Color(0xffFFD29D),fontSize: 14.0,fontWeight: FontWeight.bold))),
            Container(height: 39.0),
            GestureDetector(child:Container(margin: EdgeInsets.fromLTRB(31.0, 0.0, 31.0, 0.0),height: 44.0,width:double.infinity,alignment:Alignment.center,decoration: BoxDecoration(borderRadius:BorderRadius.circular(22.0),gradient: LinearGradient(begin:Alignment.centerLeft,end:Alignment.centerRight,stops:[0.0,1.0],colors: [Color(0xffedc391),Color(0xfffdddb7)])),child:
              Text("Go Subscribe",style: TextStyle(color:Color(0xff685034),fontSize: 16.0,fontWeight: FontWeight.w600,)),
            ),onTap: (){
              Navigator.pop(context1);
            }),
            Container(height: 16.0),
            Container(child: Text("Later",style: TextStyle(color:Color(0xff999999),fontSize: 12.0,decoration: TextDecoration.underline))),
          ])
        ));
    });
  }
}