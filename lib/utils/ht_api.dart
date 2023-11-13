///   @ProjectName : ht_new_movpresenter
///   @Author : feng liang
///   @Date   : 2023-11-10 09:15:37
///   @Desc   : api接口

import 'package:ht_new_movpresenter/utils/url_domain.dart';
class Global{


  ///未登录
  static const unLoginWebUrl = 'https://www.h5login.work';
  ///登录
  static const loginWebUrl = 'https://www.h5login.work/user';




// class Api {
  static const portNO = ':4523/';
  static const midStr = 'm1/1583329-0-default/';
  static const lastStr = '/';
  ///318邀请码
  static const invitationCode =  HTReqestDomainClass.htRequestDomain  + '318' + lastStr;
  ///获取分享链接
  static const getShareUrl =  HTReqestDomainClass.htRequestDomain + portNO + '78' + lastStr;
  ///获取广告配置及冷却时间
  static const advertisingConfigurationUrl =  HTReqestDomainClass.htRequestDomain + portNO + '84' + lastStr;
  ///意见反馈
  static const feedbackUrl =  HTReqestDomainClass.htRequestDomain + portNO + '5' + lastStr;
  ///影视首页
  static const homePageUrl =  HTReqestDomainClass.htRequestDomain + '250' + lastStr;
  ///专题seeAll
  static const loginUrl =  HTReqestDomainClass.htRequestDomain + portNO + '253' + lastStr;
  ///瀑布流无限下拉
  static const droppingWaterfallFlowUrl =  HTReqestDomainClass.htRequestDomain + portNO + '156' + lastStr + '?apifoxApiId=40055877';
  ///九宫格下More
  static const homeMoreUrl =  HTReqestDomainClass.htRequestDomain + portNO + '358' + lastStr;
  ///首页tab切换featured
  static const homeFeaturedUrl =  HTReqestDomainClass.htRequestDomain + portNO + '252' + lastStr;
  ///首页tab切换TVshows
  static const homeTvshowsUrl =  HTReqestDomainClass.htRequestDomain + portNO + '246' + lastStr;
  ///首页tab切换featured
  static const homeTylerPerryUrl =  HTReqestDomainClass.htRequestDomain + portNO + '249' + lastStr;
  ///搜索页搜索
  static const searchUrl =  HTReqestDomainClass.htRequestDomain + portNO + '148' + lastStr;
  ///搜索中间页
  static const midSearchUrl =  HTReqestDomainClass.htRequestDomain + portNO + '219' + lastStr;
  ///登录注册
  static const loginRegisterUrl =  HTReqestDomainClass.htRequestDomain + portNO + '286' + lastStr;
  ///退出登录
  static const loginOutUrl =  HTReqestDomainClass.htRequestDomain + portNO + '28' + lastStr;
  ///获取用户信息/自动登录
  static const getInfoOrLogin =  HTReqestDomainClass.htRequestDomain + portNO + '115' + lastStr;
  ///更新用户信息
  static const updateInfoUrl =  HTReqestDomainClass.htRequestDomain + portNO + '116' + lastStr;
  ///注册/忘记密码---邮箱
  static const forgetPWEmailUrl =  HTReqestDomainClass.htRequestDomain + portNO + '285' + lastStr;
  ///注册/忘记密码---手机号
  static const forgetPWPhonelUrl =  HTReqestDomainClass.htRequestDomain + portNO + '334' + lastStr;
  ///获取手机号国家码列表
  static const getPhoneCountryCodeUrl =  HTReqestDomainClass.htRequestDomain + portNO + '333' + lastStr;
  ///重置密码
  static const resetPWUrl =  HTReqestDomainClass.htRequestDomain + portNO + '324' + lastStr;
  ///订阅
  ///购买绑定接口
  static const purchaseBindingUrl =  HTReqestDomainClass.htRequestDomain + portNO + '325' + lastStr;
  ///restore验证接口
  static const restoreUrl =  HTReqestDomainClass.htRequestDomain + portNO + '325' + lastStr;
  ///订阅引导等相关配置
  static const subscriptionBootConfigurationUrl =  HTReqestDomainClass.htRequestDomain + portNO + '300' + lastStr;
  ///添加家庭成员接口
  static const addFamilyMembersUrl =  HTReqestDomainClass.htRequestDomain + portNO + '282' + lastStr;
  ///删除/退出家庭成员
  static const deleteExitFamilyMemberUrl =  HTReqestDomainClass.htRequestDomain + portNO + '283' + lastStr;
  ///家庭成员列表
  static const familyMemberListUrl =  HTReqestDomainClass.htRequestDomain + portNO + '284' + lastStr;
  ///解散家庭
  static const dissolveFamilyUrl =  HTReqestDomainClass.htRequestDomain + portNO + '327' + lastStr;

  ///播放页
  ///电影链接及相关影视
  static const movieLinksAndMoviesUrl =  HTReqestDomainClass.htRequestDomain + portNO + '144' + lastStr;
  ///进入电视剧播放页——剧集列表
  static const tvPlayUrl =  HTReqestDomainClass.htRequestDomain + portNO + '202' + lastStr;
  ///电视剧播放页——季获取集列表（切季）
  static const switchingSeasonsUrl =  HTReqestDomainClass.htRequestDomain + portNO + '203' + lastStr;
  ///电视剧链接
  static const tvLinkUrl =  HTReqestDomainClass.htRequestDomain + portNO + '151' + lastStr;
  ///影视字幕
  static const filmAndTelevisionSubtitlesUrl =  HTReqestDomainClass.htRequestDomain + portNO + '163' + lastStr;
}

