import 'dart:math';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/provider/premium_provider_base.dart';
import 'package:ht_new_movpresenter/provider/main_provider.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';

mixin PremiumProviderDataMixin on PremiumProviderBase {

  Map titleMap = {
    '7':'weekly',
    '30':'monthly',
    '365':'yearly',
  };


  ///订阅产品数据源
  List productDataList() {
    if (HTUserStore.premiumBean?.isK12() == true && isFamilyOrIndividual == 0) {
      return HTUserStore.premiumBean?.personDataList() ?? [];
    }
    if (HTUserStore.premiumBean?.isK12() == true && isFamilyOrIndividual == 1) {
      return HTUserStore.premiumBean?.familyDataList() ?? [];
    }
    return mainProvider.productDataList(type: isFamilyOrIndividual);
  }

  /// 标题

  String productTitle(dynamic model) {
    if (HTUserStore.premiumBean?.isK12() == true) {
      return titleMap[model?.c1 ?? ''] ?? '';
    }
    return model?.title ?? '';
  }

  ///优惠价格
  String productPrice(dynamic model) {
    if (HTUserStore.premiumBean?.isK12() == true) {
      if (HTUserStore.premiumBean?.discountProduct(model) == true) {
        String h1 = model?.h1 ?? '';
        String h2 = model?.h2 ?? '';
        h1 = h1.isEmpty ? '0' : h1;
        h2 = h2.isEmpty ? '0' : h2;
        return min(double.parse(h1), double.parse(h2)).toString();
      } else {
        return model?.h2;
      }
    }
    return model?.price ?? '';
  }

  ///原价格
  String skProductPrice(dynamic model) {
    if (HTUserStore.premiumBean?.isK12() == true) {
      return model?.y1 ?? 'zz';
    }
    return model?.skProduct?.price ?? '';
  }
}
