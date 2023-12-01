import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/feed_back/provider/feed_back_provider.dart';
import 'package:ht_new_movpresenter/utils/url_getImageurl.dart';
import 'package:provider/provider.dart';

class HTClassFeedbackPage extends StatefulWidget {
  final String title;
  final String? vid;
  final String? sid;
  final String? eid;
  const HTClassFeedbackPage(
      {Key? key, required this.title, this.vid, this.sid, this.eid})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<HTClassFeedbackPage> createState() => _HTClassFeedbackPageState();
}

class _HTClassFeedbackPageState extends State<HTClassFeedbackPage> {
  FeedBackProvider provider = FeedBackProvider();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => provider),
      ],
      child: GestureDetector(
        onTap: (() {
          FocusScope.of(context).unfocus();
        }),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.black,
            appBar: AppBar(
                backgroundColor: Color(0xff1A1C21),
                title: Text(widget.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600)),
                centerTitle: true,
                leadingWidth: 24.0,
                leading: GestureDetector(
                  onTap: (() {
                    Navigator.pop(context);
                  }),
                  child: CachedNetworkImage(
                      imageUrl: ImageURL.url_291,
                      width: 24.0,
                      height: 24.0,
                      fit: BoxFit.scaleDown),
                )),
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
                        const Text("Question/Feedback",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {},
                            controller: provider.contentFieldController,
                            style: const TextStyle(color: Colors.white),
                            maxLines: 8,
                            decoration: const InputDecoration(
                              hintText:
                                  "please describe your problems or suggestions here",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Color(0xff969696), fontSize: 14.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(height: 20.0),
                  Container(
                      height: 178.0,
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Color(0xff23252A)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Question/Feedback",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Expanded(
                                child: TextField(
                                    controller: provider.emailFieldController,
                                    style: const TextStyle(color: Colors.white),
                                    maxLines: 5,
                                    decoration: const InputDecoration(
                                        hintText:
                                            "please describe your problems or suggestions here",
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            color: Color(0xff969696),
                                            fontSize: 14.0))))
                          ])),
                  Container(height: 40.0),
                  GestureDetector(
                    onTap: (() {

                      print("${widget.vid} ++++++++    ${widget.sid} ++++++++++     ${widget.eid}");
                      provider.submit(
                        content: provider.contentFieldController.value.text,
                        email: provider.emailFieldController.value.text,
                        vid: widget.vid,
                        sid: widget.sid,
                        eid: widget.eid,
                      );
                    }),
                    child: Container(
                        alignment: Alignment.center,
                        height: 40.0,
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: const Text(
                          "Submit",
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffB82450),
                            borderRadius: BorderRadius.circular(6.0))),
                  ),
                  Container(height: 31.5),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Or You Can Contact Us At: ",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0)),
                        Text("Xxx@Xxxx.com",
                            style: TextStyle(
                                color: Color(0xff5DA7FF),
                                fontSize: 12.0,
                                decoration: TextDecoration.underline)),
                      ])
                ]))),
      ),
    );
  }
}
