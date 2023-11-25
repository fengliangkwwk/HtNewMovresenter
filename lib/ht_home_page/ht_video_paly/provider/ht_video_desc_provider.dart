import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider_base.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/provider/ht_video_desc_provider_mixin.dart';

class HTVideoDescProvider extends HTVideoDescProviderBase
    with HTVideoProviderMixin {
  /// mType2:tt_mflx:电视剧   myfx:电影
  /// id:传的视频id
  Future<void> loadData(String mType2, String id) async {
    apiRequest(mType2, id);
  }

  void allEpisodesEvent() {
    print('点击了大块头点击了大块头');
    isAllEpisodes = !isAllEpisodes;
    notifyListeners();
  }
}
