import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/bean/ht_season_and_episode_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/bean/ht_set_list_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:provider/provider.dart';
// import 'package:quds_popup_menu/quds_popup_menu.dart';

// ignore: must_be_immutable
class TVPlayPartWidget extends StatelessWidget {
  TVPlayPartWidget({
    Key? key,
  }) : super(key: key);
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  @override
  Widget build(BuildContext context) {
    return tvPlayPartWidget(context);
  }

  Widget tvPlayPartWidget(BuildContext context) {
    List<Ssn_list?>? ssnList =
        (context.read<HTVideoDescProvider>().seasonList())?.cast<Ssn_list?>();
    HTVideoDescProvider provider = context.read<HTVideoDescProvider>();

    print(
        '🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎${ssnList?.length}');
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 5),
          child: Row(
            children: [
              ///Season 那一行
              Selector<HTVideoDescProvider, Ssn_list?>(
                selector: (p0, p1) => p1.selectSsnModelData,
                builder: (context, value, child) {
                  return DropdownButtonHideUnderline(
                    child: DropdownButton2<Ssn_list?>(
                      items: (ssnList ?? <Ssn_list?>[])
                          .map(
                            (Ssn_list? item) => DropdownMenuItem<Ssn_list?>(
                              value: item,
                              child: Text(
                                item?.title ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: provider.changeSesion,
                      hint: Text(
                        provider.ssnTitle(value?.id.toString() ?? ''),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      style: const TextStyle(
                        // 设置下拉列表中选中项的文本样式
                        color: Colors.white, //设置文本颜色
                      ),
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color(0xff23252A),
                        ),
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 144,
                        width: 115,
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xff23252A),
                        ),
                        offset: const Offset(0, -4),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  );
                },
              ),
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
                      style:
                          TextStyle(color: Color(0xff999999), fontSize: 14.0)),
                  Container(width: 4.0),
                  CachedNetworkImage(
                      imageUrl: ImageURL.url_288, width: 16.0, height: 16.0),
                ]),
              ),
            ],
          ),
        ),
        ////中间的横线
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: double.infinity,
          height: 1,
          color: const Color(0xff3F3F5C),
        ),

        ///横线下面的集列表
        Selector<HTVideoDescProvider, HtSetListBean?>(
          selector: (p0, p1) => p1.tv203Bean,
          builder: (context, value, child) {
            var dataList = provider.setList() ?? [];
            return Visibility(
              visible: dataList.isEmpty ? false : true,
              child: Container(
                margin: const EdgeInsets.only(top: 5, left: 10),
                height: 66.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dataList.length,
                  itemBuilder: ((context, index) {
                    Eps_list model = dataList[index];
                    return GestureDetector(
                      onTap: () {
                        provider.changePlayerSource(model);
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        margin: const EdgeInsets.only(right: 10.0),
                        width: 140.0,
                        height: 66.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff23252A),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.epsNum.toString(),
                              style: TextStyle(
                                color: provider.eid == model.id.toString()
                                    ? const Color(0xff3cdef4)
                                    : const Color(0xff999999),
                                fontSize: 10.0,
                              ),
                            ),
                            Container(height: 4.0),
                            Text(
                              model.title ?? "",
                              style: TextStyle(
                                  color: provider.eid == model.id.toString()
                                      ? const Color(0xff3cdef4)
                                      : const Color(0xff999999),
                                  fontSize: 12.0),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
