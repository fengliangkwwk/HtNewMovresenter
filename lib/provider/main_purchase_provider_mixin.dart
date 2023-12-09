import 'dart:async';
import 'dart:io';

import 'package:in_app_purchase/in_app_purchase.dart';

import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

mixin MainPurchaseProviderMixin {
  ///产品id
  List<String> kProductIds = <String>[
    'week',
    'month',
    'year',
    'family_week',
    'family_month',
    'family_year',
    'free_month'
  ];
// 可订阅产品
  List<ProductDetails> products = <ProductDetails>[];

// 已订阅产品
  List<PurchaseDetails> purchases = <PurchaseDetails>[];

// 监听订阅更新
  late StreamSubscription<List<PurchaseDetails>> subscription;

// 内购实例
  var inAppPurchase = InAppPurchase.instance;

  initInAppPurchase() async {
    //创建监听:
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        inAppPurchase.purchaseStream;
    // 获得新订阅
    subscription =
        purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
      ///监听到内购变化,更新数据
      listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      subscription.cancel();
    }, onError: (Object error) {
      // handle error here.
    });

    // _kProductIds = <String>['com.xxxx.week', 'com.xxxx.year'];
    final bool isAvailable = await inAppPurchase.isAvailable();

    if (!isAvailable) {
      products = <ProductDetails>[];
      purchases = <PurchaseDetails>[];
      return;
    }
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }
    // 加载待售产品
    final ProductDetailsResponse productDetailResponse =
        await inAppPurchase.queryProductDetails(kProductIds.toSet());

    if (productDetailResponse.error != null) {
      products = productDetailResponse.productDetails;
      purchases = <PurchaseDetails>[];
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      products = productDetailResponse.productDetails;
      purchases = <PurchaseDetails>[];
      return;
    }

    ///待销售商品
    products = productDetailResponse.productDetails;
  print('内购待销售商品:${products.length}');
    // await finishIAPTransaction();
  }

  ///监听商品回调
  void listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchases = purchaseDetailsList;
  }

  ///是否订阅
  bool subscriptionPurchaseState() {
    bool result = false;

    for (var element in purchases) {
      if (element.status == PurchaseStatus.purchased) {
        result = true;
      }
    }
    return result;
  }

  ///支付凭证
  String verificationList() {
    var result = <String>[];
    for (var element in purchases) {
      result.add(element.verificationData.localVerificationData);
    }
    return result.isEmpty ? '' : result.first;
  }

  ///订阅的id
  String purChaseProductId() {
    var result = <String>[];
    for (var element in purchases) {
      result.add(element.productID);
    }
    return result.isEmpty ? '0' : result.first;
  }
}

class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
      SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return true;
  }
}
