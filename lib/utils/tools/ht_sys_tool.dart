import 'package:flutter/material.dart';

class SysTools {
  ///获取当前屏幕的宽高尺寸
  static Size getScreenSize(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return screenSize;
  }

  ///获取当前的时间戳(精确到毫秒 13位返回值)
static  String getMilliSecondsTimeStamp() {
    DateTime now = DateTime.now();
    int timestamp = now.millisecondsSinceEpoch;
    return timestamp.toString();
  }

  ///获取当前的时间戳(精确到秒 10位返回值)
static String getSecondsTimeStamp() {
    DateTime now = DateTime.now();
    int timestamp = now.millisecondsSinceEpoch ~/ 1000; // 将13位数时间戳转换为10位数
    return timestamp.toString();
  }

  ///时间戳转时间
static  String getTimeFromTimeStamp(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return dateTime.toString();
  }

  // Define the function
static String formatDuration(Duration duration) {
  String hours = duration.inHours.toString().padLeft(0, '2');
  String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return "$hours:$minutes:$seconds";
}
///要检测一个double类型的数是否有小数点后面一位
static bool hasOneDecimalPlace(String numberString) {
  // // 将double转换为字符串
  // String numberString = number.toString();
  // 查找小数点的索引
  int decimalIndex = numberString.indexOf('.');
  // 如果存在小数点，并且小数点后有一位数字
  if (decimalIndex != -1 && decimalIndex + 2 == numberString.length) {
    return true;
  }
  return false;
}

///获取小数点前面子字符串
static String getBeforeDecimal(String str) {
    // 使用split方法将字符串分割成两部分
    List<String> parts = str.split('.');
    // 获取小数点前的子字符串
    String beforeDecimal = parts.isNotEmpty ? parts[0] : '';
    return '$beforeDecimal.';
  }
///获取小数点后面子字符串
static String getAfterDecimal(String str) {
    // 使用split方法将字符串分割成两部分
    List<String> parts = str.split('.');
    // 获取小数点后的子字符串
    String afterDecimal = parts.length > 1 ? parts[1] : '';
    return afterDecimal;
  }


///判断当前页面是否为某个页面
static bool isCurrentPage(BuildContext context, Widget page) {
  // 获取当前路由
  final currentRoute = ModalRoute.of(context)?.settings;
  // 检查当前页面是否不是特定页面
  return currentRoute?.runtimeType != page.runtimeType;
}
}
