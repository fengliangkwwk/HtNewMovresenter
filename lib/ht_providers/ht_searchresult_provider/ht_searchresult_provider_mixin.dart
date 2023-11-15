import 'package:ht_new_movpresenter/ht_providers/ht_searchresult_provider/ht_searchresult_provider_base.dart';

mixin HTSearchResultProviderMiXin on HTSearchResultProviderBase{
  /**
   * v_type:固定传 0
   * page_size：每页数量  24
   * page：页码 从 1 开始
   * keyword：搜索关键字
   */
  Future <void> searchReasultRequestApi(String keyword,String page,String page_size,String v_type)async
  {

  }
}