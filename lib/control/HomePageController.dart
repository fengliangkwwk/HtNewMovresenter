import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:get/get.dart';
import 'package:ht_new_movpresenter/bean/HomePageBean.dart';
import 'package:ht_new_movpresenter/utils/ht_api.dart';
import 'package:ht_new_movpresenter/utils/ht_dio_utils.dart';
class HomePageController extends GetxController {
  final imageList = [].obs;

  void getHomePageData() async {
    final res = await HttpUtils.instance.post(
      Global.homePageUrl,
      params: {},
      tips: true,
    );
  }
}