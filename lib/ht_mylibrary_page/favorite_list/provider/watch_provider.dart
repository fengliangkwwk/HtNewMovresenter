import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/favorite_list/bean/history_bean.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_shared_keys.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchProvider extends ChangeNotifier {
  ///1.播放历史 2.收藏
  int state = 2;

  ///数据源
  List<HistoryBean>? dataList;

  WatchProvider({this.state = 2}) {
    if (state == 2) {
      dataList = HTUserStore.favoriteList;
    } else {}
  }

  ///编辑状态

  bool editState = false;

  ///是否刷新
  bool refresh = false;

  ///选中index
  int selectIndex = -1;

  String actionTitle() {
    if (editState == true) {
      return 'Cancle';
    }
    return 'Edit';
  }

  ///编辑/取消编辑

  void editAction() {
    ///取消所有的选中
    for (var element in dataList ?? <HistoryBean>[]) {
      element.selectState = false;
    }

    editState = !editState;
    notifyListeners();
  }

  void selectItem(HistoryBean model, int index) {
    if (editState == false) {
      ///1.更多
      selectIndex = index;
    } else {
      ///编辑: 选中/取消
      refresh = !refresh;
      model.selectState = !model.selectState;
    }
    notifyListeners();
  }

  ///删除单个
  void deleteItem() {
    refresh = !refresh;
    (dataList ?? <HistoryBean>[]).removeAt(selectIndex);
    selectIndex = -1;
    saveDisk();
    notifyListeners();
  }

  ///取消删除弹窗
  void cancleDeleteSlectItem() {
    selectIndex = -1;
    notifyListeners();
  }

  ///是否有选中
  int selectNum() {
    int num = 0;
    for (var element in dataList ?? <HistoryBean>[]) {
      if (element.selectState) {
        num++;
      }
    }
    return num;
  }

  ///选中全部/取消选中全部
  void selectAllAciton() {
    if (selectNum() > 0) {
      for (var element in dataList ?? <HistoryBean>[]) {
        element.selectState = false;
      }
    } else {
      for (var element in dataList ?? <HistoryBean>[]) {
        element.selectState = true;
      }
    }
    refresh = !refresh;
    notifyListeners();
  }

  /// 删除全部u选中的
  void deleteAllSelectAction() {
    var temList = (dataList ?? <HistoryBean>[])
        .where((element) => !element.selectState)
        .toList();
    dataList = temList;
    refresh = !refresh;
    saveDisk();
    notifyListeners();
  }

  ///存本地磁盘
  void saveDisk() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var savaData = [];
    for (var element in HTUserStore.favoriteList) {
      savaData.add(element.toJson());
    }
    if (state == 2) {
      prefs.setString(HTSharedKeys.favoriteList, jsonEncode(savaData));
    } else {
      prefs.setString(HTSharedKeys.historyList, jsonEncode(savaData));
    }
  }
}
