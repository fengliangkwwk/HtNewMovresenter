import 'package:flutter/material.dart';

class HTMidSearchProviderBase extends ChangeNotifier {
  ///搜索历史状态
  bool searchHistoty = false;

  ///搜索数据
  List<String> searchDataList = [];

  final htVarFieldController = TextEditingController();

  ///搜素结果数据
  List? searchResult;
}
