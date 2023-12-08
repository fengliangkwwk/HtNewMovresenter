import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';

///follow This Link 模块
// class FollowLinkWidget extends StatelessWidget {
//    const FollowLinkWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return  const FollowLinkWidget();
//   }

class FollowLinkWidget extends StatelessWidget {
 FollowLinkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return followLinkWidget();
  }

  Widget followLinkWidget() {
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
      decoration: BoxDecoration(
        color: const Color(0xff1B1C20),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("follow this link",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xffECECEC),
                      fontWeight: FontWeight.bold)),
              Container(height: 6.0),
              const Text(
                "join premium members group",
                style: TextStyle(
                  fontSize: 10.0,
                  color: Color(0xffAEAFB1),
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap:(() {
              print('link');
            }),
            child: CachedNetworkImage(
              imageUrl: ImageURL.url_181,
              width: 44,
              height: 44,
            ),
          ),
          Container(
            width: 8,
          ),
        ],
      ),
    );
  }
}
