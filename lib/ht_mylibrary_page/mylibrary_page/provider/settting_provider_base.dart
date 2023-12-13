import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/bean/user_bean.dart';

class SettingProviderBase extends ChangeNotifier {
  UserBean? userBean;
  bool isReloadHeader = false;
}
