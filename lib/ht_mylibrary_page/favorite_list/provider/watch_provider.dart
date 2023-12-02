import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/favorite_list/bean/history_bean.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';

class WatchProvider extends ChangeNotifier {
  ///数据源
  List<HistoryBean>? get dataList => HTUserStore.favoriteList;

  ///编辑状态

  bool editState = false;

  ///是否刷新
  bool refresh = false;
  

  String actionTitle() {
    if (editState == true) {
      return 'Cancle';
    }
    return 'Edit';
  }

  ///编辑/取消编辑

  void editAction() {
    ///取消所有的选中
    for (var element in HTUserStore.favoriteList) {
      element.selectState = false;
    }

    editState = !editState;
    notifyListeners();
  }

  void selectItem(HistoryBean model) {
    if (editState == false) {
      ///1.更多
    } else {
      ///编辑: 选中/取消
      refresh = !refresh;
      model.selectState = !model.selectState;
    }
    notifyListeners();
  }
}
