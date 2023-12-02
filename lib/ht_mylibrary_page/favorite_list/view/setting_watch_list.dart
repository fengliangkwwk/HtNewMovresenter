import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/favorite_list/provider/watch_provider.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:provider/provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:tuple/tuple.dart';

class HTClassWatchListPage extends StatefulWidget {
  const HTClassWatchListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HTClassWatchListPage> createState() => _HTClassWatchListPageState();
}

class _HTClassWatchListPageState extends State<HTClassWatchListPage> {
  late WatchProvider provider;
  @override
  void initState() {
    super.initState();
    provider = WatchProvider();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: provider)],
      child: Scaffold(
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
                    itemCount: HTUserStore.favoriteList.length,
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
          ],
        ),
      ),
    );
  }

Widget temWidget() {
  return Visibility(
    visible: true,
    child: GestureDetector(
      onTap: () {
        print('11');
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
      ),
    ),
  );
}


  ///删除提示
  Widget deleteWidget() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      bottom: 0,
      child: SafeArea(
          top: false,
          child: Container(
            color: const Color(0xFF1A1C21),
            height: 133,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  height: 29,
                  child: Text(
                    '38273072983729038729038729837',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffececce),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    print('11');
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
  }

  PreferredSizeWidget appBarWidget() {
    return AppBar(
      backgroundColor: const Color(0xff1A1C21),
      title: const Text(
        "Watchlist",
        style: TextStyle(
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

  ///
  Widget itemWidget(int index) {
    var model = HTUserStore.favoriteList[index];
    return Selector<WatchProvider, Tuple2<bool, bool>>(
      selector: (p0, p1) => Tuple2(p1.editState, p1.refresh),
      builder: (context, value, child) {
        return Column(
          children: [
            Flexible(
              flex: 160,
              child: Stack(
                children: [
                  CachedNetworkImage(imageUrl: model.cover ?? ''),
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
                          'dat2a983743987983709847098734098739087903847821219zzz',
                          maxLines: 2,
                          style: TextStyle(color: Colors.amber),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => provider.selectItem(model),
                        child: CachedNetworkImage(
                          imageUrl: value.item1
                              ? (model.selectState
                                  ? ImageURL.url_81
                                  : ImageURL.url_82)
                              : ImageURL.url_304,
                          width: value.item1 ? 18 : 24,
                          height: value.item1 ? 18 : 24,
                        ),
                      ),
                      SizedBox(width: 4),
                    ],
                  ),
                ))
          ],
        );
      },
    );
  }
}
