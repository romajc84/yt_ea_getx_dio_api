import 'package:get/get.dart';
import 'package:yt_ea_getx_dio_api/feature/search_news/controller/search_news_controller.dart';

class SearchNewsBinding extends Bindings {
  @override
  dependencies() {
    Get.put(SearchNewsController());
  }
}
