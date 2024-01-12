import 'package:flutter/material.dart';

class MainProviderBase extends ChangeNotifier {
  ///是否是vip
  bool vipState = false;
  ///点击的订阅产品编号(跳转到工具包时会用到此参数)
  String? selectProductNo;
}
