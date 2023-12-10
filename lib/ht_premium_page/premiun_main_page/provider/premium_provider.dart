import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/provider/premium_provider_base.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/provider/premium_provider_data_mixin.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/provider/premium_provider_ximin.dart';
import 'package:ht_new_movpresenter/provider/main_provider.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

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

  ///选中产品的描述

  String selectProductDis() {
    ///1.获取数据源
    var dataList = productDataList();
    if (dataList.isEmpty) return '';

    ///获取选中数据
    var model =
        dataList[isFamilyOrIndividual == 1 ? selectFamaily : selectPerson];

    ///3.判断是否是优惠项
    if (HTUserStore.premiumBean?.discountProduct(model) == true) {
      return model?.t1 ?? '';
    }
    return 'You can cancel anytime';
  }

  String selectProductPrice() {
    ///1.获取数据源
    var dataList = productDataList();
    if (dataList.isEmpty) return '';

    ///获取选中数据
    var model =
        dataList[isFamilyOrIndividual == 1 ? selectFamaily : selectPerson];

    ///3.判断是否是优惠项
    if (HTUserStore.premiumBean?.discountProduct(model) == true) {
      return '${model?.h1 ?? ''}/${titleMap[model?.c1 ?? ''] ?? ''}';
    }
    return 'Pay \$${productPrice(model)}';
  }

  ///去订阅
  void go2Pay() async {
    var dataList = productDataList();
    if (dataList.isEmpty) return;

    ///获取选中数据
    var model =
        dataList[isFamilyOrIndividual == 1 ? selectFamaily : selectPerson];
    if (HTUserStore.premiumBean?.isK12() == true) {
      ///服务器订阅
      return;
    }

    ///本地订阅
    var purchaseParam = PurchaseParam(productDetails: model);

    EasyLoading.show();

    bool resutl = await mainProvider.inAppPurchase
        .buyNonConsumable(purchaseParam: purchaseParam);

    if (resutl == true) {
          print('订阅完成:$resutl');
        requesCheckVipApi(flag: '1');
    }
  }
}
