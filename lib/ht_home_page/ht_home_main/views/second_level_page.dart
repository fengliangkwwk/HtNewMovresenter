import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/bean/home_second_level_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/providers/ht_home_second_level_provider.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/views/search_middlepage.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
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

                    ///
                    childAspectRatio: 112 / 160,

                    ///
                    mainAxisSpacing: 10,

                    ///
                    crossAxisSpacing: 9.5,

                    ///
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
    return SizedBox(
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  ///1. 背景图
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: itemData.cover ?? '',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  ///2. 评分
                  Positioned(
                    left: 5,
                    top: 5,
                    child: Text(
                      itemData.getRate(),
                      // itemData.rate ?? '',
                      style: const TextStyle(
                        color: Color(0xFFFF6D1C),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),

          ///3. 标题
          Text(
            itemData.title ?? '',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF828386),
            ),
          ),
        ],
      ),
    );
  }
}
