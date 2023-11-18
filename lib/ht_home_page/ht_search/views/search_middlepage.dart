/**
 * 搜索中间页
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/beans/ht_mid_search_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/providers/ht_midsearch_provider/ht_midsearch_provider.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/views/search_resultpage.dart';
import 'package:ht_new_movpresenter/utils/ui_utils.dart';
import 'package:ht_new_movpresenter/utils/url_getImageurl.dart';
import 'package:provider/provider.dart';

class HTClassSearchMidPage extends StatefulWidget {
  const HTClassSearchMidPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HTClassSearchMidPage> createState() => _HTClassSearchMidPageState();
}

class _HTClassSearchMidPageState extends State<HTClassSearchMidPage>
    with SingleTickerProviderStateMixin {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  final HTMidSearchProvider midSearchProvider = HTMidSearchProvider();
  var _htVarTabController = null;
  var _htVarFieldFocusNode = FocusNode();
  var _htVarSearchValue = "";
  var _htVarFieldController = TextEditingController();
  @override
  void initState() {
    midSearchProvider.loadData();
    _htVarTabController = TabController(length: 5, vsync: this);
    _htVarFieldFocusNode.addListener(() {
      if (_htVarFieldFocusNode.hasFocus) {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => midSearchProvider,
          )
        ],
        child: Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Container(height: MediaQuery.of(context).padding.top),
                  Container(
                      height: 56.0,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(width: 10.0),
                            GestureDetector(
                                child: CachedNetworkImage(
                                    imageUrl: ImageURL.url_291,
                                    width: 24,
                                    height: 24),

                                ///返回按钮
                                onTap: () {
                                  Navigator.pop(context);
                                }),
                            Container(width: 6.0),
                            Expanded(
                                child: Container(
                              height: 36.0,
                              decoration: BoxDecoration(
                                  color: Color(0xff36373C),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(width: 11.3),
                                    CachedNetworkImage(
                                        imageUrl: ImageURL.url_283,
                                        width: 24,
                                        height: 24),

                                    ///搜索图标
                                    Container(width: 8),
                                    Expanded(
                                        child: TextField(
                                            controller: _htVarFieldController,
                                            autofocus: true,
                                            focusNode: _htVarFieldFocusNode,
                                            decoration: const InputDecoration(
                                                hintText:
                                                    "Search for Movies,TV",
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                    color: Color(0xffAEAFB1),
                                                    fontSize: 15.0)),
                                            onChanged: (val) {
                                              if (_htVarFieldController.value
                                                  .toString()
                                                  .isNotEmpty) {
                                                setState(() {
                                                  _htVarSearchValue =
                                                      _htVarFieldController
                                                          .value.text;
                                                });
                                              }
                                            })),
                                    CachedNetworkImage(
                                        imageUrl: ImageURL.url_79,
                                        width: 16,
                                        height: 16),
                                    Container(width: 10.0),
                                  ]),
                            )),
                            Container(width: 10.0),
                          ])),
                  Offstage(
                      offstage: _htVarSearchValue.length > 0,
                      child: Column(children: [
                        Container(height: 20.0),
                        Offstage(
                            offstage: false,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    Container(width: 10.0),
                                    const Text("History",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)),
                                    Spacer(),
                                    CachedNetworkImage(
                                        imageUrl: ImageURL.url_301,
                                        width: 24,
                                        height: 24), //删除图标
                                    Container(width: 10.0)
                                  ]),
                                  Container(height: 20.0),
                                  Container(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        spacing: 10,
                                        runSpacing: 10,
                                        textDirection: TextDirection.ltr,
                                        children: [1, 2, 3, 4, 5, 6]
                                            .map((index) => Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15.0,
                                                        vertical: 5.0),
                                                child: Text(index.toString(),
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xffBCBDBE),
                                                        fontSize: 14.0)),
                                                decoration: BoxDecoration(
                                                    color: Color(0xff23252A),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0))))
                                            .toList(),
                                      ))
                                ])),
                        Container(height: 20.0),
                        Row(children: [
                          Container(width: 10.0),
                          const Text("Top Search",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ]),
                        Container(height: 10.0),
                        Container(
                            height: 36.0,
                            child: TabBar(
                                controller: _htVarTabController,
                                isScrollable: true,
                                indicatorSize: TabBarIndicatorSize.label,
                                indicatorColor: Color(0xff3CDEF4),
                                tabs: const <Widget>[
                                  Tab(text: 'All'),
                                  Tab(text: 'Movie'),
                                  Tab(text: 'TV Shows'),
                                  Tab(text: 'Animated Series'),
                                  Tab(text: 'Focus')
                                ])),
                        // Container(height: 10.0,),
                        Container(
                          height: 0.25,
                          color: Colors.grey,
                        ),
                        Container(
                          height: 20.0,
                        ),
                        ///2.刷新数据
                        Consumer<HTMidSearchProvider>(
                          builder: (context, value, child) {
                            return GridView.count(
                                crossAxisCount: 3,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                childAspectRatio: 0.575,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 0.0),
                                mainAxisSpacing: 10.0,
                                crossAxisSpacing: 9.5,
                                children: [...itemWidget()]);
                          },
                        )
                      ])),
                  Offstage(
                      offstage: _htVarSearchValue.length == 0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(height: 20.0),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text("Search \"${_htVarSearchValue}\"",
                                    style: const TextStyle(
                                        color: Color(0xff29D3EA),
                                        fontSize: 14.0))),
                            Container(height: 20.0),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                              itemCount: 8,
                              itemBuilder: (BuildContext context, int index) {
                                //子Widget
                                return GestureDetector(
                                  child: Container(
                                      height: 45,
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CachedNetworkImage(
                                                imageUrl: ImageURL.url_300,
                                                width: 16,
                                                height: 16),
                                            Container(width: 10.0),
                                            const Text("the closest one",
                                                style: TextStyle(
                                                    color: Color(0xffECECEC),
                                                    fontSize: 14.0))
                                          ])),
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const HTClassSearchResultPage(
                                          title: "");
                                    }));
                                  },
                                );
                              },
                              //设置分割线，颜色为黑色，高度为1
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                ///可以直接使用
                                // midSearchProvider.data;
                                return const Divider(
                                  color: Color(0x70ECECEC),
                                  height: 1,
                                );
                              },
                            )
                          ]))
                ]))));
  }

  List<Widget> itemWidget() {
    var result = <Widget>[];

    for (var i = 0;
        i < (midSearchProvider.midSearchBean?.data ?? <Data>[]).length;
        i++) {
      var itemData = midSearchProvider.midSearchBean?.data?[i];

      result.add(
        Container(
          width: 112.0,
          margin: const EdgeInsets.only(right: 5.0),
          child: Stack(
            children: [
              ///背景图片
              CachedNetworkImage(
                imageUrl: itemData?.cover ?? '',
                height: 180.0,
                fit: BoxFit.fill,
              ),

              const Positioned(
                left: 0.0,
                top: 0.0,
                height: 30,
                width: 30,
                child: Image(
                  fit: BoxFit.cover,
                  height: 30,
                  width: 30,
                  image: CachedNetworkImageProvider(ImageURL.url_296),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  child: KTClassUIUtils.htMethodGetRankingNumbers(i + 1),
                ),
              ),
              Positioned(
                top: 185.0,
                left: 5.0,
                right: 5.0,
                child: Center(
                  child: Text(
                    itemData?.title ?? '',
                    maxLines: 2,
                    style: const TextStyle(
                      color: Color(0xff828386),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return result;
  }
}
