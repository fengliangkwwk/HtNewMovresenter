import 'package:flutter/material.dart';

class PremiumProviderBase extends ChangeNotifier {
  int isFamilyOrIndividual = 0; //0代表个人  1 代表家庭
  bool isloading = false;

  ///个人选中
  int selectPerson = -1;
  ///家庭选中
  int selectFamaily = -1;
}
