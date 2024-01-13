import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/providers/ht_searchresult_provider/ht_searchresult_provider.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:ht_new_movpresenter/utils/tools/ht_sys_tool.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../ht_video_paly/views/play_detailpage.dart';

// ignore: must_be_immutable
class HTClassSearchResultPage extends StatefulWidget {
  String? keyWord;
  HTClassSearchResultPage({
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
  var _htVarSearchValue = "";
  bool isShowSearchResultList = true;

  @override
  void initState() {
    provider.loadSearchResulrData(widget.keyWord);
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
            create: (context) => provider,
          )
        ],
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.black,
            body: Column(
              children: [
                searchWidget(),
                !isShowSearchResultList ? googleListWidget() : listWidget(),
              ],
            ),
          ),
        ));
  }

  ///1.顶部搜索
  Widget searchWidget() {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 56.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(width: 11.3),

                    ///搜索图标
                    CachedNetworkImage(
                        imageUrl: ImageURL.url_283, width: 24, height: 24),
                    Container(width: 8),
                    Expanded(
                      child: TextField(
                        onEditingComplete: (() {
                          loadListData(_htVarSearchValue);
                        }),
                        controller: provider.htVarFieldController,
                        autofocus: false,
                        focusNode: _htVarFieldFocusNode,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 12),
                          hintText: widget.keyWord,
                          border: InputBorder.none,
                          hintStyle: const TextStyle(
                            color: Color(0xffAEAFB1),
                            fontSize: 15.0,
                          ),
                        ),
                        onChanged: (val) {
                          if (provider.htVarFieldController.value
                              .toString()
                              .isNotEmpty) {
                            setState(() {
                              isShowSearchResultList = false;
                              _htVarSearchValue =
                                  provider.htVarFieldController.value.text;
                            });
                          }
                          provider.onChanged(val);
                        },
                        onSubmitted: provider.onSubmitted,
                      ),
                    ),

                    ///删除图标
                    Visibility(
                      visible:
                          provider.htVarFieldController.value.text.isNotEmpty
                              ? true
                              : false,
                      child: GestureDetector(
                        onTap: () {
                          provider.deleteInput(context, _htVarFieldFocusNode);
                          setState(() {
                            _htVarSearchValue =
                                provider.htVarFieldController.value.text;
                          });
                        },
                        child: CachedNetworkImage(
                          imageUrl: ImageURL.url_79,
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ),
                    Container(width: 10.0),
                  ],
                ),
              ),
            ),
            Container(width: 10.0),
          ],
        ),
      ),
    );
  }

  ///谷歌联想词列表
  Widget googleListWidget() {
    return Selector<HTSearchResultProvider, List?>(
      selector: (p0, p1) => p1.searchResult,
      builder: (context, value, child) {
        if (value == null || (value.isEmpty)) {
          return Container();
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 20.0),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Search \"$_htVarSearchValue\"",
                  style:
                      const TextStyle(color: Color(0xff29D3EA), fontSize: 14.0),
                ),
              ),
              Container(height: 20.0),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                itemCount: provider.searchResult != null
                    ? (provider.searchResult?[1]?.length ?? 0)
                    : 0,
                itemBuilder: (BuildContext context, int index) {
                  List itemData = provider.searchResult?[1][index];
                  //子Widget
                  return GestureDetector(
                    child: Container(
                      height: 45,
                      color: Colors.transparent,
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
                          ),
                          const SizedBox(),
                        ],
                      ),
                    ),
                    onTap: () {
                      loadListData(itemData[0] ?? '');
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return HTClassSearchResultPage(
                      //       keyWord: itemData[0] ?? "");
                      // }));
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

  void loadListData(String word) {
    setState(() {
      FocusScope.of(context).requestFocus(FocusNode());
      isShowSearchResultList = true;
      provider.htVarFieldController.text = '';
      widget.keyWord = word;
      provider.keyword = word;
      provider.onRefresh();
      // provider.loadSearchResulrData(widget.keyWord);
    });
  }

  ///2.列表
  Widget listWidget() {
    double width = (SysTools.getScreenSize(context).width - 39) / 3;
    double height = width * 160 / 112;
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
                childAspectRatio: 112 / 193,
                mainAxisSpacing: 10,
                crossAxisSpacing: 9.5,
              ),
              itemBuilder: (context, index) {
                var model = dataList?[index];
                // 使用split方法将字符串分割成两部分
                List<String> parts = model!.getRate().split('.');
                // 获取小数点前的子字符串
                String beforeDecimal = parts.isNotEmpty ? parts[0] : '';
                // 获取小数点后的子字符串
                String afterDecimal = parts.length > 1 ? parts[1] : '';
                return GestureDetector(
                  onTap: () {
                    // if (model?.dataType != '1' || model?.dataType != '3') {
                    //   return;
                    // }
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HTClassVideoDetailPage(
                            m_type_2:
                                (model.dataType == '1') ? "myfx" : "tt_mflx",
                            id: model.id ?? "",
                          );
                        },
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      ///1.背景图
                      Stack(
                        children: [
                          SizedBox(
                            width: width,
                            height: height,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: CachedNetworkImage(
                                imageUrl: model.cover ?? '',
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
                                  '$beforeDecimal.',
                                  style: const TextStyle(
                                      color: Color(0xffFF6D1C),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  afterDecimal,
                                  style: const TextStyle(
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
                      ),

                      ///2.标题
                      Expanded(
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center, // 将子部件在垂直方向上居中
                          children: [
                            Text(
                              model.title ?? '',
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF828386),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Text(
                      //   model.title ?? '',
                      //   maxLines: 2,
                      //   style: const TextStyle(
                      //     color: Color(0xff828386),
                      //     fontSize: 12.0,
                      //   ),
                      // ),
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
