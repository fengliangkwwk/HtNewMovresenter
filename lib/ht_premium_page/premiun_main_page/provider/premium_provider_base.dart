import 'package:flutter/material.dart';

class PremiumProviderBase extends ChangeNotifier {
  BuildContext? context;
  int isFamilyOrIndividual = 0; //0代表个人  1 代表家庭
  bool isloading = false;

  ///个人选中
  int selectPerson = 0;

  ///家庭选中
  int selectFamaily = 0;

  ///是否跳转工具包
  bool toToolPackage = false;
}
