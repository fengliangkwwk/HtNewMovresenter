import 'package:ht_new_movpresenter/ht_mylibrary_page/favorite_list/bean/history_bean.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/bean/user_bean.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/bean/ht_premium_bean.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/bean/vip_info_bean.dart';

class HTUserStore {
  ///用户信息
  static UserBean? userBean;

  ///VIP信息
  static VipInfoBean? vipInfoBean;

  ///订阅配置信息
  static HTPremiumBean? premiumBean;
  static List<String> list18 = [];

  static bool login() {
    if (userBean?.uid != null) {
      return true;
    }
    return false;
  }

//是否是首次进入 app
  static bool isFirstInto = true;
//订阅页面点击支付之后的弹窗次数记录
  static int popUps = 0;
//收藏列表
  static List<HistoryBean> favoriteList = [];
  ///浏览数据
  static List<HistoryBean> historyList = [];
}
