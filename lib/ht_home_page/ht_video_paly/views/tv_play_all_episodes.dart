import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/bean/ht_season_and_episode_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/bean/ht_set_list_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:provider/provider.dart';

class AllEpisodesWidget extends StatelessWidget {
  const AllEpisodesWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Selector<HTVideoDescProvider,Ssn_list?>(
      selector: (p0, p1) => p1.selectSsnModelData,
      builder: (context, value, child) {
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
            // padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            margin: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 9.0),
            height: 40.0,
            // color: Colors.amber,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  context.read<HTVideoDescProvider>().seasonList()?.length,
              itemBuilder: ((context, index) {
                var provider = context.read<HTVideoDescProvider>();
                Ssn_list model = provider.seasonList()?[index];
                if (model.id.toString() == provider.sid) {
                  model.isCurrent = true;
                } else {
                  model.isCurrent = false;
                }
                return GestureDetector(
                  onTap: () {
                    provider.changeSesion(model);
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: model.isCurrent == true
                            ? const Color(0xFF003f47)
                            : const Color(0xff23252A),
                        borderRadius: BorderRadius.circular(4.0)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(model.title ?? "",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: model.isCurrent == true
                                      ? const Color(0xFF3CDEF4)
                                      : Colors.white,
                                  fontSize: 12.0),
                              maxLines: 1),
                        ]),
                  ),
                );
              }),
            )),
        Container(height: 1, color: const Color(0xff3F3F5C)),
        Expanded(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
                itemCount: context.read<HTVideoDescProvider>().setList()?.length,
                scrollDirection: Axis.vertical,
                itemBuilder: ((context, index) {
                  var provider = context.read<HTVideoDescProvider>();
                  Eps_list model = provider.setList()?[index];
                  if (provider.eid == model.id.toString()) {
                    model.isCurrent = true;
                  } else {
                    model.isCurrent = false;
                  }
                  return GestureDetector(
                    onTap: () {
                      provider.changePlayerSource(model);
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                      height: 70,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: const BoxDecoration(
                        color: Color(0xff23252A),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.epsNum.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: model.isCurrent == true
                                    ? const Color(0xFF3CDEF4)
                                    : Colors.white,
                                fontSize: 16.0,
                              ),
                              maxLines: 1),
                          Container(height: 4.0),
                          Text(
                            model.title ?? "",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: model.isCurrent == true
                                  ? const Color(0xFF3CDEF4)
                                  : Colors.white,
                              fontSize: 14.0,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
          ),
        ),
      ]),
    );
    },);
  }
}
