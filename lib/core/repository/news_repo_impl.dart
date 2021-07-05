import 'package:get/get.dart';
import 'package:yt_ea_getx_dio_api/core/model/article.dart';
import 'package:yt_ea_getx_dio_api/core/model/news_response_model.dart';
import 'package:yt_ea_getx_dio_api/core/repository/news_repo.dart';
import 'package:yt_ea_getx_dio_api/service/http_service.dart';
import 'package:yt_ea_getx_dio_api/service/http_service_impl.dart';

class NewsRepoImpl implements NewsRepo {
  late HttpService _httpService;

  NewsRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  @override
  Future<List<Article>> getNewsHeadline() async {
    try {
      final response =
          await _httpService.getRequest('v2/top-headlines?country=us');

      final parsedResponse = NewsResponse.fromJson(response.data);

      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      throw UnimplementedError();
    }
  }

  @override
  Future<List<Article>> getSearchedNews(String query) async {
    try {
      final response = await _httpService.getRequest('v2/everything?q=$query');

      final parsedResponse = NewsResponse.fromJson(response.data);

      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      throw UnimplementedError();
    }
  }
}
