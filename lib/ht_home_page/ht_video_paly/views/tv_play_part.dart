import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider.dart';
import 'package:ht_new_movpresenter/utils/url_getImageurl.dart';
import 'package:provider/provider.dart';
// import 'package:quds_popup_menu/quds_popup_menu.dart';

class TVPlayPartWidget extends StatelessWidget {
  final void Function(bool) allEpisodesEvent;
  const TVPlayPartWidget({
    Key? key,
    required this.allEpisodesEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tvPlayPartWidget(context);
  }

  Widget tvPlayPartWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ///Season 那一行
            Container(
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                width: 95.0,
                height: 28.0,
                decoration: BoxDecoration(
                    color: const Color(0xff23252A),
                    borderRadius: BorderRadius.circular(5.0)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Season 1",
                      style: TextStyle(color: Colors.white, fontSize: 14.0)),
                  Container(width: 6.0),
                  CachedNetworkImage(
                      imageUrl: ImageURL.url_114, width: 10.0, height: 8.0)
                ])),
            const Spacer(),
            GestureDetector(
              onTap: (() {
                if (kDebugMode) {
                  print('你好👋你好👋你好👋你好👋你好👋你好👋');
                }
                // allEpisodesEvent(true);
                context.read<HTVideoDescProvider>().allEpisodesEvent();
              }),
              child: Row(children: [
                const Text("All Episodes",
                    style: TextStyle(color: Color(0xff999999), fontSize: 14.0)),
                Container(width: 4.0),
                CachedNetworkImage(
                    imageUrl: ImageURL.url_288, width: 16.0, height: 16.0),
              ]),
            ),
          ],
        ),
        ////中间的横线
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: double.infinity,
          height: 1,
          color: const Color(0xff3F3F5C),
        ),

        ///横线下面的列表
        Container(
            margin: const EdgeInsets.only(top: 5, left: 10),
            height: 66.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [1, 2, 3, 4, 5]
                  .map((index) => Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      margin: const EdgeInsets.only(right: 10.0),
                      width: 140.0,
                      height: 66.0,
                      decoration: BoxDecoration(
                          color: const Color(0xff23252A),
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("EP 1",
                                style: TextStyle(
                                    color: Color(0xff999999), fontSize: 10.0)),
                            Container(height: 4.0),
                            const Text(
                              "Ryomen Sukuna\naisfhioa aios ryomen sukuna",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0),
                              maxLines: 2,
                            ),
                          ])))
                  .toList(),
            ))
      ],
    );
  }
}
