import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/view/current_plan_card.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/view/follow_link.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/view/product_theme_part.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';

class PremiumSecondPageWidget extends StatefulWidget {
  const PremiumSecondPageWidget({Key? key}) : super(key: key);

  @override
  State<PremiumSecondPageWidget> createState() =>
      _PremiumSecondPageWidgetState();
}

class _PremiumSecondPageWidgetState extends State<PremiumSecondPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: const Color(0xff1A1C21),
          title: const Text("Premium",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600)),
          centerTitle: true,
          leadingWidth: 24.0,
          leading:InkWell(
             onTap:(){
                Navigator.of(context).pop();
              },
              child: CachedNetworkImage(
                imageUrl: ImageURL.url_291,
                width: 24.0,
                height: 24.0,
                fit: BoxFit.contain,
              ),
          )),
      body: Column(
        children: [
          CurrentPlanCardWidget(),
          const FollowLinkWidget(),
          const ProductThemePartWidget(),
        ],
      ),
    );
  }
}
