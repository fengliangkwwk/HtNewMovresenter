/**
 * 搜索中间页
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/beans/ht_mid_search_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/providers/ht_midsearch_provider/ht_midsearch_provider.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/views/search_resultpage.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/views/play_detailpage.dart';
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
  final HTMidSearchProvider midSearchProvider = HTMidSearchProvider();
  late TabController _htVarTabController;
  final _htVarFieldFocusNode = FocusNode();
  var _htVarSearchValue = "";
  @override
  void initState() {
    midSearchProvider.loadData();
    _htVarTabController = TabController(length: 5, vsync: this);
    _htVarFieldFocusNode.addListener(() {
      if (_htVarFieldFocusNode.hasFocus) {}
    });
    _htVarTabController.addListener(() {
      if (_htVarTabController.indexIsChanging) {
        midSearchProvider.apiRequest(_htVarTabController.index.toString());
      }
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
            body: SafeArea(
              child: Column(
                children: [
                  ///搜索框那一行
                  searchBoxWidget(),

                  ///搜索历史
                  historyWidget(),

                  ///导航栏那一行
                  navigationWidget(),

                  Expanded(
                    child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Offstage(
                                  offstage: _htVarSearchValue.isNotEmpty,
                                  child: Column(children: [
                                    ///2.刷新数据
                                    Consumer<HTMidSearchProvider>(
                                      builder: (context, value, child) {
                                        return GridView.count(
                                            crossAxisCount: 3,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            childAspectRatio: 112 / 160,
                                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                                            mainAxisSpacing: 10.0,
                                            crossAxisSpacing: 9.5,
                                            children: [...itemWidget()]);
                                      },
                                    )
                                  ])),

                              ///搜索联想起页
                              searchResultWidget(),
                            ])),
                  ),
                ],
              ),
            )));
  }

  ///搜索框那一行
  Widget searchBoxWidget() {
    return Container(
        height: 56.0,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(width: 10.0),
          GestureDetector(
              child: CachedNetworkImage(
                  imageUrl: ImageURL.url_291, width: 24, height: 24),

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
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(width: 11.3),
              CachedNetworkImage(
                  imageUrl: ImageURL.url_283, width: 24, height: 24),

              ///搜索图标
              Container(width: 8),
              Expanded(
                child: TextField(
                  onEditingComplete: (() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HTClassSearchResultPage(
                          keyWord: _htVarSearchValue);
                    }));
                  }),
                  controller: midSearchProvider.htVarFieldController,
                  autofocus: true,
                  focusNode: _htVarFieldFocusNode,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Search for Movies,TV",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Color(0xffAEAFB1),
                      fontSize: 15.0,
                    ),
                  ),
                  onChanged: (val) {
                    if (midSearchProvider.htVarFieldController.value
                        .toString()
                        .isNotEmpty) {
                      setState(() {
                        _htVarSearchValue =
                            midSearchProvider.htVarFieldController.value.text;
                      });
                    }
                    midSearchProvider.onChanged(val);
                  },
                  onSubmitted: midSearchProvider.onSubmitted,
                ),
              ),

              ///删除图标
              GestureDetector(
                onTap: () {
                  midSearchProvider.deleteInput(context, _htVarFieldFocusNode);
                },
                child: CachedNetworkImage(
                  imageUrl: ImageURL.url_79,
                  width: 16,
                  height: 16,
                ),
              ),
              Container(width: 10.0),
            ]),
          )),
          Container(width: 10.0),
        ]));
  }

  ///导航栏那一行
  Widget navigationWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
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
          Container(
            height: 0.25,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

////item widget
  List<Widget> itemWidget() {
    var result = <Widget>[];
    // Size screenSize =SysTools().getScreenSize(context) ;
    // Size screenSize = MediaQuery.of(context).size;
    // double w = (screenSize.width - 38) / 3;
    for (var i = 0;
        i < (midSearchProvider.midSearchBean?.data ?? <Data>[]).length;
        i++) {
      var itemData = midSearchProvider.midSearchBean?.data?[i];
      final String imageUrl = itemData?.cover ?? "";
      result.add(
        GestureDetector(
          onTap: (() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HTClassVideoDetailPage(
                    m_type_2: (itemData?.mtype == '1' || itemData?.mtype == '4')
                        ? "myfx"
                        : "tt_mflx",
                    id: itemData?.id ?? "",
                  );
                },
              ),
            );
          }),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0), // 设置圆角
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(imageUrl),
                        ),
                      ),
                      child: const Center(
                        child: Image(
                          fit: BoxFit.cover,
                          height: 31,
                          width: 31,
                          image: CachedNetworkImageProvider(ImageURL.url_268),
                        ),
                      ),
                    ),

                    ///左上角的序号
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        child: KTClassUIUtils.htMethodGetRankingNumbers(i + 1),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Center(
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
              )
            ],
          ),
        ),
      );
    }

    return result;
  }

  ///搜索widget
  Widget historyWidget() {
    ///局部刷新,根据状态值来进行刷新
    return Selector<HTMidSearchProvider, bool>(
      ///p0上线文 p1是provider
      selector: (p0, p1) => p1.searchHistoty,
      builder: (context, value, child) {
        return Visibility(
          visible: midSearchProvider.searchHistoty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Container(width: 10.0),
                const Text(
                  "History",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: midSearchProvider.deleteHistory,
                  child: CachedNetworkImage(
                    imageUrl: ImageURL.url_301,
                    width: 24,
                    height: 24,
                  ),
                ), //删除图标
                Container(width: 10.0)
              ]),
              Container(height: 20.0),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 10,
                  runSpacing: 10,
                  textDirection: TextDirection.ltr,
                  children: midSearchProvider.searchDataList
                      .map(
                        (value) => GestureDetector(
                          onTap: (() {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HTClassSearchResultPage(keyWord: value);
                            }));
                          }),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 5.0),
                            child: Text(
                              value,
                              style: const TextStyle(
                                color: Color(0xffBCBDBE),
                                fontSize: 14.0,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xff23252A),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  ///搜索结果
  Widget searchResultWidget() {
    return Selector<HTMidSearchProvider, List?>(
      selector: (p0, p1) => p1.searchResult,
      builder: (context, value, child) {
        if (value == null || (value.isEmpty)) {
          return Container();
        }

        return Offstage(
          offstage: _htVarSearchValue.isEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 20.0),
              Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text("Search \"$_htVarSearchValue\"",
                      style: const TextStyle(
                          color: Color(0xff29D3EA), fontSize: 14.0))),
              Container(height: 20.0),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                itemCount: midSearchProvider.searchResult != null
                    ? (midSearchProvider.searchResult?[1]?.length ?? 0)
                    : 0,
                itemBuilder: (BuildContext context, int index) {
                  List itemData = midSearchProvider.searchResult?[1][index];
                  //子Widget
                  return GestureDetector(
                    child: Container(
                        height: 45,
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                  imageUrl: ImageURL.url_300,
                                  width: 16,
                                  height: 16),
                              Container(width: 10.0),
                              Text(
                                itemData[0] ?? '',
                                style: const TextStyle(
                                  color: Color(0xffECECEC),
                                  fontSize: 14.0,
                                ),
                              )
                            ])),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HTClassSearchResultPage(
                            keyWord: itemData[0] ?? "");
                      }));
                    },
                  );
                },
                //设置分割线，颜色为黑色，高度为1
                separatorBuilder: (BuildContext context, int index) {
                  ///可以直接使用
                  // midSearchProvider.data;
                  return const Divider(
                    color: Color(0x70ECECEC),
                    height: 1,
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
// Stack(
//                 children: [
//                   ///左上角的序号
//                   Positioned(
//                     left: 0,
//                     top: 0,
//                     child: Container(
//                       child: KTClassUIUtils.htMethodGetRankingNumbers(i + 1),
//                     ),
//                   ),
                    
//                   ///中间的播放按钮
//                   const Center(
//                     child: Image(
//                       fit: BoxFit.cover,
//                       height: 31,
//                       width: 31,
//                       image: CachedNetworkImageProvider(ImageURL.url_268),
//                     ),
//                   ),
                 
//                  /// /标题
//                   Positioned(
//                     bottom: 0,
//                     // top: 185.0,
//                     left: 5.0,
//                     right: 5.0,
//                     child: Center(
//                       child: Text(
//                         itemData?.title ?? '',
//                         maxLines: 2,
//                         style: const TextStyle(
//                           color: Color(0xff828386),
//                           fontSize: 12.0,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         // textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),