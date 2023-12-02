
import 'package:ht_new_movpresenter/ht_mylibrary_page/favorite_list/bean/history_bean.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/bean/user_bean.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/bean/ht_video_desc_bean.dart';
class HTUserStore {
  static UserBean? userBean;

  static List<String> list18 = [];

  static bool login() {
    if (userBean?.uid != null) {
      return true;
    }
    return false;
  }

//是否是首次进入 app
  static bool isFirstInto = true;
//收藏列表
  static List<HistoryBean> favoriteList = [];
  ///浏览数据
  
}
