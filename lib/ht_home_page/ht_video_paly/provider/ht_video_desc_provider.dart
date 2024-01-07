import 'dart:convert';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/bean/ht_season_and_episode_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_screen_projection_provider_mixin.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_data_prvider_mixin.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_player_provider_mixin.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider_base.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider_mixin.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/favorite_list/bean/history_bean.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/view/premium_indexerpage.dart';
import 'package:ht_new_movpresenter/provider/main_provider.dart';
import 'package:ht_new_movpresenter/utils/share/ht_share.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_shared_keys.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:ht_new_movpresenter/utils/tools/toast_tool.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

class HTVideoDescProvider extends HTVideoDescProviderBase
    with
        HTVideoProviderMixin,
        HTVideoDescDataProviderMixin,
        HTVideoDescPlayerProviderMixin,
        HTScreenProjectionProviderMixin {
  List<String> videoList = [];
  void _backFromPremiumPageToFullScreen() {
    player.enterFullScreen();
  }

  /// mType2:tt_mflx:电视剧   myfx:电影
  /// id:传的视频id
  Future<void> loadData(String mType2, String id) async {
    mtype2 = mType2;
    dataId = id;
    this.mType2 = mType2;
    var saveData = await isSaveHistory(id);

    if (saveData.item1 == true) {
      selectSsnModelData = Ssn_list()..id = saveData.item2?.ssnId;
      eid = saveData.item2?.epsId;
    }

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

    initData(id: id);

    ///判断当前播放的视频是否处于收藏状态。
    isCollect();
  }

  String videoUrl() {
    // ignore: unrelated_type_equality_checks
    if (MainPovider.isVip != -1) {
      videoUrlStr = (videoDescBean?.data?.hd?.link) != null
          ? videoDescBean?.data?.hd?.link
          : videoDescBean?.data?.sd?.link;
    } else {
      videoUrlStr = (videoDescBean?.data?.sd?.link) != null
          ? videoDescBean?.data?.sd?.link
          : videoDescBean?.data?.hd?.link;
    }
    return videoUrlStr ?? '';
  }

  ///播放器赋值资源
  void initData({String? id}) async {
    ///判断是否有播放记录
    var saveData = await isSaveHistory(id);

    // 停止播放并释放资源
    await player.reset();
    if (kDebugMode) {
      print(videoUrl());
    }
    player.setDataSource(videoUrl(), autoPlay: true, showCover: true);

    //   player.setSubtitle(
    //   'https://example.com/your-subtitle.srt',
    //   type: FijkSubtitleType.SRT,
    // );
    player.addListener(() {
      if (player.value.state == FijkState.started) {
        if (saveData.item1) {
          print('当前进度:${saveData.item2?.seek}');
          player.seekTo(saveData.item2?.seek ?? 0);
        }
      }
      // addHistoryAciton();
    });
  }

  ///点击订阅广告跳转到订阅页面事件
  void jumpToPremiumPage(BuildContext context) {
    isFullScreen =
        (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)
            ? true
            : false;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        print(isFullScreen);
        return HTClassUnPremiumPage(
            title: "Premium",
            isFromFullScreen: isFullScreen,
            backToFullSreen: _backFromPremiumPageToFullScreen);
      }),
    );
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
    isCollected = isSave(videoId());
    notifyListeners();
  }

  ///分享
  /// m_type_2:tt_mflx=电视剧   myfx:电影
  Future<void> shareEvent(String mType2) async {}

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
    bool isSaveState = isSave(model.id);
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
  bool isSave(String? id) {
    bool result = false;
    for (var element in HTUserStore.favoriteList) {
      if (element.id == id) {
        result = true;
      }
    }
    return result;
  }

  ///是否浏览
  Future<Tuple2<bool, HistoryBean?>> isSaveHistory(String? id) async {
    bool result = false;
    HistoryBean? model;
    for (var element in HTUserStore.historyList) {
      if (element.id == id) {
        result = true;
        model = element;
      }
    }
    return Tuple2(result, model);
  }

  Future<void> addHistoryAciton() async {
    var data = {
      "id": dataId,
      "title": videoDescBean?.data?.title,
      "cover": videoDescBean?.data?.cover,
      "rate": videoDescBean?.data?.rate,
      "mType2": mType2,
      "ssnId": sid ?? tv202Bean?.data?.ssnList?[0].id,
      "epsId": eid ?? tv203Bean?.epsList?[0].id,
      'seek': player.currentPos.inMilliseconds
    };
    var model = HistoryBean.fromJson(data);
    bool isSaveState = (await isSaveHistory(model.id)).item1;
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
  @override
  Future<void> playerCallBack(int state, BuildContext context) async {
    ///1 分享  2.投屏 3.收藏  4.vip 5.字幕 6.返回
    if (state == 1) {
      HTShare().share(mType2 ?? '', playLock(), '1', videoId(), title());
    }
    if (state == 2) {
      ///投屏
      screenProjectionAction();
    }
    if (state == 3) {
      saveAction();
    }
    if (state == 4) {
      exitFullScreen();
      jumpToPremiumPage(context);
    }
    if (state == 5) {}
    if (state == 6) {
      Navigator.of(context).pop();
    }
  }

  ///更换播放集
  void changePlayerSource(dynamic model) async{
    eid = model.id.toString();
    await addHistoryAciton();
    loadData(mType2 ?? '', dataId ?? '');
  }

  ///更换视频类型
  void changePlayerType(String mType2, String id) async{
   await addHistoryAciton();
    loadData(mType2, id);
  }

  ///更换季
  void changeSesion(Ssn_list? value) async {
    EasyLoading.show(status: 'loading...');
    selectSsnModelData = value;
    await request203();
    EasyLoading.dismiss();
    notify();
  }

  void didChangeAppLifecycleState(
      AppLifecycleState state, BuildContext context) async {
    if (state == AppLifecycleState.resumed) {
    } else if (state == AppLifecycleState.paused) {
      addHistoryAciton();
    }
  }
}
