import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/bean/home_second_level_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/providers/ht_home_second_level_provider.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/views/search_middlepage.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:ht_new_movpresenter/utils/tools/ht_sys_tool.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SecondLevelPage extends StatefulWidget {
  final String titleStr;
  final String listId;
  const SecondLevelPage({
    Key? key,
    required this.titleStr,
    required this.listId,
  }) : super(key: key);
  @override
  State<SecondLevelPage> createState() => _SecondLevelPageState();
}

class _SecondLevelPageState extends State<SecondLevelPage> {
  HTHomeSecondLevelProvidr provider = HTHomeSecondLevelProvidr();

  @override
  void initState() {
    super.initState();
    provider.loadData(
      id: widget.listId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: provider),
      ],
      child: Selector<HTHomeSecondLevelProvidr, bool>(
        selector: (p0, p1) => p1.loading,
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: const Color(0xff36373C),
            body: Column(
              children: [
                hTTopSearchWidget(),
                listWidget(),
              ],
            ),
          );
        },
      ),
    );
  }

  ///上面的搜索框
  Widget hTTopSearchWidget() {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 56,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CachedNetworkImage(
                  imageUrl: ImageURL.url_291,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            Expanded(
                child: Center(
              child: Text(
                widget.titleStr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
            GestureDetector(
              onTap: () {
                //HTClassSearchMidPage
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HTClassSearchMidPage(title: "");
                }));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CachedNetworkImage(
                  imageUrl: ImageURL.url_292,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listWidget() {
    return Selector<HTHomeSecondLevelProvidr, List<HomeSecondLevelBean>>(
      selector: (p0, p1) => p1.dataList,
      builder: (context, value, child) {
        return Expanded(
            child: SafeArea(
          top: false,
          bottom: false,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SmartRefresher(
                controller: provider.refreshController,
                enablePullUp: true,
                onRefresh: provider.onRefresh,
                onLoading: provider.onLoad,
                child: GridView.builder(
                  itemCount: value.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 112 / 193,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 9.5,
                  ),
                  itemBuilder: (context, index) {
                    return itemWidget(value[index]);
                  },
                ),
              ),
            ),
          ),
        ));
      },
    );
  }

  Widget itemWidget(HomeSecondLevelBean itemData) {
    double width = (SysTools.getScreenSize(context).width - 39)/3;
    double height = width * 160/112;
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                ///1. 背景图
                SizedBox(
                  width: width,
                  height:height,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: itemData.cover ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                ///2. 评分
                Positioned(
                  left: 5,
                  top: 5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        SysTools.getBeforeDecimal(itemData.getRate()),
                        style: const TextStyle(
                            color: Color(0xffFF6D1C),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        SysTools.getAfterDecimal(itemData.getRate()),
                        style: const TextStyle(
                            color: Color(0xffFF6D1C),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        //  const SizedBox(height: 5,),
          ///3. 标题
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // 将子部件在垂直方向上居中
              children: [
                Text(
                  itemData.title ?? '',
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
        ],
      ),
    );
  }
}
