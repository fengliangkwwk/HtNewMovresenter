import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';

mixin PremiumProviderDataMixin {
  /// 标题

  String productTitle(dynamic model) {
    if (HTUserStore.premiumBean?.isK12() == true) {
      return model?.c1 ?? ''; 
    }
    return model?.title ?? '';
  }

  ///价格
  String productPrice(dynamic model) {
    if (HTUserStore.premiumBean?.isK12() == true) {
      return model?.h1;
    }
    return model?.price ?? '';
  }

  ///优惠价格
  String skProductPrice(dynamic model) {
    if (HTUserStore.premiumBean?.isK12() == true) {
      return model?.h2;
    }
    return model?.skProduct?.price ?? '';
  }
}
