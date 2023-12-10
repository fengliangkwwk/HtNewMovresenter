import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/provider/premium_provider_base.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/provider/premium_provider_data_mixin.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/provider/premium_provider_ximin.dart';

class PremiumProvider extends PremiumProviderBase
    with PremiumProviderMixin, PremiumProviderDataMixin {
  ///数据请求
  Future<void> loadData() async {
    await requestPremiumApi();
    await requesCheckVipApi();
    notifyListeners();
  }

  ///点击家庭订阅和个人订阅
  void clickIndividualOrFamily(int index) {
    print('====================${index}');
    isFamilyOrIndividual = index;
    notifyListeners();
  }

  ///点击产品
  void clickProductItemAction(int index) {
    if (isFamilyOrIndividual == 1) {
      selectFamaily = index;
    } else {
      selectPerson = index;
    }
    notifyListeners();
  }

  ///产品是否选中
  bool isSelect(int index) {
    if (isFamilyOrIndividual == 1 && index == selectFamaily) {
      return true;
    }

    if (isFamilyOrIndividual == 0 && index == selectPerson) {
      return true;
    }
    return false;
  }

  ///标题颜色 / 优惠价格颜色

  Color productTitleColor(bool selectState) {
    if (selectState == true) {
      return const Color(0xFF222222);
    }
    return const Color(0xFFECECEC);
  }

  Color productPriceColor(bool selectState) {
    if (selectState == true) {
      return const Color(0xFF222222);
    }

    return const Color(0xff999999);
  }

}
