import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/views/setting_feedback.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/views/setting_persondata.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/views/setting_play_history.dart';

class HTClassSettingInfoPage extends StatefulWidget {
  const HTClassSettingInfoPage({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<HTClassSettingInfoPage> createState() => _HTClassSettingInfoPageState();
}

class _HTClassSettingInfoPageState extends State<HTClassSettingInfoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xff294673),
                  Color(0xff111218),
                  Color(0xff111218)
                ],
                    stops: [
                  0.0,
                  0.08,
                  1.0
                ])),
            child: SingleChildScrollView(
                child: Column(children: [
              Container(height: MediaQuery.of(context).padding.top + 20.0),
              GestureDetector(
                  child: Row(children: [
                    Container(
                        width: 54.0,
                        height: 54.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "image/icon_setting_header_def.png")),
                            borderRadius: BorderRadius.circular(27.0),
                            border: Border.all(color: Colors.white))),
                    Container(width: 15.0),
                    Text("Login/Signup",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    Spacer(),
                    Image.asset("image/icon_setting_arrowr.png",
                        width: 24.0, height: 24.0),
                    Container(width: 10.0),
                  ]),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const HTClassPersondataPage(title: "");
                    }));
                  }),
              Container(
                  height: 60.0,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(0.0, 20.0, 10.0, 23.0),
                  padding: EdgeInsets.only(left: 16.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("image/img_main_advs.png"),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("special offer for you",
                            style: TextStyle(
                                color: Color(0xff222222),
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600)),
                        Container(height: 4.0),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("\$",
                                  style: TextStyle(
                                      color: Color(0xff222222),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600)),
                              Text("2.99",
                                  style: TextStyle(
                                      color: Color(0xff222222),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600)),
                              Container(width: 3.0),
                              Text("for the 1 Month",
                                  style: TextStyle(
                                      color: Color(0xff222222),
                                      fontSize: 10.0)),
                            ])
                      ])),
              Row(children: [
                Image.asset("image/icon_setting_clock.png",
                    width: 16.0, height: 16.0),
                Container(width: 5.0),
                Text("History",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
                Spacer(),
                GestureDetector(
                    child: Image.asset("image/icon_setting_arrowr.png",
                        width: 24.0, height: 24.0),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const HTClassPresHistoryPage(title: "");
                      }));
                    }),
                Container(width: 10.0)
              ]),
              Container(
                  height: 226.0,
                  margin: EdgeInsets.only(top: 11.0, bottom: 21.0),
                  padding: EdgeInsets.fromLTRB(0.0, 0, 5, 0),
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [1, 2, 3, 4, 5]
                          .map((index) => GestureDetector(
                              child: Container(
                                  width: 112.0,
                                  margin: EdgeInsets.only(right: 5.0),
                                  child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            child: Image.asset(
                                                "image/pic_banner_test.png",
                                                height: 180.0,
                                                fit: BoxFit.fill)),
                                        Container(
                                            padding:
                                                EdgeInsets.only(bottom: 45.0),
                                            child: Image.asset(
                                                "image/icon_setting_his_play.png",
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.fill)),
                                        Positioned(
                                            left: 5.0,
                                            top: 5.0,
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text("8.",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffFF6D1C),
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  Text("0",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffFF6D1C),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600))
                                                ])),
                                        Positioned(
                                            top: 185.0,
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
              GestureDetector(
                  child: Row(children: [
                    Image.asset("image/icon_setting_task_h.png",
                        width: 16.0, height: 16.0),
                    Container(width: 5.0),
                    Text("Watchlist",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                    Spacer(),
                    Image.asset("image/icon_setting_arrowr.png",
                        width: 24.0, height: 24.0),
                    Container(width: 10.0)
                  ]),
                  onTap: () {}),
              Container(height: 30.0),
              Row(children: [
                Image.asset("image/icon_main_upload.png",
                    width: 16.0, height: 16.0),
                Container(width: 5.0),
                Text("Share",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
                Spacer(),
                Image.asset("image/icon_setting_arrowr.png",
                    width: 24.0, height: 24.0),
                Container(width: 10.0)
              ]),
              Container(height: 30.0),
              GestureDetector(
                  child: Row(children: [
                    Image.asset("image/icon_play_feedback.png",
                        width: 16.0, height: 16.0),
                    Container(width: 5.0),
                    Text("Feedback",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                    Spacer(),
                    Image.asset("image/icon_setting_arrowr.png",
                        width: 24.0, height: 24.0),
                    Container(width: 10.0)
                  ]),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const HTClassFeedbackPage(title: "");
                    }));
                  }),
              Container(height: 15.0),
            ])
            )
        )
    );
  }
}
