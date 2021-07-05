import 'package:get/get.dart';
import 'package:yt_ea_getx_dio_api/core/repository/news_repo_impl.dart';
import 'package:yt_ea_getx_dio_api/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImpl());
    Get.put(NewsHeadlineController());
  }
}
