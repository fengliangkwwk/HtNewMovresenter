import 'package:ht_new_movpresenter/ht_home_page/ht_search/providers/ht_searchresult_provider/ht_searchresult_provider_base.dart';
import 'package:ht_new_movpresenter/ht_home_page/ht_search/providers/ht_searchresult_provider/ht_searchresult_provider_mixin.dart';

class HTSearchResultProvider extends HTSearchResultProviderBase
    with HTSearchResultProviderMiXin {
  Future<void> loadSearchResulrData(String? word) async {
    initData(word);
    searchReasultRequestApi();
  }

  void initData(String? word) {
    keyword = word;
  }

  void onLoading() {
    page++;
    searchReasultRequestApi();
  }

  void onRefresh() {
    page = 1;
    searchReasultRequestApi(isRefresh: true);
  }
}
