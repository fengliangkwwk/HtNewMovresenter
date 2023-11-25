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

  /// 分数
  String rate() {
    if (isTV()) {
      return tv202Bean?.data?.rate ?? '0.0';
    }
    return videoDescBean?.data?.rate ?? '0.0';
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

  ///专题列表 provider.videoDescBean?.data2?[2].data
  List? projectList() {
    if (isTV()) {
      return  tv202Bean?.data3?[0].data;
    }
    return videoDescBean?.data2?[2].data;
  }
}
