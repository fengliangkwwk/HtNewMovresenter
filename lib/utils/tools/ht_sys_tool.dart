import 'package:flutter/material.dart';

class SysTools {
  ///获取当前屏幕的宽高尺寸
  static Size getScreenSize(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return screenSize;
  }

  ///获取当前的时间戳(精确到毫秒 13位返回值)
  String getMilliSecondsTimeStamp() {
    DateTime now = DateTime.now();
    int timestamp = now.millisecondsSinceEpoch;
    return timestamp.toString();
  }

  ///获取当前的时间戳(精确到秒 10位返回值)
  String getSecondsTimeStamp() {
    DateTime now = DateTime.now();
    int timestamp = now.millisecondsSinceEpoch ~/ 1000; // 将13位数时间戳转换为10位数
    return timestamp.toString();
  }

  ///时间戳转时间
  String getTimeFromTimeStamp(int timestamp) {
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
}
