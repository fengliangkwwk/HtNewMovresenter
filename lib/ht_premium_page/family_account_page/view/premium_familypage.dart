///家庭主账号页面
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/ht_premium_page/add_member_page/premium_family_addpage.dart';
import 'package:ht_new_movpresenter/ht_premium_page/family_account_page/bean/family_account_bean.dart';
import 'package:ht_new_movpresenter/ht_premium_page/family_account_page/provider/family_account_provider.dart';
import 'package:ht_new_movpresenter/ht_premium_page/premiun_main_page/view/premium_indexerpage.dart';
import 'package:ht_new_movpresenter/provider/main_provider.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:provider/provider.dart';

class HTClassFamilyPage extends StatefulWidget {
  const HTClassFamilyPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  State<HTClassFamilyPage> createState() => _HTClassFamilyPageState();
}

class _HTClassFamilyPageState extends State<HTClassFamilyPage> {
  FamilyAccountProvider provider = FamilyAccountProvider();
  var htVarIsEditMode = false;

  @override
  void initState() {
    super.initState();
    provider.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => provider),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color(0xff1A1C21),
          title: const Text("Family Account",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600)),
          centerTitle: true,
          leadingWidth: 24.0,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: CachedNetworkImage(
              imageUrl: ImageURL.url_291,
              width: 24.0,
              height: 24.0,
              fit: BoxFit.contain,
            ),
          ),

          ///右上角解散家庭按钮(是主账号或者主账号订阅到期才会显示)
          actions: [
            // ignore: unrelated_type_equality_checks
            (MainPovider.isVip == -1 && HTUserStore.userBean?.master == '1')
                ? GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(right: 15.0, top: 3.0),
                      child: Image.asset(
                        "assets/images/httabbar_images/icon_family_quit@3x.png",
                        width: 24.0,
                        height: 24.0,
                      ),
                    ),
                    onTap: () {
                      htMethodShowDelConfirmDialog(context);
                    },
                  )
                : Container(),
          ],
        ),
        body: provider.familyAccountBean?.data?.isEmpty == false
            ? familyListWidget()
            : noFamilyMemberWiget(),
      ),
    );
  }

  Widget familyListWidget() {
    return Selector<FamilyAccountProvider, bool>(
      selector: (p0, p1) => p1.loading,
      builder: (context, value, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: (provider.familyAccountBean?.data ?? <Data>[])
                    .map(
                      (model) => SizedBox(
                        height: 74.0,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 73.5,
                              child: Row(
                                children: [
                                  Container(width: 20.0),
                                  const CircleAvatar(
                                      radius: 25.0,
                                      backgroundColor: Color(0xffD9D9D9)),
                                  Container(width: 10.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              model.isOwnAccount() == true
                                                  ? '${model.name}(Me)'
                                                  : model.name ?? '',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.0)),
                                          Container(width: 10.0),

                                          ///订阅状态 url_341     为订阅状态   url_342
                                          Visibility(
                                            visible: model.master == 1
                                                ? true
                                                : false,
                                            child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 3.0),
                                                child: CachedNetworkImage(
                                                    imageUrl:
                                                        MainPovider.isVip() ==
                                                                -1
                                                            ? ImageURL.url_342
                                                            : ImageURL.url_341,
                                                    width: 20.0,
                                                    height: 20.0)),
                                          )
                                        ],
                                      ),
                                      Container(height: 6.0),
                                      Text(
                                          model.master == 1
                                              ? 'Organzer'
                                              : 'Member',
                                          style: const TextStyle(
                                              color: Color(0xff999999),
                                              fontSize: 14.0))
                                    ],
                                  ),
                                  const Spacer(),
                                  Visibility(
                                    visible: model.isPrimaryAccount() == true
                                        ? true
                                        : false,
                                    child: GestureDetector(
                                        child: CachedNetworkImage(
                                            imageUrl: ImageURL.url_83,
                                            width: 24.0,
                                            height: 24.0),
                                        onTap: () {
                                          provider.deleteFamilyMemberApi(
                                              model.mail ?? '');
                                        }),
                                  ),
                                  Container(width: 25.0)
                                ],
                              ),
                            ),
                            Container(
                              height: 0.5,
                              color: const Color(0x23ffffff),
                              margin: const EdgeInsets.only(left: 20.0),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              Offstage(
                  offstage: HTUserStore.userBean?.isPrimaryAccount() == true
                      ? true
                      : false,
                  child: GestureDetector(
                    onTap: () {
                      if (MainPovider.isVip() == -1) {
                        //buy
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const HTClassUnPremiumPage(
                              title: "Premium",
                            );
                          }),
                        );
                      } else {
                        //添加家庭成员
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const HTClassFamilyAddPage(
                              title: '',
                            );
                          }),
                        );
                      }
                    },
                    child: Container(
                      // color: Colors.black,
                      margin: const EdgeInsets.fromLTRB(37.7, 96.0, 37.3, 0.0),
                      height: 44.0,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.0),
                        gradient: MainPovider.isVip() == -1
                            ? const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [0.0, 1.0],
                                colors: [Color(0xffedc391), Color(0xfffdddb7)],
                              )
                            : const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [0.0, 1.0],
                                colors: [Color(0xffffffff), Color(0xffffffff)],
                              ),
                      ),
                      child: Text(
                        MainPovider.isVip() == -1
                            ? "Buy Family Plan"
                            : 'add family members(${provider.familyAccountBean?.remain})',
                        style: TextStyle(
                          color: MainPovider.isVip() == -1
                              ? const Color(0xff685034)
                              : const Color(0xff222222),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )),
              Offstage(
                offstage: HTUserStore.userBean?.isPrimaryAccount() == true
                    ? false
                    : true,
                child: GestureDetector(
                  onTap: () {
                    //退出家庭
                    provider.deleteFamilyMemberApi(
                        HTUserStore.userBean?.email ?? '');
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(37.7, 202.0, 37.3, 0.0),
                    height: 44.0,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.0),
                        color: Colors.white),
                    child: const Text(
                      "Quit Family Account",
                      style: TextStyle(
                        color: Color(0xff222222),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void htMethodShowDelConfirmDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (context1) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              height: 213.0,
              decoration: BoxDecoration(
                  color: const Color(0xff292A2F),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(20.0, 34.0, 20.0, 0),
                      child: const Text(
                          "Are you sure you want delete this \nfamily account?",
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.0))),
                  GestureDetector(
                    onTap: () {
                      provider.dissolveFamily();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 18.0),
                      height: 44.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.0),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0.0, 1.0],
                              colors: [Color(0xfff27f7f), Color(0xffd93b3a)])),
                      child: const Text(
                        "Delete",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context1),
                    child: const Text("Cancel",
                        style: TextStyle(
                            color: Color(0xff999999),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline)),
                  ),
                ],
              ),
            ),
          );
        });
  }

  ///没有家庭计划时的空页面。
  Widget noFamilyMemberWiget() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 63, right: 63, top: 49),
          child: const Text(
            "you have not purchased or joined any family plan",
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.5,
              fontSize: 13,
              color: Color(0xff999999),
              // fontWeight: FontWeight.bold,
            ),
            maxLines: null,
            overflow: TextOverflow.visible,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 50, bottom: 20),
          width: 328,
          height: 44,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(22),
            ),
            image: DecorationImage(
              image: CachedNetworkImageProvider(ImageURL.url_264),
            ),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const HTClassUnPremiumPage(
                    title: "Premium",
                  );
                }),
              );
            },
            child: const Center(
              child: Text(
                'buy family plan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff685034),
                ),
              ),
            ),
          ),
        ),
        const Text(
          "or wait for invitation",
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.5,
            fontSize: 13,
            color: Color(0xff999999),
            // fontWeight: FontWeight.bold,
          ),
          maxLines: null,
          overflow: TextOverflow.visible,
        ),
      ],
    );
  }
}
