// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/bean/home_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/bean/homedropping_water_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/providers/ht_home_provider.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/views/second_level_page.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/views/search_middlepage.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/views/play_detailpage.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/views/play_detailpage_drama.dart';
import 'package:ht_new_movpresenter/utils/url_getImageurl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:ht_new_movpresenter/utils/ht_sys_tool.dart';

class HTClassHomeMainPage extends StatefulWidget {
  const HTClassHomeMainPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HTClassHomeMainPage> createState() => _HTClassHomeMainPageState();
}

class _HTClassHomeMainPageState extends State<HTClassHomeMainPage> {
  final HTHomeProvider homeProvider = HTHomeProvider();

  ///初始化provider
  @override
  void initState() {
    homeProvider.loadData();
    // _htVarDataController.imageList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => homeProvider,
          )
        ],
        child: Selector<HTHomeProvider,
            Tuple3<List<DataList>, List<HomedroppingWaterBean>, bool>>(
          selector: (p0, p1) =>
              Tuple3(p1.dataList, p1.droppingWaterDataList, p1.loading),
          builder: (context, value, child) {
            return ModalProgressHUD(
              inAsyncCall: false,
              child: Scaffold(
                backgroundColor: Colors.black,
                body: EasyRefresh(
                  onLoad: homeProvider.onLoad,
                  onRefresh: homeProvider.onRefresh,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        HTTopSearchWidget(),
                        ...mainListWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }

  List<Widget> mainListWidget() {
    var result = <Widget>[];
    bool ishasAd = false;
    for (var element in homeProvider.dataList) {
      ///专题 data_type 目前只支持 1（电视剧/电影） 和 4（18+）
      if (element.display_type == '3' && element.itemData?.isNotEmpty == true) {
        ///轮播图
        result.add(HTBannerWidget(element));
      }

      ///横向
      if (element.display_type == '2') {
        result.add(HTSideslipWiget(element));
        if (ishasAd == false) {
          result.add(adWidget());
          ishasAd = true;
        }
      }

      ///九宫格
      if (element.display_type == '1') {
        result.add(HTGridStyleWidget(element));
        if (element.moreflag == '1') {
          result.add(seeAllAndMoreButtoonWidget(element));
        }
        if (ishasAd == false) {
          result.add(adWidget());
          ishasAd = true;
        }
      }
    }

    ///瀑布流

    if (homeProvider.droppingWaterDataList.isNotEmpty) {
      result.add(Container(
        margin: const EdgeInsets.only(top: 0, bottom: 10),
        height: 20,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 30),
              width: 60,
              height: 0.5,
              color: const Color(0xFFECECEC),
            ),
            const Text(
              'Expleore More',
              style: TextStyle(
                color: Color(0xFFECECEC),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              width: 60,
              height: 0.5,
              color: const Color(0xFFECECEC),
            ),
          ],
        ),
      ));
      result.add(HTWaterfallFlowWidget());
    }

    return result;
  }

  ///上面的搜索框
  Widget HTTopSearchWidget() {
    return SafeArea(
      // top: false,
      bottom: false,
      child: SizedBox(
        height: 56,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(width: 10.0),
          CachedNetworkImage(imageUrl: ImageURL.url_281, width: 24, height: 24),
          Container(width: 6.0),
          Expanded(
              child: Container(
            height: 36.0,
            decoration: BoxDecoration(
                color: const Color(0xff36373C),
                borderRadius: BorderRadius.circular(10.0)),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(width: 20.0),
              Expanded(
                  child: TextField(
                      controller: TextEditingController(),
                      enableInteractiveSelection: false,
                      readOnly: true,
                      decoration: const InputDecoration(
                          hintText: "Search for Movies,TV",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: Color(0xffAEAFB1), fontSize: 15.0)),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HTClassSearchMidPage(title: "");
                        }));
                      })),
              CachedNetworkImage(
                  imageUrl: ImageURL.url_283, width: 16, height: 16),
              Container(width: 10.0),
            ]),
          )),
          Container(width: 6.0),
          CachedNetworkImage(imageUrl: ImageURL.url_282, width: 24, height: 24),
          Container(width: 10.0),
        ]),
      ),
    );
  }

  ///seeAll More 按钮
  Widget seeAllAndMoreButtoonWidget(DataList data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(children: [
        Flexible(
            flex: 1,
            child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 5.0),
                height: 35.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: const Color(0xff23252A)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("More",
                      style:
                          TextStyle(color: Color(0xffBCBDBE), fontSize: 15.0)),
                  Container(width: 5.0),
                  CachedNetworkImage(
                      imageUrl: ImageURL.url_286, width: 18, height: 18),
                ]))),
        Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SecondLevelPage(
                    titleStr: data.name ?? '',
                    listId: data.open_mode_value.toString(),
                  );
                }));
              },
              child: Container(
                  margin: const EdgeInsets.only(left: 0.0, right: 10.0),
                  height: 35.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xff23252A)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("See All",
                            style: TextStyle(
                                color: Color(0xffBCBDBE), fontSize: 15.0)),
                        Container(width: 5.0),
                        CachedNetworkImage(
                            imageUrl: ImageURL.url_289, width: 18, height: 18),
                      ])),
            )),
      ]),
    );
  }

  ///样式上面标题那一行
  Widget HTHeaderWidget(DataList data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SecondLevelPage(
            titleStr: data.name ?? '',
            listId: data.display_type.toString(),
          );
        }));
      },
      child: Container(
        color: Colors.transparent,
        child: Row(children: [
          Container(width: 10.0),
          Text(
            data.name ?? '',
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            width: 10,
          ),
          Visibility(
              visible: data.data_type == '4'?true:false,
              child: GestureDetector(
                onTap:(){
                  print('点击了 18 +');
                },
                child: const Text(
                  'Hidden',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )),
          const Spacer(),
          CachedNetworkImage(imageUrl: ImageURL.url_289, width: 24, height: 24),
          Container(width: 10.0)
        ]),
      ),
    );
  }
/**
 * 首页UI有3种类型，轮播图、横滑、九宫格
 * "display_type": 1、竖滑(九宫格)；2、横滑；3、轮播图
 */

  ///样式一 轮播图 display_type = 3
  Widget HTBannerWidget(DataList data) {
    var imageSliders = <Widget>[];
    for (var element in data.itemData ?? <ItemData>[]) {
      imageSliders.add(Container(
        margin: const EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: element.img ?? '',
                  fit: BoxFit.fill,
                  width: 1000.0,
                  height: double.infinity,
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      'No. ${data.itemData?.indexOf(element)} image',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ));
    }

    return Container(
        height: 254.0,
        margin: const EdgeInsets.only(top: 12.0, bottom: 21.0),
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          items: imageSliders,
        ));
  }

  ///样式二 横滑 display_type = 2
  Widget HTSideslipWiget(DataList data) {
    ///电影
    if (data.info_type_2 == 'mtype') {
      return Column(
        children: [
          HTHeaderWidget(data),
          Container(
              height: 193.0,
              margin: const EdgeInsets.only(top: 11.0, bottom: 21.0),
              padding: const EdgeInsets.fromLTRB(0.0, 0, 5, 0),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: ((data.itemData?[0].m20 ?? <M20>[]))
                      .map((item) => GestureDetector(
                          child: Container(
                              width: 112.0,
                              margin: const EdgeInsets.only(right: 5.0),
                              child: Stack(children: [
                                CachedNetworkImage(
                                    imageUrl: (item.cover ?? ''),
                                    height: 160.0,
                                    fit: BoxFit.cover),
                                Positioned(
                                  left: 5.0,
                                  top: 5.0,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        item.rate ?? '',
                                        style: const TextStyle(
                                            color: Color(0xffFF6D1C),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),

                                ///右上角的 CAD
                                Visibility(
                                  visible: item.quality == 'CAD' ? true : false,
                                  child: Positioned(
                                      top: 5.0,
                                      right: 5.0,
                                      child: CachedNetworkImage(
                                          imageUrl: ImageURL.url_243,
                                          width: 34,
                                          height: 16.0)),
                                ),
                                Positioned(
                                    top: 165.0,
                                    left: 5.0,
                                    right: 5.0,
                                    child: Text((item.title ?? ''),
                                        maxLines: 2,
                                        style: const TextStyle(
                                            color: Color(0xff828386),
                                            fontSize: 12.0)))
                              ])),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const HTClassPresentDetailPage(title: "");
                            }));
                          }))
                      .toList())),
        ],
      );
    } else {
      ///电视剧
      return Column(
        children: [
          HTHeaderWidget(data),
          Container(
              height: 193.0,
              margin: const EdgeInsets.only(top: 11.0, bottom: 21.0),
              padding: const EdgeInsets.fromLTRB(0.0, 0, 5, 0),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: ((data.itemData?[0].tt20 ?? <TT20>[]))
                      .map((item) => GestureDetector(
                          child: Container(
                              width: 112.0,
                              margin: const EdgeInsets.only(right: 5.0),
                              child: Stack(children: [
                                CachedNetworkImage(
                                    imageUrl: (item.cover ?? ''),
                                    height: 160.0,
                                    fit: BoxFit.cover),
                                Positioned(
                                  left: 5.0,
                                  top: 5.0,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        item.rate ?? '',
                                        style: const TextStyle(
                                            color: Color(0xffFF6D1C),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),

                                ///右下角的电视剧
                                Visibility(
                                  visible:
                                      item.new_flag == 'NEW' ? true : false,
                                  child: Positioned(
                                      bottom: 33.0,
                                      width: 112.0,
                                      child: Container(
                                          height: 24.0,
                                          decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                Colors.transparent,
                                                Colors.black
                                              ])),
                                          child: Row(children: [
                                            const Spacer(),
                                            Text(item.new_flag ?? '',
                                                style: const TextStyle(
                                                    color: Color(0xffFF6D1C),
                                                    fontSize: 8.0)),
                                            Text("|${item.ss_eps}",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 8.0))
                                          ]))),
                                ),
                                Positioned(
                                    top: 165.0,
                                    left: 5.0,
                                    right: 5.0,
                                    child: Text((item.title ?? ''),
                                        maxLines: 2,
                                        style: const TextStyle(
                                            color: Color(0xff828386),
                                            fontSize: 12.0)))
                              ])),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const HTClassPresentDetailPage(title: "");
                            }));
                          }))
                      .toList())),
        ],
      );
    }
  }

  // ignore: non_constant_identifier_names
  ///样式三 九宫格 display_type = 1
  Widget HTGridStyleWidget(DataList data) {
    if (data.info_type_2 == 'mtype') {
      ///电影
      return Column(
        children: [
          HTHeaderWidget(data),
          GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 112 / 160,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 9.5,
              children: (data.itemData?[0].m20 ?? <M20>[])
                  .map((m20) => GestureDetector(
                      child: Column(
                        children: [
                          Container(
                            child: Stack(children: [
                              Container(
                                child: CachedNetworkImage(
                                  width: double.infinity,
                                  height: 160,
                                  imageUrl: m20.cover ?? '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                  left: 5.0,
                                  top: 5.0,
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(m20.rate ?? '',
                                            style: const TextStyle(
                                                color: Color(0xffFF6D1C),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600)),
                                      ])),

                              ///右上角
                              Visibility(
                                visible: m20.quality == 'CAD' ? true : false,
                                child: Positioned(
                                  top: 5.0,
                                  right: 5.0,
                                  child: CachedNetworkImage(
                                    imageUrl: ImageURL.url_243,
                                    width: 34,
                                    height: 16.0,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          Container(
                            height: 35,
                            width: double.infinity,
                            padding: const EdgeInsets.all(2),
                            child: Center(
                              child: Text(
                                m20.title ?? '',
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Color(0xff828386),
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HTClassDramaDetailPage(title: "");
                        }));
                      }))
                  .toList()),
        ],
      );
    } else {
      ///电视剧
      return Column(
        children: [
          HTHeaderWidget(data),
          GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 112 / 160,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 9.5,
              children: (data.itemData?[0].tt20 ?? <TT20>[])
                  .map((tt20) => GestureDetector(
                      child: Column(
                        children: [
                          Container(
                            child: Stack(children: [
                              Container(
                                child: CachedNetworkImage(
                                  width: double.infinity,
                                  height: 160,
                                  imageUrl: (tt20.cover ?? ''),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                  left: 5.0,
                                  top: 5.0,
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(tt20.rate ?? '',
                                            style: const TextStyle(
                                                color: Color(0xffFF6D1C),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600)),
                                      ])),

                              ///右下角
                              Visibility(
                                visible: tt20.new_flag == "NEW" ? true : false,
                                child: Positioned(
                                    bottom: 0.0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                        padding: const EdgeInsets.only(
                                            right: 5, left: 5),
                                        height: 24.0,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              Colors.black
                                            ],
                                          ),
                                        ),
                                        child: Row(children: [
                                          Spacer(),
                                          Text(tt20.new_flag ?? 'NEW',
                                              style: const TextStyle(
                                                  color: Color(0xffFF6D1C),
                                                  fontSize: 8.0)),
                                          Text("| ${tt20.ss_eps}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8.0))
                                        ]))),
                              ),
                            ]),
                          ),
                          Container(
                            height: 35,
                            width: double.infinity,
                            padding: EdgeInsets.all(2),
                            child: Center(
                              child: Text(
                                tt20.title ?? '',
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Color(0xff828386),
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HTClassDramaDetailPage(title: "");
                        }));
                      }))
                  .toList()),
        ],
      );
    }
  }

  ///瀑布流
  Widget HTWaterfallFlowWidget() {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: MasonryGridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        itemCount: homeProvider.droppingWaterDataList.length,
        itemBuilder: (context, index) {
          var itemData = homeProvider.droppingWaterDataList[index];
          return // index == 3
              //     ? Container(
              //         alignment: Alignment.center,
              //         color: Colors.blue,
              //         height: 200,
              //         child: const Text("广告"),
              //       )
              //     :

              Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff23252A),
                      borderRadius: BorderRadius.circular(5.0)),
                  width: double.infinity,
                  height: 246.0 + 48,
                  child: Stack(children: [
                    CachedNetworkImage(
                      imageUrl: itemData.cover ?? '',
                      height: 246.0,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                        left: 5.0,
                        top: 5.0,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(itemData.rate ?? '',
                                  style: const TextStyle(
                                      color: Color(0xffFF6D1C),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                            ])),

                    ///右上角
                    Visibility(
                      visible: (itemData.m_type_2 == 'myfx' &&
                              itemData.quality == 'CAD')
                          ? true
                          : false,
                      child: Positioned(
                        top: 5.0,
                        right: 5.0,
                        child: CachedNetworkImage(
                          imageUrl: ImageURL.url_243,
                          width: 34,
                          height: 16,
                        ),
                      ),
                    ),

                    ///右下角
                    Visibility(
                      visible: (itemData.m_type_2 == 'tt_mflx' &&
                              itemData.new_flag == 'NEW')
                          ? true
                          : false,
                      child: Positioned(
                          bottom: 45.0,
                          left: 0,
                          right: 0,
                          child: Container(
                              height: 24.0,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black],
                                ),
                              ),
                              child: Row(children: [
                                Spacer(),
                                Text(itemData.new_flag ?? '',
                                    style: const TextStyle(
                                        color: Color(0xffFF6D1C),
                                        fontSize: 8.0)),
                                Text("|${itemData.ss_eps}",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 8.0))
                              ]))),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 48,
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            itemData.title ?? '',
                            maxLines: 2,
                            style: const TextStyle(
                              color: Color(0xff828386),
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ]));
        },
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 11.0,
      ),
    );
  }

  ///广告
  Widget adWidget() {
    return Column(
      children: [
        Container(
            height: 60.0,
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
            padding: const EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: CachedNetworkImageProvider(ImageURL.url_280),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(6.0)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("special offer for you",
                      style: TextStyle(
                          color: Color(0xff222222),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600)),
                  Container(height: 4.0),
                  Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    const Text("\$",
                        style: TextStyle(
                            color: Color(0xff222222),
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600)),
                    const Text("2.99",
                        style: TextStyle(
                            color: Color(0xff222222),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600)),
                    Container(width: 3.0),
                    const Text("for the 1 Month",
                        style: TextStyle(
                            color: Color(0xff222222), fontSize: 10.0)),
                  ])
                ])),
        Offstage(
            offstage: false,
            child: Container(
                margin: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                height: 250.0,
                decoration: BoxDecoration(
                    color: const Color(0xff23252A),
                    borderRadius: BorderRadius.circular(6.0)),
                child: Stack(children: [
                  Positioned(
                      right: 15,
                      top: 15,
                      child: CachedNetworkImage(
                          imageUrl: ImageURL.url_79, width: 24.0, height: 24.0))
                ]))),
        Offstage(
            offstage: false,
            child: Container(
                margin: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                height: 250.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xff23252A),
                    borderRadius: BorderRadius.circular(6.0)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 52.0),
                        height: 48.0,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(ImageURL.url_280),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: const Text("Get Premium to remove ads",
                            style: TextStyle(
                                color: Color(0xff222222), fontSize: 15.0)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.fromLTRB(52.0, 30.0, 52.0, 0),
                        height: 48.0,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(ImageURL.url_285),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                          // color: const Color(0xff3A3B40),
                          // borderRadius: BorderRadius.circular(6.0)
                        ),
                        child: const Text("Cancel",
                            style: TextStyle(
                                color: Color(0xffffffff), fontSize: 15.0)),
                      )
                    ]))),
        Container(height: 21.0),
      ],
    );
  }
}
