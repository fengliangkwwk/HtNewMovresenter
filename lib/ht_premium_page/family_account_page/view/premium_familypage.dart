///家庭主账号页面
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';

class HTClassFamilyPage extends StatefulWidget {
  const HTClassFamilyPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HTClassFamilyPage> createState() => _HTClassFamilyPageState();
}

class _HTClassFamilyPageState extends State<HTClassFamilyPage> {
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
        appBar: AppBar(
            backgroundColor: const Color(0xff1A1C21),
            title: const Text("Family Account",
                style: TextStyle(
                    color: Colors.white,
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

            ///右上边的离开按钮
            actions: [
              GestureDetector(
                child: Container(
                    margin: EdgeInsets.only(right: 15.0, top: 3.0),
                    child: CachedNetworkImage(
                      imageUrl: ImageURL.url_346,
                      width: 24.0,
                      height: 24.0,
                    )),
                onTap: () {
                  setState(() {
                    if (htVarIsEditMode = true) {
                      htVarIsEditMode = true;
                    } else {
                      htVarIsEditMode = false;
                    }
                  });

                  //  if(htVarIsEditMode = true){
                  //     htVarIsEditMode = false;
                  //   }else{
                  //   htVarIsEditMode = true;
                  //   }
                },
              )
            ]),
        body: SingleChildScrollView(
            child: Column(children: [
          ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [1, 2, 3, 4]
                  .map((e) => Container(
                      height: 74.0,
                      child: Column(children: [
                        Container(
                            height: 73.5,
                            child: Row(children: [
                              Container(width: 20.0),
                              const CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Color(0xffD9D9D9)),
                              Container(width: 10.0),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(children: [
                                      const Text("Aurora" + "(Me)",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0)),
                                      Container(width: 10.0),

                                      ///订阅状态 url_341     为订阅状态   url_342
                                      Container(
                                          padding: EdgeInsets.only(top: 3.0),
                                          child: CachedNetworkImage(
                                              imageUrl: ImageURL.url_341,
                                              width: 20.0,
                                              height: 20.0))
                                    ]),
                                    Container(height: 6.0),
                                    const Text("Member",
                                        style: TextStyle(
                                            color: Color(0xff999999),
                                            fontSize: 14.0))
                                  ]),
                              Spacer(),
                              Visibility(
                                  visible: htVarIsEditMode,
                                  child: GestureDetector(
                                      child: CachedNetworkImage(
                                          imageUrl: ImageURL.url_83,
                                          width: 24.0,
                                          height: 24.0),
                                      onTap: () {
                                        htMethodShowDelConfirmDialog(context);
                                      })),
                              Container(width: 25.0)
                            ])),
                        Container(
                            height: 0.5,
                            color: Color(0x23ffffff),
                            margin: EdgeInsets.only(left: 20.0))
                      ])))
                  .toList()),
          Offstage(
              offstage: !htVarIsEditMode,
              child: Container(
                margin: const EdgeInsets.fromLTRB(37.7, 96.0, 37.3, 0.0),
                height: 44.0,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.0),
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.0, 1.0],
                        colors: [Color(0xffedc391), Color(0xfffdddb7)])),
                child: const Text("Buy Family Plan",
                    style: TextStyle(
                      color: Color(0xff685034),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    )),
              )),
          Offstage(
              offstage:htVarIsEditMode,
              child: Container(
                margin: const EdgeInsets.fromLTRB(37.7, 202.0, 37.3, 0.0),
                height: 44.0,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.0),
                    color: Colors.white),
                child: const Text("Quit Family Account",
                    style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    )),
              )),
        ])));
  }

  void htMethodShowDelConfirmDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (context1) {
          return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                  height: 213.0,
                  decoration: BoxDecoration(
                      color: Color(0xff292A2F),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Column(children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(20.0, 34.0, 20.0, 0),
                        child: const Text(
                            "Are you sure you want delete this \nfamily account?",
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.0))),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 18.0),
                        height: 44.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22.0),
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [
                                  0.0,
                                  1.0
                                ],
                                colors: [
                                  Color(0xfff27f7f),
                                  Color(0xffd93b3a)
                                ])),
                        child: const Text("Delete",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600))),
                    Container(
                        child: const Text("Cancel",
                            style: TextStyle(
                                color: Color(0xff999999),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline))),
                  ])));
        });
  }
}
