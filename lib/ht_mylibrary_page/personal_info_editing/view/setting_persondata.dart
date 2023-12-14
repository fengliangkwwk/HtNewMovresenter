import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:get/route_manager.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/mylibrary_page/bean/user_bean.dart';
import 'package:ht_new_movpresenter/ht_mylibrary_page/personal_info_editing/provider/setting_info_provider.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_shared_keys.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:ht_new_movpresenter/utils/tools/ht_sys_tool.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HTClassPersondataPage extends StatefulWidget {
  const HTClassPersondataPage({Key? key, this.title, this.userbean})
      : super(key: key);

  final String? title;
  final UserBean? userbean;

  @override
  State<HTClassPersondataPage> createState() => _HTClassPersondataPageState();
}

class _HTClassPersondataPageState extends State<HTClassPersondataPage> {
  SettingInfoProvider provider = SettingInfoProvider();
  var htVarSelectedBirth = "";
  var htVarSelectedGender = "";
  bool _isEditName = false;
  final TextEditingController _nameEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _nameEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: const Color(0xff1A1C21),
            title: const Text("Personal Data",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600)),
            centerTitle: true,
            leadingWidth: 24.0,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: CachedNetworkImage(
                ///返回按钮
                imageUrl: ImageURL.url_291,
                width: 24.0,
                height: 24.0,
                fit: BoxFit.scaleDown,
              ),
            )),
        body: Container(
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
            width: double.infinity,
            child: Column(children: [
              Container(height: 15.0),
              GestureDetector(
                onTap: () => provider.takePhotosAction(context),
                child: Row(children: [
                  const Text("Profile image",
                      style: TextStyle(fontSize: 14.0, color: Color(0xff828386))),
                  const Spacer(),
                  Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          ///头像
                          image: const DecorationImage(
                              image:
                                  CachedNetworkImageProvider(ImageURL.url_347)),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.white))),
                ]),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 14.5, bottom: 14.5),
                  color: const Color(0xff2D2F33),
                  height: 0.5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Name",
                      style:
                          TextStyle(fontSize: 14.0, color: Color(0xff828386))),

                  ///姓名
                  Row(children: [
                    Expanded(
                      child: TextField(
                        // autofocus: true,
                        controller: _nameEditingController,
                        focusNode: _focusNode,
                        // enabled: _isEditName,
                        style: const TextStyle(
                          color: Color(0xff828386),
                          fontSize: 14.0,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              'Enter your text hereajkenkljwkelqwkl;keqwkrl;wql;r',
                          hintStyle: TextStyle(
                            color: Color(0xff828386), // 自定义占位符文本颜色
                            fontSize: 14.0, // 自定义占位符文本字体大小
                          ),
                        ),
                        onEditingComplete: () {
                           provider.commitPersonData(name: _nameEditingController.text);
                          _focusNode.unfocus();
                        },
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        _isEditName = !_isEditName;
                        setState(() {
                          if (_isEditName == true) {
                            // 手动获取焦点，弹出键盘
                            FocusScope.of(context).requestFocus(_focusNode);
                          } else {
                            _focusNode.unfocus();
                          }
                        });
                      },
                      child: CachedNetworkImage(
                          imageUrl: ImageURL.url_346,
                          width: 18.0,
                          height: 18.0),
                    ),
                  ]),
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(top: 0, bottom: 14.5),
                  color: const Color(0xff2D2F33),
                  height: 0.5),

              ///性别
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text("Gender",
                    style: TextStyle(fontSize: 14.0, color: Color(0xff828386))),
                Container(height: 15.0),
                Row(children: [
                  Text(
                      htVarSelectedGender == ""
                          ? "Tap to Edit Gender"
                          : htVarSelectedGender,
                      style: const TextStyle(
                          fontSize: 14.0, color: Color(0xff828386))),
                  const Spacer(),
                  GestureDetector(
                      child: CachedNetworkImage(
                          imageUrl: ImageURL.url_346,
                          width: 18.0,
                          height: 18.0),
                      onTap: () {
                        Pickers.showSinglePicker(context,
                            data: ['Female', 'Male'],
                            pickerStyle: PickerStyle(
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              textSize: 20.0,
                              headDecoration:
                                  const BoxDecoration(color: Colors.black),
                              title: Container(color: Colors.black),
                              commitButton: const Text("OK",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0)),
                              cancelButton: const Text("Cancel",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0)),
                            ), onConfirm: (val, index) {
                          setState(() {
                            htVarSelectedGender = val;
                          });
                        });
                      }),
                ]),
              ]),
              Container(
                  margin: const EdgeInsets.only(top: 10.5, bottom: 14.5),
                  color: const Color(0xff2D2F33),
                  height: 0.5),

              ///出生日期
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text("Date of Birth",
                    style: TextStyle(fontSize: 14.0, color: Color(0xff828386))),
                Container(height: 15.0),
                Row(children: [
                  Text(
                      htVarSelectedBirth == ""
                          ? "Tap to edit DoB"
                          : htVarSelectedBirth,
                      style: const TextStyle(
                          fontSize: 14.0, color: Color(0xff828386))),
                  const Spacer(),
                  GestureDetector(
                      child: CachedNetworkImage(
                          imageUrl: ImageURL.url_346,
                          width: 18.0,
                          height: 18.0),
                      onTap: () {
                        DatePicker.showDatePicker(context,
                            onConfirm: (dateTime, selectedIndex) {
                          setState(() {
                            htVarSelectedBirth =
                                "${dateTime.year}-${dateTime.month}-${dateTime.day}";
                          });
                        },
                            pickerTheme: const DateTimePickerTheme(
                                backgroundColor: Colors.black,
                                confirm: Text("OK",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.0)),
                                cancel: Text("Cancel",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.0)),
                                itemTextStyle: TextStyle(
                                    color: Colors.white, fontSize: 20.0)));
                      }),
                ]),
              ]),
              Container(
                  margin: const EdgeInsets.only(top: 10.5, bottom: 14.5),
                  color: const Color(0xff2D2F33),
                  height: 0.5),
              const Spacer(),
              GestureDetector(
                onTap: () async {
                  ///1.删除本地信息 2.清除数据
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.remove(HTSharedKeys.htPersonMesaage);
                  HTUserStore.userBean = null;
                  Navigator.of(context).pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 44.0,
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: const Color(0xfff4473c),
                      borderRadius: BorderRadius.circular(6.0)),
                ),
              )
            ])));
  }
}
