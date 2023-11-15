import 'package:ht_new_movpresenter/ht_providers/ht_searchresult_provider/ht_searchresult_provider_base.dart';
import 'package:ht_new_movpresenter/ht_providers/ht_searchresult_provider/ht_searchresult_provider_mixin.dart';

class HTSearchResultProvider extends HTSearchResultProviderBase with HTSearchResultProviderMiXin
{
  var keyword;
  var page;
  var page_size;
  var v_type;
  Future <void>loadSearchResulrData() async
  {
    searchReasultRequestApi(keyword, page, page_size, v_type);
  }
}