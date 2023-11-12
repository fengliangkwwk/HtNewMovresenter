import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/utils/ht_user_store.dart';

class HTClassFeedbackPage extends StatefulWidget {
  const HTClassFeedbackPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HTClassFeedbackPage> createState() => _HTClassFeedbackPageState();
}

class _HTClassFeedbackPageState extends State<HTClassFeedbackPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false  ,
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Color(0xff1A1C21),
            title: Text("Feedback",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600)),
            centerTitle: true,
            leadingWidth: 24.0,
            leading: Image.asset("image/icon_setting_back_w.png",
                width: 24.0, height: 24.0, fit: BoxFit.scaleDown)),
        body: Container(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
            child: Column(children: [
              Container(
                  height: 223.0,
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Color(0xff23252A)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Question/Feedback",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                        Expanded(
                            child: TextField(
                                controller: TextEditingController(),
                                style: TextStyle(color: Colors.white),
                                maxLines: 8,
                                decoration: InputDecoration(
                                    hintText:
                                        "please describe your problems or suggestions here",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Color(0xff969696),
                                        fontSize: 14.0))))
                      ])),
              Container(height: 20.0),
              Container(
                  height: 178.0,
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Color(0xff23252A)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Question/Feedback",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                        Expanded(
                            child: TextField(
                                controller: TextEditingController(),
                                style: TextStyle(color: Colors.white),
                                maxLines: 5,
                                decoration: InputDecoration(
                                    hintText:
                                        "please describe your problems or suggestions here",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Color(0xff969696),
                                        fontSize: 14.0))))
                      ])),
              Container(height: 40.0),
              Container(
                  alignment: Alignment.center,
                  height: 40.0,
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    "Logout",
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xffB82450),
                      borderRadius: BorderRadius.circular(6.0))),
              Container(height: 31.5),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Or You Can Contact Us At: ",
                    style: TextStyle(color: Colors.white, fontSize: 12.0)),
                Text("Xxx@Xxxx.com",
                    style: TextStyle(
                        color: Color(0xff5DA7FF),
                        fontSize: 12.0,
                        decoration: TextDecoration.underline)),
              ])
            ])));
  }
}
