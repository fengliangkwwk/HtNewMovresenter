import 'dart:convert';

import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_data_prvider_mixin.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider_base.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider_mixin.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/favorite_list/bean/history_bean.dart';
import 'package:ht_new_movpresenter/provider/main_provider.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_shared_keys.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class HTVideoDescProvider extends HTVideoDescProviderBase
    with HTVideoProviderMixin, HTVideoDescDataProviderMixin {
  /// mType2:tt_mflx:电视剧   myfx:电影
  /// id:传的视频id
  Future<void> loadData(String mType2, String id) async {
    dataId = id;
    await apiRequest(mType2, id);
    initData();
  }

  void initData() {
    // player.setDataSource(
    //   'https://sample-videos.com/video123/flv/240/big_buck_bunny_240p_10mb.flv',
    //   autoPlay: true,
    // );
    // player.setDataSource(
    //   'http://video.aiyayakids.com/ayy_videolist/hls/sd/ayy_m3u8_php/20210930/dMXHPJkJik-00015.ts',
    //   // videoDescBean?.data?.hd?.link ??
    //   //     'https://sample-videos.com/video123/flv/240/big_buck_bunny_240p_10mb.flv',
    //   autoPlay: true,
    // );
    // playerOption();

  videoPlayer = VideoPlayerController.networkUrl(Uri.parse(
        'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        // setState(() {});
        // notifyListeners();
        videoPlayer?.play();
        print('播放视频');
      });

    addHistoryAciton();

  }

  void allEpisodesEvent() {
    print('点击了allEpisodes按钮');
    isAllEpisodes = !isAllEpisodes;
    notifyListeners();
  }

  void moreInfoEvent() {
    print('moreInfo按钮');
    htVarInfoShown = !htVarInfoShown;
    notifyListeners();
  }

  ///分享
  /// m_type_2:tt_mflx=电视剧   myfx:电影
  Future<void> shareEvent(String m_type_2) async {}

  ///收藏 /取消收藏
  void saveAction() async {
    var data = {
      "id": dataId,
      "title": videoDescBean?.data?.title,
      "cover": videoDescBean?.data?.cover,
      "rate": videoDescBean?.data?.rate,
      "mType2": mType2,
      "ssnId": tv202Bean?.data?.ssnList?[0].id,
      "epsId": tv203Bean?.epsList?[0].id
    };
    var model = HistoryBean.fromJson(data);
    bool isSaveState = await isSave(model.id);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isSaveState) {
      ///1.已收藏

      ///不同的id保留,删掉相同的id
      var temList = HTUserStore.favoriteList
          .where((element) => element.id != model.id)
          .toList();
      HTUserStore.favoriteList = temList;
    } else {
      ///1.未收藏,
      HTUserStore.favoriteList.add(model);
    }
    var savaData = [];

    for (var element in HTUserStore.favoriteList) {
      savaData.add(element.toJson());
    }
    prefs.setString(HTSharedKeys.favoriteList, jsonEncode(savaData));
  }

  ///是否收藏
  Future<bool> isSave(String? id) async {
    bool result = false;
    for (var element in HTUserStore.favoriteList) {
      if (element.id == id) {
        result = true;
      }
    }

    return result;
  }

  ///是否浏览

  Future<bool> isSaveHistory(String? id) async {
    bool result = false;
    for (var element in HTUserStore.historyList) {
      if (element.id == id) {
        result = true;
      }
    }

    return result;
  }

  void addHistoryAciton() async {
    var data = {
      "id": dataId,
      "title": videoDescBean?.data?.title,
      "cover": videoDescBean?.data?.cover,
      "rate": videoDescBean?.data?.rate,
      "mType2": mType2,
      "ssnId": tv202Bean?.data?.ssnList?[0].id,
      "epsId": tv203Bean?.epsList?[0].id
    };
    var model = HistoryBean.fromJson(data);
    bool isSaveState = await isSaveHistory(model.id);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isSaveState) {
      ///已浏览
      ///不同的id保留,删掉相同的id
      var temList = HTUserStore.historyList
          .where((element) => element.id != model.id)
          .toList();
      HTUserStore.historyList = temList;
    }
    HTUserStore.historyList.add(model);

    var savaData = [];
    mainProvider.historyRefreshAction();
    for (var element in HTUserStore.historyList) {
      savaData.add(element.toJson());
    }
    prefs.setString(HTSharedKeys.historyList, jsonEncode(savaData));
  }
}
