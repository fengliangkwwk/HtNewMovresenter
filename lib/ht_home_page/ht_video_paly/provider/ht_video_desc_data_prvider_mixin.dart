import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider_mixin.dart';

mixin HTVideoDescDataProviderMixin on HTVideoProviderMixin {
  bool isTV() {
    if (mType2 == 'tt_mflx') {
      return true;
    }
    return false;
  }

  /// 标题
  String title() {
    if (isTV()) {
      return tv202Bean?.data?.title ?? '';
    }
    return videoDescBean?.data?.title ?? '';
  }

  /// 分享使用的视频 id
  String videoId() {
    if (isTV()) {
      return tv202Bean?.data?.id ?? '';
    }
    return videoDescBean?.data?.id ?? '';
  }

  /// 分享使用的视频 play_lock// 1锁电影，0不锁
  String playLock() {
    if (isTV()) {
      return tv202Bean?.data?.playLock ?? '';
    }
    return videoDescBean?.data?.playLock ?? '';
  }

  /// 分数
  double rate() {
    if (isTV()) {
      return (double.tryParse(tv202Bean?.data?.rate ?? '0.0')??0.0)/2;
    }
    return (double.tryParse(videoDescBean?.data?.rate ?? '0.0')??0.0)/2 ;
  }

  /// 年份
  String year() {
    if (isTV()) {
      return tv202Bean?.data?.pubDate ?? '';
    }
    return videoDescBean?.data?.pubDate ?? '';
  }

  /// 国家
  String country() {
    if (isTV()) {
      return tv202Bean?.data?.country ?? '';
    }
    return videoDescBean?.data?.country ?? '';
  }

  /// info
  String info() {
    if (isTV()) {
      return tv202Bean?.data?.description ?? '';
    }
    return videoDescBean?.data?.description ?? '';
  }

  ///演员列表
  List? actionList() {
    if (isTV()) {
      return tv202Bean?.data?.casts;
    }
    return videoDescBean?.data2?[0].data;
  }

  // ///专题列表 provider.videoDescBean?.data2?[2].data
  // List? projectList() {
  //   if (isTV()) {
  //     return  tv202Bean?.data3?[0].data;
  //   }
  //   return videoDescBean?.data2?[2].data;
  // }

  ///获取专题列表
  List? projectList() {
    if (isTV()) {
      return tv202Bean?.data3;
    }
    return videoDescBean?.data2;
  }

  ///获取电视剧季列表
  List? seasonList() {
    if (isTV()) {
      return tv202Bean?.data?.ssnList ?? [];
    }
    return null;
  }

  ///获取电视剧集列表
  List? setList() {
    if (isTV()) {
      return tv203Bean?.epsList ?? [];
    }
    return null;
  }

  ///获取当前季名称
String ssnTitle(String id) {
  for (var element in seasonList() ?? []) {
    if (element.id.toString() == id) {
      return element.title.toString();
    }
  }
  return 'Select Item';
}
}
