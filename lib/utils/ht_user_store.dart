import 'package:ht_new_movpresenter/ht_mylibrary_page/beans/user_bean.dart';

class HTUserStore {

  static UserBean? userBean;

  static bool login() {
    if (userBean?.uid !=null) {
      return true;
    }
    return false;
  }

    


}