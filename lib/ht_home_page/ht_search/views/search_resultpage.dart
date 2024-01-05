import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/providers/ht_searchresult_provider/ht_searchresult_provider.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../ht_video_paly/views/play_detailpage.dart';

class HTClassSearchResultPage extends StatefulWidget {
  final String? keyWord;
  const HTClassSearchResultPage({
    this.keyWord,
    Key? key,
  }) : super(key: key);

  @override
  State<HTClassSearchResultPage> createState() =>
      _HTClassSearchResultPageState();
}

class _HTClassSearchResultPageState extends State<HTClassSearchResultPage> {
  HTSearchResultProvider provider = HTSearchResultProvider();
  final _htVarFieldFocusNode = FocusNode();
  @override
  void initState() {
    provider.loadSearchResulrData(widget.keyWord);
    _htVarFieldFocusNode.addListener(() {
      if (_htVarFieldFocusNode.hasFocus) {
        Navigator.of(context).pop();
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return const HTClassSearchMidPage(title: "");
        // }));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => provider,
          )
        ],
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              searchWidget(),
              listWidget(),
            ],
          ),
        ));
  }

  ///1.顶部搜索
  Widget searchWidget() {
    return SafeArea(
      bottom: false,
      child: SizedBox(
          height: 56.0,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(width: 10.0),
            GestureDetector(
                child: CachedNetworkImage(
                    imageUrl: ImageURL.url_291, width: 24, height: 24),

                ///返回按钮
                onTap: () {
                  Navigator.of(context).pop();
                }),
            Container(width: 6.0),
            Expanded(
                child: Container(
              height: 36.0,
              decoration: BoxDecoration(
                  color: const Color(0xff36373C),
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
                        controller: TextEditingController(),
                        focusNode: _htVarFieldFocusNode,
                        decoration: InputDecoration(
                            hintText: widget.keyWord,
                            border: InputBorder.none,
                            hintStyle: const TextStyle(
                                color: Color(0xffAEAFB1), fontSize: 15.0)))),

                CachedNetworkImage(
                    imageUrl: ImageURL.url_79, width: 16, height: 16),
                Container(width: 10.0),
              ]),
            )),
            Container(width: 10.0),
          ])),
    );
  }

  ///2.列表
  Widget listWidget() {
    return Selector<HTSearchResultProvider, bool>(
      selector: (p0, p1) => p1.loading,
      builder: (context, value, child) {
        var dataList = provider.resultData?.data?.mttList;
        return Expanded(
          child: SmartRefresher(
            controller: provider.refreshController,
            enablePullUp: true,
            onLoading: provider.onLoading,
            onRefresh: provider.onRefresh,
            child: GridView.builder(
              itemCount: dataList?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 112 / 160,
                mainAxisSpacing: 10,
                crossAxisSpacing: 9.5,
              ),
              itemBuilder: (context, index) {
                var model = dataList?[index];
                return GestureDetector(
                  onTap: () {
                    // if (model?.dataType != '1' || model?.dataType != '3') {
                    //   return;
                    // }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HTClassVideoDetailPage(
                            m_type_2:
                                (model?.dataType == '1') ? "myfx" : "tt_mflx",
                            id: model?.id ?? "",
                          );
                        },
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      ///1.背景图
                      Expanded(
                          child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: CachedNetworkImage(
                                imageUrl: model?.cover ?? '',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 5.0,
                            top: 5.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  // 查找点的位置
                                  (model!.getRate().substring(
                                      0, model.getRate().indexOf('.') + 1)).isEmpty?'0.':model.getRate().substring(
                                      0, model.getRate().indexOf('.') + 1),
                                  style: const TextStyle(
                                      color: Color(0xffFF6D1C),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Text(
                                  '0',
                                  style: TextStyle(
                                      color: Color(0xffFF6D1C),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: model.newFlag == "NEW" ? true : false,
                            child: SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(),
                                  Container(
                                    height: 24.0,
                                    // padding: const EdgeInsets.symmetric(horizontal: 9.5 *2),
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                          Colors.transparent,
                                          Colors.black
                                        ])),
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        Text(model.newFlag ?? 'NEW',
                                            style: const TextStyle(
                                                color: Color(0xffFF6D1C),
                                                fontSize: 8.0)),
                                        Text("| ${model.ssEps}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 8.0))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),

                      ///2.标题
                      Text(
                        model.title ?? '',
                        maxLines: 2,
                        style: const TextStyle(
                          color: Color(0xff828386),
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
