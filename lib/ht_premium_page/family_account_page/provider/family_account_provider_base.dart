import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_premium_page/family_account_page/bean/family_account_bean.dart';

class FamilyAccountProviderBase extends ChangeNotifier {
  FamilyAccountBean? familyAccountBean;

///家庭成员列表刷新标志
  bool loading = false;
}
