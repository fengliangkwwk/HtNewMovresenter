import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HTSearchResultProviderBase extends ChangeNotifier {
  String? keyword;
  int page = 1;
  int pageSize = 24;
  var vType = 0;

  bool loading = false;
  RefreshController refreshController = RefreshController();
  final htVarFieldController = TextEditingController();



  ///搜索数据
  List<String> searchDataList = [];
   ///搜素结果数据
  List? searchResult;

  
}
