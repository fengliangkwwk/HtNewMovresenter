import 'package:device_information/device_information.dart';

class GetDeviceInfo {
  ///获取当前设备号
  static String deviceNo(){
    return DeviceInformation.deviceIMEINumber.toString();
  }
}
