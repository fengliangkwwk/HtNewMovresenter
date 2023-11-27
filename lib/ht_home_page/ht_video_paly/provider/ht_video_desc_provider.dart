import 'package:fijkplayer/fijkplayer.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_data_prvider_mixin.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider_base.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider_mixin.dart';

class HTVideoDescProvider extends HTVideoDescProviderBase
    with HTVideoProviderMixin, HTVideoDescDataProviderMixin {
  /// mType2:tt_mflx:电视剧   myfx:电影
  /// id:传的视频id
  Future<void> loadData(String mType2, String id) async {
    await apiRequest(mType2, id);
    initData();
  }

  void initData() {
    // player.setDataSource(
    //   'https://sample-videos.com/video123/flv/240/big_buck_bunny_240p_10mb.flv',
    //   autoPlay: true,
    // );

    player.setDataSource(
      // 'https://sample-videos.com/video123/flv/240/big_buck_bunny_240p_10mb.flv',
      videoDescBean?.data?.hd?.link ?? 'https://sample-videos.com/video123/flv/240/big_buck_bunny_240p_10mb.flv',
      autoPlay: true,
    );
    // playerOption();
  }

  void allEpisodesEvent() {
    print('点击了大块头点击了大块头');
    isAllEpisodes = !isAllEpisodes;
    notifyListeners();
  }

void moreInfoEvent() {
  htVarInfoShown = !htVarInfoShown;
    notifyListeners();
}

}
