import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:yt_ea_getx_dio_api/core/model/article.dart';
import 'package:yt_ea_getx_dio_api/core/repository/news_repo.dart';
import 'package:yt_ea_getx_dio_api/core/repository/news_repo_impl.dart';

class NewsHeadlineController extends GetxController {
  NewsRepo? _newsRepo;

  NewsHeadlineController() {
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsLine();
  }

  RxBool isLoading = false.obs;

  RxList<Article>? articles = RxList();

  loadNewsLine() async {
    showLoading();

    final result = await _newsRepo?.getNewsHeadline();

    hideLoading();

    if (result != null) {
      articles = result.obs;
    } else {
      print('No data recieved');
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
