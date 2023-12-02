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