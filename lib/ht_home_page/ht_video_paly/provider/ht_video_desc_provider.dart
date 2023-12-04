import 'dart:convert';

import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_data_prvider_mixin.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_player_provider_mixin.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider_base.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider_mixin.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/favorite_list/bean/history_bean.dart';
import 'package:ht_new_movpresenter/provider/main_provider.dart';
import 'package:ht_new_movpresenter/utils/share/ht_share.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_shared_keys.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:ht_new_movpresenter/utils/tools/toast_tool.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HTVideoDescProvider extends HTVideoDescProviderBase
    with
        HTVideoProviderMixin,
        HTVideoDescDataProviderMixin,
        HTVideoDescPlayerProviderMixin {
  List<String> videoList = [];

  /// mType2:tt_mflx:电视剧   myfx:电影
  /// id:传的视频id
  Future<void> loadData(String mType2, String id) async {
    dataId = id;
    this.mType2 = mType2;
    await apiRequest(mType2, id);
    videoList = [
      'rtsp://zephyr.rtsp.stream/pattern?streamKey=1fd73653a094b877b9bd78468c91adbf',
      'http://kbs-dokdo.gscdn.com/dokdo_300/_definst_/dokdo_300.stream/playlist.m3u8',
      'https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8',
      'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8',
      'https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.mp4/.m3u8',
      'https://sample-videos.com/video123/flv/720/big_buck_bunny_720p_1mb.flv',
      'https://sample-videos.com/video123/mkv/720/big_buck_bunny_720p_1mb.mkv',
      'https://sample-videos.com/video123/3gp/144/big_buck_bunny_144p_1mb.3gp',
      'http://www.w3school.com.cn/i/movie.mp4'
      'https://sample-videos.com/video123/3gp/144/big_buck_bunny_144p_1mb.3gp',
      'https://sample-videos.com/video123/3gp/144/big_buck_bunny_144p_2mb.3gp',
      'https://sample-videos.com/video123/3gp/144/big_buck_bunny_144p_5mb.3gp',
      'https://sample-videos.com/video123/3gp/144/big_buck_bunny_144p_10mb.3gp',
      'https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8'
    ];
    initData();
    ///判断当前播放的视频是否处于收藏状态。
    isCollect();
  }
  ///播放器赋值资源
  void initData() {
    player.setDataSource(videoList[11],
        // videoDescBean?.data?.hd?.link ??
        //     'https://sample-videos.com/video123/flv/240/big_buck_bunny_240p_10mb.flv',
        autoPlay: true,
        showCover: true);
    // player.addListener(
    //   () {
    //     // print(
    //     //     'zzs:${player.currentPos},${player.value.duration.inSeconds},${player.bufferPos}');
    //   },
    // );
    addHistoryAciton();
  }

  void allEpisodesEvent() {
    isAllEpisodes = !isAllEpisodes;
    notifyListeners();
  }

  void moreInfoEvent() {
    htVarInfoShown = !htVarInfoShown;
    notifyListeners();
  }

  void isCollect() async {
    isCollected = await isSave(videoId());
    notifyListeners();
  }

  ///分享
  /// m_type_2:tt_mflx=电视剧   myfx:电影
  Future<void> shareEvent(String m_type_2) async {}

  ///收藏 //取消收藏
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
      ToastUtil.showToast(msg: "Collection removed successfully.");
    } else {
      ///1.未收藏,
      HTUserStore.favoriteList.add(model);
      ToastUtil.showToast(msg: "Collection saved successfully.");
    }
    var savaData = [];
    for (var element in HTUserStore.favoriteList) {
      savaData.add(element.toJson());
    }
    prefs.setString(HTSharedKeys.favoriteList, jsonEncode(savaData));
    isCollect();
    // notifyListeners();
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

  ///控制器界面上的点击事件
  void playerCallBack(int state) {
    if (state == 1) {
      HTShare().share(mType2 ?? '', playLock(), '1', videoId(), title());
    }
  }
}
