
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_home_main/bean/home_bean.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HTHomeProviderBase extends ChangeNotifier {

    bool loading = true;

    ///跑马灯角标
    int carouselSliderCurrent = 0;

  RefreshController refreshController =
      RefreshController();

    DataList? selectData;


}