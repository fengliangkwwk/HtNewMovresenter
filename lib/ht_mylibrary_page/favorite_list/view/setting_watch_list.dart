
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/views/play_detailpage.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/favorite_list/bean/history_bean.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/favorite_list/provider/watch_provider.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:ht_new_movpresenter/utils/tools/ht_sys_tool.dart';
import 'package:provider/provider.dart';

class HTClassWatchListPage extends StatefulWidget {
  const HTClassWatchListPage({
    Key? key,
    required this.title,
    this.state = 2,
  }) : super(key: key);

  final String title;
  final int state;

  @override
  State<HTClassWatchListPage> createState() => _HTClassWatchListPageState();
}

class _HTClassWatchListPageState extends State<HTClassWatchListPage> {
  WatchProvider provider = WatchProvider();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: provider..initData(widget.state))
      ],
      child: Selector<WatchProvider, bool>(
        selector: (p0, p1) => p1.refresh,
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: appBarWidget(),
            body: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 112 / 200,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 9.5,
                        ),
                        itemCount: provider.dataList?.length ?? 0,
                        itemBuilder: (context, index) {
                          return itemWidget(index);
                        },
                      ),
                    ),
                  ],
                ),

                temWidget(),
                ///删除提示
                deleteWidget(),
                ///删除弹窗
                deleteBoxWidget(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget temWidget() {
    return Selector<WatchProvider, int>(
      selector: (p0, p1) => p1.selectIndex,
      builder: (context, value, child) {
        return Visibility(
          visible: value >= 0,
          child: GestureDetector(
            onTap: provider.cancleDeleteSlectItem,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
            ),
          ),
        );
      },
    );
  }

  Widget deleteBoxWidget() {
    return Selector<WatchProvider, bool>(
      selector: (p0, p1) => p1.editState,
      builder: (context, value, child) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          bottom: value ? 0 : -100,
          child: Container(
            color: const Color(0xFF1A1C21),
            height: 49 + MediaQuery.of(context).padding.bottom,
            width: SysTools.getScreenSize(context).width,
            child: Column(
              children: [
                SizedBox(
                  height: 49,
                  child: Row(
                    children: [
                      Flexible(
                          child: GestureDetector(
                        onTap: provider.selectAllAciton,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              provider.selectNum() > 0
                                  ? 'Deselect All'
                                  : 'Select All',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )),
                      Flexible(
                          child: GestureDetector(
                        onTap: provider.deleteAllSelectAction,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.transparent,
                          child: const Center(
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFEA4D3D),
                              ),
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).padding.bottom),
              ],
            ),
          ),
        );
      },
    );
  }

  ///删除提示
  Widget deleteWidget() {
    return Selector<WatchProvider, int>(
      selector: (p0, p1) => p1.selectIndex,
      builder: (context, value, child) {
        HistoryBean? model;
        if (value >= 0) {
          model = provider.dataList?[value];
        }
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          bottom: value >= 0 ? 0 : -170,
          child: SafeArea(
            top: false,
            child: Container(
              color: const Color(0xFF1A1C21),
              height: 133,
              width: SysTools.getScreenSize(context).width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 29,
                    child: Text(
                      model?.title ?? '',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffececce),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      provider.deleteItem();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: ImageURL.url_306,
                            width: 24.0,
                            height: 24.0,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Remove From List',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget appBarWidget() {
    return AppBar(
      backgroundColor: const Color(0xff1A1C21),
      title: Text(
        widget.title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      leadingWidth: 24.0,
      leading: GestureDetector(
        child: CachedNetworkImage(
            imageUrl: ImageURL.url_291, width: 24.0, height: 24.0),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Selector<WatchProvider, bool>(
          selector: (p0, p1) => p1.editState,
          builder: (context, value, child) {
            return GestureDetector(
              onTap: provider.editAction,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: double.infinity,
                child: Center(
                  child: Text(
                    provider.actionTitle(),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff)),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  ///列表 Item
  Widget itemWidget(int index) {
    var model = provider.dataList?[index];
    return Selector<WatchProvider, bool>(
      selector: (p0, p1) => p1.editState,
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
               Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HTClassVideoDetailPage(
                    m_type_2:model?.mType2??"",
                    id: model?.id??"",
                  );
                },
              ),
            );
          },
          child: Column(
            children: [
              Flexible(
                flex: 160,
                child: Stack(
                  children: [
                    CachedNetworkImage(imageUrl: model?.cover ?? ''),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              Flexible(
                  flex: 38,
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            model?.title ?? '',
                            maxLines: 2,
                            style: const TextStyle(
                              color: Color(0xFF828386),
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () => provider.selectItem(model!, index),
                          child: CachedNetworkImage(
                            imageUrl: value
                                ? (model?.selectState == true
                                    ? ImageURL.url_81
                                    : ImageURL.url_82)
                                : ImageURL.url_304,
                            width: value ? 18 : 24,
                            height: value ? 18 : 24,
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
