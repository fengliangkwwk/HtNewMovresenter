import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

class HTVideoDescProviderBase extends ChangeNotifier {
  ///是否展开详情
  var isAllEpisodes = false;

  ///视频播放器
  FijkPlayer player = FijkPlayer();
}
