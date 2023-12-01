import 'package:flutter_share/flutter_share.dart';
import 'package:ht_new_movpresenter/utils/share/ht_other_request.dart';

class HTShare extends OtherRequest {
  // HTShareBean? shareBean;
  String? shareTitle; //分享标题
  String? shareText; //分享内容
  String? shareLinkUrl; //分享链接
  String? para2; //分享链接拼接的参数 2(电影)或3(电视剧)
  String? newLinkUrl;
  //分享文字和链接
  // 相关推荐中用mType2区分类型：mflx代表电影，tt_mflx代表电视剧；
  // 锁电影弹窗判断："playLock，": "0",// 1锁电影，0不锁
  // 判断哪个页面 pageFrom ‘1’播放页 风向电视剧和电影     else其他  分享app
  Future<void> share(String mType2, String playLock, String pageFrom, String ID,
      String videoName) async {
    await shareRequest();
    //播放页面分享电影或者电视剧
    if (pageFrom == "1") {
      if (mType2 == "tt_mflx") {
        para2 = "3";
        if (playLock == "0") {
          //不锁电视剧
          shareTitle = shareBean?.tttext ?? "";
          shareText = shareBean?.tttext ?? "";
          shareLinkUrl = shareBean?.ttlink ?? "";
        } else {
          //锁电视剧
          shareTitle = shareBean?.text2 ?? "";
          shareText = shareBean?.text2 ?? "";
          shareLinkUrl = shareBean?.ttlocklink ?? "";
        }
      }else{
        para2 = "2";
        if (playLock == "0") {
          //不锁电影
          shareTitle = shareBean?.mtext ?? "";
          shareText = shareBean?.mtext ?? "";
          shareLinkUrl = shareBean?.mlink ?? "";
        } else {
          //锁电影
          shareTitle = shareBean?.text1 ?? "";
          shareText = shareBean?.text1 ?? "";
          shareLinkUrl = shareBean?.mlocklink ?? "";
        }
      }
      
      String linkVideoName = videoName.replaceAll(" ", "_");
      newLinkUrl = (shareLinkUrl ?? "") +
              "para1=" +
              ID +
              "&" +
              "para2=" +
              (para2 ?? "") +
              "&" +
              "para3=" +
              linkVideoName +
              "&" +
              "para4=" +
              "93";
      shareText = shareText?.replaceAll('xxx', videoName);
      shareTitle = shareText?.replaceAll('xxx', videoName);
    } else {
      //其他，分享app
      shareTitle = shareBean?.appmText ?? "";
      shareText = shareBean?.appmText ?? "";
      shareLinkUrl = shareBean?.appmLink ?? "";
    }
    FlutterShare.share(
      title: shareTitle ?? "",
      text: shareText,
      linkUrl: shareLinkUrl,
      // chooserTitle: 'Example Chooser Title',
    );
  }

  ///分享本地文件
  // Future<void> shareFile() async {
  //   List<dynamic> docs = await DocumentsPicker.pickDocuments;
  //   if (docs == null || docs.isEmpty) return null;

  //   await FlutterShare.shareFile(
  //     title: 'Example share',
  //     text: 'Example share text',
  //     filePath: docs[0] as String,
  //   );
  // }

// "data": {
// 3         "mtext": "Install this app, Watch and download \"xxx\" at no cost.",// 播
// 4         "mlink": "https://www.downloader.world/share/?",// 播放页-电影分享链接
// 5         "tttext": "Install this app, Watch and download \"xxx\" at no cost.",//
// 6         "ttlink": "https://www.downloader.world/share/?",// 播放页-电视剧分享链接
// 7         "text1": "Install this app, Watch and download \"xxx\" at no cost.",// 播
// 8         "mlocklink": "https://www.downloader.world/share2/?",// 播放页-电影锁电影的
// 9         "text2": "Install this app, Watch and download \"xxx\" at no cost.",// 播
// 10         "ttlocklink": "https://www.downloader.world/share2/?",// 播放页-电影锁电视
// 11         "appm_link": "https://www.downloader.world/?para2=93&",//app分享链接
// 12         "appm_text": "Thousands of movies and TV shows are here and always free.
// 13         }

// 1
// 2 标题：appm_text
// 3 链接：appm_link
// 4
// 5
// 6 域名  + "para1=" + "电影/电视剧ID" + "&" + "para2=" + "2(电影)或3(电视剧)" + "&" +  "para3=" +"电影或电视剧name(若有空格 ，替换为下划线  _ )"  + "&" + "para4=" + "93(公参 app_id)"
// 7
// 8 播放页-分享电影：标题：mtext；域名：mlink
// 9 播放页-分享电视剧：标题：tttext；域名：ttlink
// 10 锁电影弹窗-分享电影：标题：text1；域名：mlocklink
// 11 锁电影弹窗-分享电视剧：标题：text2；域名：ttlocklink
// 12 (注意：标题里的  xxx 需要替换为电影或电视剧名字)(此处名字里的空格不用替换)
}
