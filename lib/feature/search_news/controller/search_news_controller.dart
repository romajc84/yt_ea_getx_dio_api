import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:yt_ea_getx_dio_api/core/model/article.dart';
import 'package:yt_ea_getx_dio_api/core/repository/news_repo.dart';
import 'package:yt_ea_getx_dio_api/core/repository/news_repo_impl.dart';

class SearchNewsController extends GetxController {
  NewsRepo? _newsRepo;

  SearchNewsController() {
    _newsRepo = Get.find<NewsRepoImpl>();

    searchTextController.addListener(() {
      if (searchTextController.text.length % 3 == 0 &&
          searchTextController.text.length != 0) {
        searchNewsHeadline();
      }
    });
  }

  final searchTextController = TextEditingController();

  RxBool isLoading = false.obs;

  RxList<Article>? articles = RxList();

  searchNewsHeadline() async {
    showLoading();

    final result = await _newsRepo?.getSearchedNews(searchTextController.text);

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
