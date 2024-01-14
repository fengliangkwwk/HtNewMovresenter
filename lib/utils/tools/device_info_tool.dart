import 'package:device_information/device_information.dart';

class GetDeviceInfo {
  ///获取当前设备号
  static Future<String> deviceNo() {
   return DeviceInformation.deviceIMEINumber;
  }
}
