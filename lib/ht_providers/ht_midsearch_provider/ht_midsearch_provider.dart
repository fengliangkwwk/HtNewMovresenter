import 'package:ht_new_movpresenter/ht_providers/ht_midsearch_provider/ht_midsearch_provider_base.dart';
import 'package:ht_new_movpresenter/ht_providers/ht_midsearch_provider/ht_midsearch_provider_mixin.dart';

class HTMidSearchProvider extends HTMidSearchProviderBase with HTMidSearchProviderMiXin{
/**
 * type  5.All; 1.Movies; 2.TV Shows; 3.Animated Series; 4.Animation Movies
 */
var type = '5';
Future<void> loadData () async{
apiRequest(type);
}

}