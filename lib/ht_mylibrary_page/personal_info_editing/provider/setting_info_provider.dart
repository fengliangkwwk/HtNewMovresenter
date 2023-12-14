import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/personal_info_editing/provider/setting_info_provider_base.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/personal_info_editing/provider/setting_info_provider_mixin.dart';
import 'package:image_picker/image_picker.dart';

class SettingInfoProvider extends SettingInfoProviderBase
    with SettingInfoProviderMixin {
  //编辑头像
  //编辑姓名
  //编辑性别
  //编辑年龄
  Future<void> commitPersonData({
    String? name,
    String? birth,
    String? gender,
    String? faceflag,
    String? face,
  }) async {
    await setPersonData(
      name: name,
      birth: birth,
      gender: gender,
      faceflag: faceflag,
      face: face,
    );
  }

  ///点击头像
  void takePhotosAction(BuildContext context) {
    _showBottomMenu(context);
  }

//弹出底部菜单
  void _showBottomMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        //isScrollControlled: true,//设为true，此时为全屏展示
        builder: (BuildContext context) {
          return Container(
            color: Colors.white,
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: const Text(
                    '拍照',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff23252a),
                    ),
                  ),
                  onTap: () {
                    // _takePhoto();
                    takePicture();///调用相机
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  height: 1,
                ),
                ListTile(
                  title: const Text(
                    '相册',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff23252a),
                    ),
                  ),
                  onTap: () {
                    // _openPhotoAlbum();
                    pickImage();///调用系统相册
                    Navigator.pop(context);
                  },
                ),
                // Container(
                //   color: Color(0xff23252a),
                //   height: 10,
                // ),
                const Divider(
                  height: 1,
                ),
                ListTile(
                  title: const Text(
                    '取消',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff23252a),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }
  // 调用系统相机
Future<void> takePicture() async {
  final image = await ImagePicker().pickImage(source: ImageSource.camera);

  if (image == null) return;

  final imageFile = File(image.path);

  // 处理图片
  // ...
}
// 调用系统相册
Future<void> pickImage() async {
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (image == null) return;

  final imageFile = File(image.path);

  // 处理图片
  // ...
}
//   ///拍照
//   Future _takePhoto() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.camera);

//     setState(() {
//       _cropImage(image);
//     });
//   }

//   ///打开相册
//   Future _openPhotoAlbum() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _cropImage(image);
//     });
//   }

// //剪裁
//   _cropImage(File imageFile) async {
//     File croppedFile = await ImageCropper.cropImage(
//       sourcePath: imageFile.path,
//       aspectRatioPresets: [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9
//       ],
//       androidUiSettings: AndroidUiSettings(
//           toolbarTitle: '剪裁图片',
//           toolbarColor: Colors.white,
//           toolbarWidgetColor: Colors.black,
//           initAspectRatio: CropAspectRatioPreset.original,
//           lockAspectRatio: false),
//       iosUiSettings: IOSUiSettings(
//         minimumAspectRatio: 1.0,
//       ),
//     );

//     if (croppedFile != null) {
//       setState(() {
//         _image = croppedFile;
//       });
//     }
//   }
}
