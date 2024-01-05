import 'dart:io' as io;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:device_information/device_information.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:ht_new_movpresenter/utils/tools/ht_sys_tool.dart';

class KTClassUIUtils {
  static var defRes = "";

  ///搜索页面的三个
  static Widget htMethodGetRankingNumbers(int htVarranking) {
    switch (htVarranking) {
      case 1:
        return CachedNetworkImage(
            imageUrl: ImageURL.url_296, width: 30, height: 30);
      case 2:
        return CachedNetworkImage(
            imageUrl: ImageURL.url_297, width: 30, height: 30);
      case 3:
        return CachedNetworkImage(
            imageUrl: ImageURL.url_298, width: 30, height: 30);
      default:
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CachedNetworkImage(
                imageUrl: ImageURL.url_299, width: 30, height: 30),
            Positioned(
              child: Text(
                htVarranking < 10
                    ? '0${htVarranking.toString()}'
                    : htVarranking.toString(),
                style: const TextStyle(
                  color: Color(0xffECECEC),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );

      // return Container(width: 30,height: 30,alignment:Alignment.center,decoration: BoxDecoration(color:Color(0xff3E4553),borderRadius: BorderRadius.only(bottomRight: Radius.circular(5.0))),child:
      // Text((htVarranking<10?"0":"")+(htVarranking.toString()),style: TextStyle(color: Color(0xffECECEC),fontSize: 18.0)));
    }
  }

  static Future<Map<String, dynamic>> htMethodPutRequestCommonParams(
      Map<String, dynamic> htVarParam) async {
    try {
      var imeiID = await DeviceInformation.deviceIMEINumber;
      var modelID = await DeviceInformation.deviceModel;
      var devId = await DeviceInformation.deviceName;
      if (io.Platform.isIOS) {
//通知栏回调里的deviceToken
        htVarParam.putIfAbsent(
            "apns_id",
            () =>
                "8a983582effc3d97a8a8333eeeb790e187c2caeb3c3f88a48cd18ae7c84a3d93");
        htVarParam.putIfAbsent("app_id", () => "93"); //app编号，测试用100默认是100
        htVarParam.putIfAbsent("app_ver", () => "1.0.0"); //app版本
        htVarParam.putIfAbsent("brand", () => "iPhone"); //系统名称
        htVarParam.putIfAbsent(
            "country", () => "US"); //国家码，如美国US，中国CN    默认值:US
        htVarParam.putIfAbsent(
            "device",
            () =>
                "iOS"); //公参：系统名称，如iOS(UIDevice.currentDevice.systemName) 默认值: iOS
        htVarParam.putIfAbsent("deviceNo", () => imeiID); //公参：设备信息
        htVarParam.putIfAbsent("idfa", () => imeiID); //公参：IDFA（
        htVarParam.putIfAbsent(
            "imsi", () => '51502'); //网络供应商国家编号+网络编号  默认值:51502
        htVarParam.putIfAbsent(
            "installTime", () => SysTools().getSecondsTimeStamp()); //首次安装时间
        htVarParam.putIfAbsent("lang", () => "en"); //公参：设备当前语言 默认值:en
        htVarParam.putIfAbsent("model", () => modelID); //设备型号 默认值:iPhone10,3
        htVarParam.putIfAbsent("os_ver",
            () => "16.1"); //设备系统版本，如16.0(UIDevice.currentDevice.systemVersion)
        htVarParam.putIfAbsent("r1", () => "100"); //开关状态 默认值:100
        htVarParam.putIfAbsent("reg_id", () => "0"); //推送fcmToken 默认值:0
        htVarParam.putIfAbsent(
            "resolution", () => "1125x2436"); //屏幕分辨率 默认值: 1125x2436
        htVarParam.putIfAbsent("simcard", () => "1"); //是否插入手机卡 默认值:1
        htVarParam.putIfAbsent("timezone", () => "8"); //时区 默认值:8
        htVarParam.putIfAbsent("token", () => "1"); //默认传1 默认值:1
        htVarParam.putIfAbsent("vp", () => "0"); //ip状态：1VIP，0非VIP 默认值:0
      } else {
        htVarParam.putIfAbsent(
            "apns_id",
            () =>
                "8a983582effc3d97a8a8333eeeb790e187c2caeb3c3f88a48cd18ae7c84a3d93");
        htVarParam.putIfAbsent("app_id", () => "93"); //266
        htVarParam.putIfAbsent("app_ver", () => "1.0.0");
        htVarParam.putIfAbsent("brand", () => "iPhone");
        htVarParam.putIfAbsent("country", () => "US");
        htVarParam.putIfAbsent("device", () => "iOS");
        htVarParam.putIfAbsent(
            "deviceNo", () => "276E0495-66F6-417B-92FA-66EF0DC69DD4");
        htVarParam.putIfAbsent(
            "idfa", () => "276E0495-66F6-417B-92FA-66EF0DC69DD4");
        htVarParam.putIfAbsent("imsi", () => "51502");
        htVarParam.putIfAbsent(
            "installTime", () => SysTools().getSecondsTimeStamp());
        htVarParam.putIfAbsent("lang", () => "en");
        htVarParam.putIfAbsent("control", () => "iPhone10,3");
        htVarParam.putIfAbsent("os_ver", () => "16.1");
        htVarParam.putIfAbsent("r1", () => "100");
        htVarParam.putIfAbsent("reg_id", () => "0");
        htVarParam.putIfAbsent("resolution", () => "1125x2436");
        htVarParam.putIfAbsent("simcard", () => "1");
        htVarParam.putIfAbsent("timezone", () => "8");
        htVarParam.putIfAbsent("token", () => "1");
        htVarParam.putIfAbsent("vp", () => "0");
      }
    } on Exception {
      htVarParam.putIfAbsent(
          "apns_id",
          () =>
              "8a983582effc3d97a8a8333eeeb790e187c2caeb3c3f88a48cd18ae7c84a3d93");
      htVarParam.putIfAbsent("app_id", () => "93"); //266
      htVarParam.putIfAbsent("app_ver", () => "1.0.0");
      htVarParam.putIfAbsent("brand", () => "iPhone");
      htVarParam.putIfAbsent("country", () => "US");
      htVarParam.putIfAbsent("device", () => "iOS");
      htVarParam.putIfAbsent(
          "deviceNo", () => "276E0495-66F6-417B-92FA-66EF0DC69DD4");
      htVarParam.putIfAbsent(
          "idfa", () => "276E0495-66F6-417B-92FA-66EF0DC69DD4");
      htVarParam.putIfAbsent("imsi", () => "51502");
      htVarParam.putIfAbsent(
          "installTime", () => SysTools().getSecondsTimeStamp());
      htVarParam.putIfAbsent("lang", () => "en");
      htVarParam.putIfAbsent("control", () => "iPhone10,3");
      htVarParam.putIfAbsent("os_ver", () => "16.1");
      htVarParam.putIfAbsent("r1", () => "100");
      htVarParam.putIfAbsent("reg_id", () => "0");
      htVarParam.putIfAbsent("resolution", () => "1125x2436");
      htVarParam.putIfAbsent("simcard", () => "1");
      htVarParam.putIfAbsent("timezone", () => "8");
      htVarParam.putIfAbsent("token", () => "1");
      htVarParam.putIfAbsent("vp", () => "0");
    }
    return htVarParam;
  }

  static setDeviceResolution(BuildContext context) {
    defRes = MediaQuery.of(context).size.width.toString() +
        "x" +
        MediaQuery.of(context).size.height.toString();
  }
}

/**
    apns_id  公参：通知栏回调里的deviceToken
    默认值:
    8a983582effc3d97a8a8333eeeb790e187c2caeb3c3f88a48cd18ae7c84a3d93
    app_id 公参：app编号，测试用100
    默认值:266
    app_ver
    公参：app版本，如1.0.0    默认值:1.0.0
    brand 公参：系统名称，如iPhone(UIDevice.currentDevice.model)
    默认值:iPhone
    country 公参：国家码，如美国US，中国CN    默认值:US
    device 公参：系统名称，如iOS(UIDevice.currentDevice.systemName) 默认值: iOS
    deviceNo 公参：设备信息[[[UIDevice currentDevice] identifierForVendor] UUIDString]
    默认值:
    276E0495-66F6-417B-92FA-66EF0DC69DD4
    idfa 公参：IDFA（[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString]）
    默认值:
    276E0495-66F6-417B-92FA-66EF0DC69DD4
    imsi 公参：网络供应商国家编号+网络编号
    默认值:51502
    installTime 公参：首次安装时间
    默认值:1676455895
    lang 公参：设备当前语言 默认值:en
    model 公参：设备型号 默认值:iPhone10,3
    os_ver 公参：设备系统版本，如16.0(UIDevice.currentDevice.systemVersion)
    默认值:16.1
    r1 公参：开关状态 默认值:100
    reg_id 公参：推送fcmToken 默认值:0
    resolution 公参：屏幕分辨率 默认值: 1125x2436
    simcard 公参：是否插入手机卡 默认值:1
    timezone 公参：时区 默认值:8
    token 公参：默认传1 默认值:1
    vp 公参：vip状态：1VIP，0非VIP 默认值:0
 */