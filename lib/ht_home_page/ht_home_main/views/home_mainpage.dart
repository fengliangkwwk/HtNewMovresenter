import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/bean/home_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/providers/ht_home_provider.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/views/search_middlepage.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/views/play_detailpage.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/views/play_detailpage_drama.dart';
import 'package:ht_new_movpresenter/utils/url_getImageurl.dart';
import 'package:provider/provider.dart';

class HTClassHomeMainPage extends StatefulWidget {
  const HTClassHomeMainPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HTClassHomeMainPage> createState() => _HTClassHomeMainPageState();
}

class _HTClassHomeMainPageState extends State<HTClassHomeMainPage> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  final HTHomeProvider homeProvider = HTHomeProvider();

  ///初始化provider
  var homeData;

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
        child: Consumer<HTHomeProvider>(
          builder: (context, value, child) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // Container(height: MediaQuery.of(context).padding.top),
                  HTTopSearchWidget(),
                  ...mainListWidget()

                  ///1.
                  // HTBannerWidget(),

                  // ///2.
                  // HTSideslipWiget(),

                  // ///3.
                  // HTGridStyleWidget(),

                  // ///4.
                  // adWidget(),

                  // ///5.
                  // HTWaterfallFlowWidget(),
                ],
              )),
            );
          },
        ));
  }

  List<Widget> mainListWidget() {
    var result = <Widget>[];

    bool ishasAd = false;

    for (var element in homeProvider.homeData?.dataList ?? <DataList>[]) {
      if (element.displayType == '3') {
        ///轮播图
        result.add(HTBannerWidget(element));
      }

      ///横向
      if (element.displayType == '2') {
        result.add(HTSideslipWiget(element));
        if (ishasAd == false) {
          result.add(adWidget());
          ishasAd = true;
        }
      }

      ///九宫格
      if (element.displayType == '3') {
        result.add(HTGridStyleWidget(element));
        if (ishasAd == false) {
          result.add(adWidget());
          ishasAd = true;
        }
      }
    }

    return result;
  }

  ///上面的搜索框
  Widget HTTopSearchWidget() {
    // homeData = context.read<HTHomeProvider>().homeData;
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
  Widget seeAllAndMoreButtoonWidget() {
    return Container(
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
            child: Container(
                margin: const EdgeInsets.only(left: 0.0, right: 10.0),
                height: 35.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: const Color(0xff23252A)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("See All",
                      style:
                          TextStyle(color: Color(0xffBCBDBE), fontSize: 15.0)),
                  Container(width: 5.0),
                  CachedNetworkImage(
                      imageUrl: ImageURL.url_289, width: 18, height: 18),
                ]))),
      ]),
    );
  }

  ///样式上面标题那一行
  Widget HTHeaderWidget() {
    return SizedBox(
      child: Row(children: [
        Container(width: 10.0),
        const Text("You May Also Like",
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w600)),
        const Spacer(),
        CachedNetworkImage(imageUrl: ImageURL.url_289, width: 24, height: 24),
        Container(width: 10.0)
      ]),
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
    return Column(
      children: [
        HTHeaderWidget(),
        Container(
            height: 226.0,
            margin: const EdgeInsets.only(top: 11.0, bottom: 21.0),
            padding: const EdgeInsets.fromLTRB(0.0, 0, 5, 0),
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: [1, 2, 3, 4, 5, 6]
                    .map((index) => GestureDetector(
                        child: Container(
                            width: 112.0,
                            margin: const EdgeInsets.only(right: 5.0),
                            child: Stack(children: [
                              CachedNetworkImage(
                                  imageUrl: imgList[0],
                                  height: 180.0,
                                  fit: BoxFit.fill),
                              const Positioned(
                                  left: 5.0,
                                  top: 5.0,
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text("8.",
                                            style: TextStyle(
                                                color: Color(0xffFF6D1C),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600)),
                                        Text("0",
                                            style: TextStyle(
                                                color: Color(0xffFF6D1C),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600))
                                      ])),
                              Positioned(
                                  top: 5.0,
                                  right: 5.0,
                                  child: CachedNetworkImage(
                                      imageUrl: ImageURL.url_243,
                                      width: 34,
                                      height: 16.0)),
                              Positioned(
                                  bottom: 46.0,
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
                                      child: const Row(children: [
                                        Spacer(),
                                        Text("NEW",
                                            style: TextStyle(
                                                color: Color(0xffFF6D1C),
                                                fontSize: 8.0)),
                                        Text("|S07 E08",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8.0))
                                      ]))),
                              const Positioned(
                                  top: 185.0,
                                  left: 5.0,
                                  right: 5.0,
                                  child: Text("Minions:The Rise of Gru",
                                      maxLines: 2,
                                      style: TextStyle(
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

  ///样式三 九宫格 display_type = 1
  Widget HTGridStyleWidget(DataList data) {
    return Column(
      children: [
        Row(children: [
          Container(width: 10.0),
          const Text("Trending",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600)),
          const Spacer(),
          Image.network(ImageURL.url_289, width: 24, height: 24),
          Container(width: 10.0)
        ]),
        GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 0.575,
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 9.5,
            children: (data.itemData ?? <ItemData>[])
                .map((itemData) => GestureDetector(
                    child: Container(
                        width: 112.0,
                        margin: const EdgeInsets.only(right: 5.0),
                        child: Stack(children: [
                          CachedNetworkImage(
                            imageUrl: itemData.newImg ?? '',
                            height: 180.0,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                              left: 5.0,
                              top: 5.0,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(itemData.newConfRate ?? '',
                                        style: const TextStyle(
                                            color: Color(0xffFF6D1C),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                    // Text("0",
                                    //     style: TextStyle(
                                    //         color: Color(0xffFF6D1C),
                                    //         fontSize: 12,
                                    //         fontWeight: FontWeight.w600))
                                  ])),
                          Positioned(
                              top: 185.0,
                              left: 5.0,
                              right: 5.0,
                              child: Text(itemData.newConfName ?? '',
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: Color(0xff828386),
                                      fontSize: 12.0)))
                        ])),
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

  ///瀑布流
  Widget HTWaterfallFlowWidget() {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) => index % 4 == 3
          ? Container(
              alignment: Alignment.center,
              color: Colors.blue,
              height: 200,
              child: const Text("广告"),
            )
          : Container(
              decoration: BoxDecoration(
                  color: const Color(0xff23252A),
                  borderRadius: BorderRadius.circular(5.0)),
              width: double.infinity,
              height: 226.0,
              child: Stack(children: [
                CachedNetworkImage(
                    imageUrl: imgList[3], height: 180.0, fit: BoxFit.fill),
                const Positioned(
                    left: 5.0,
                    top: 5.0,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("8.",
                              style: TextStyle(
                                  color: Color(0xffFF6D1C),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                          Text("0",
                              style: TextStyle(
                                  color: Color(0xffFF6D1C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600))
                        ])),
                Positioned(
                    bottom: 45.0,
                    left: 0,
                    right: 0,
                    child: Container(
                        height: 24.0,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.black])),
                        child: const Row(children: [
                          Spacer(),
                          Text("NEW",
                              style: TextStyle(
                                  color: Color(0xffFF6D1C), fontSize: 8.0)),
                          Text("|S07 E08",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 8.0))
                        ]))),
                const Positioned(
                    top: 188.0,
                    left: 10.0,
                    right: 10.0,
                    child: Text("Minions:The Rise of Gru What are you Doing",
                        maxLines: 2,
                        style: TextStyle(
                            color: Color(0xff828386), fontSize: 12.0)))
              ])),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 11.0,
    );
  }

  Widget adWidget() {
    return Column(
      children: [
        Row(children: [
          Flexible(
              flex: 1,
              child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 5.0),
                  height: 35.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xff23252A)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("More",
                            style: TextStyle(
                                color: Color(0xffBCBDBE), fontSize: 15.0)),
                        Container(width: 5.0),
                        CachedNetworkImage(
                            imageUrl: ImageURL.url_286, width: 18, height: 18),
                      ]))),
          Flexible(
              flex: 1,
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
                      ]))),
        ]),
        Container(
            height: 60.0,
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
            padding: const EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
                image: DecorationImage(
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
                          image: DecorationImage(
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
                          image: DecorationImage(
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
