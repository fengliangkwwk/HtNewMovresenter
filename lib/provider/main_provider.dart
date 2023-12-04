///外部的 provider 确保这边进入播放也之后，个人中心历史列表那边可以同步记录
import 'package:flutter/material.dart';
 MainPovider mainProvider = MainPovider();
class MainPovider extends ChangeNotifier{
  ///浏览历史状态
  bool historyRefresh = false; 
  void historyRefreshAction() {
    historyRefresh = !historyRefresh;
    notifyListeners();
  }
}