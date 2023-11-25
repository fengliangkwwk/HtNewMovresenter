import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider.dart';
import 'package:ht_new_movpresenter/utils/url_getImageurl.dart';
import 'package:provider/provider.dart';

class AllEpisodesWidget extends StatelessWidget {

  const AllEpisodesWidget({Key? key  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: MediaQuery.of(context).size.height - 270,
        color: const Color(0xff111218),
        child: Column(children: [
          Container(height: 20.0),
          Row(children: [
            Container(width: 10.0),
            const Text("Episodes",
                style: TextStyle(
                    color: Color(0xffECECEC),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500)),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.read<HTVideoDescProvider>().allEpisodesEvent();
              },
              child: CachedNetworkImage(
                  imageUrl: ImageURL.url_306, width: 20.0, height: 20.0),
            ),
            Container(
              width: 10.0,
            )
          ]),
          Container(
              margin: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 9.0),
              height: 30.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [1, 2, 3, 4, 5]
                    .map((index) => Container(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        margin: const EdgeInsets.only(right: 10.0),
                        width: 74.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                            color: const Color(0xff23252A),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Season 1",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                  maxLines: 1),
                            ])))
                    .toList(),
              )),
          Container(height: 1, color: const Color(0xff3F3F5C)),
          Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [1, 2, 3, 4, 5]
                  .map((index) => Container(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                      margin: const EdgeInsets.only(top: 10.0),
                      height: 60.0,
                      decoration: const BoxDecoration(color: Color(0xff23252A)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Season 1",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                                maxLines: 1),
                            Container(height: 4.0),
                            const Text(
                              "when van helsing’s mysterious invention myster ious...",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14.0),
                              maxLines: 1,
                            ),
                          ])))
                  .toList(),
                        ),
              ))
        ]));
  }
}
