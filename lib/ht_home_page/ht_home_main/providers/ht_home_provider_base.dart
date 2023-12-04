import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/bean/home_bean.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HTHomeProviderBase extends ChangeNotifier {
  /// 是否点击了首页广告右上角的 x 按钮
  bool isClickedDeleteAdBt = false;

  ///是否点击了订阅引导广告上面的 cancel 按钮
  bool isClickedCancelBt = false;

  bool loading = true;

  ///跑马灯角标
  int carouselSliderCurrent = 0;

  RefreshController refreshController = RefreshController();
  DataList? selectData;
}
