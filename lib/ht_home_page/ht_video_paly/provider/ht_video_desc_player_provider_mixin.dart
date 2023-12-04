import 'package:fijkplayer/fijkplayer.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider_base.dart';
import 'package:ht_new_movpresenter/utils/tools/ht_sys_tool.dart';

mixin HTVideoDescPlayerProviderMixin on HTVideoDescProviderBase {
  bool refreshPlayer = false;

  void playerAddListener() {
    player.addListener(() {
      if (player.state == FijkState.started) {
        ///播放状态
        // print('开始播放');
      } else {
        ///非播放状态
        // print('非播放');
      }
      print('刷新状态');
      notify();
    });

    player.onCurrentPosUpdate.listen((event) { 
      notify();
    });
  }

  ///播放/暂停

  void playAction() async {
    print('当前播放器状态:${player.state}');
    // if (player.state == FijkState.started) {
    //   ///播放状态
    //   await player.pause();
    // } else if (player.state == FijkState.paused) {
    //   ///非播放状态
    //   await player.start();
    //   // await Future.delayed(Duration(milliseconds: 100));
    // } else {
    //   ///播放完成状态
    //   await player.seekTo(0);
    //   await player.start();
    // }
    playOrPause();
    print('当前播放器状态:${player.state}');
    notify();
  }

  void playOrPause() {
    if (player.isPlayable() || player.state == FijkState.asyncPreparing) {
      if (player.state == FijkState.started) {
        player.pause();
      } else {
        player.start();
      }
    } else if (player.state == FijkState.initialized) {
      player.start();
    } else {
      FijkLog.w("Invalid state ${player.state} ,can't perform play or pause");
    }
  }

  ///全屏/退出全屏
  void fullScreenAction() {
    player.enterFullScreen();
  }


  void notify() {
    refreshPlayer = !refreshPlayer;
    notifyListeners();
  }

  ///开始时间
  String startTimeString() {
    return SysTools.formatDuration(player.currentPos);
  }

  ///总时间
  String allTimeString() {
    return SysTools.formatDuration(player.value.duration);
  }


  void playerCallBack(int state) {}



}
