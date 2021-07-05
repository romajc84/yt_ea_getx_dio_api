import 'package:dio/dio.dart';
import 'package:yt_ea_getx_dio_api/service/http_service.dart';

const BASE_URL = 'https://newsapi.org/';
const API_KEY = 'abc9ce20efb24230b95b4cbb255fc71a';

class HttpServiceImpl implements HttpService {
  // var _dio = Dio();
  late Dio _dio;

  @override
  Future<Response> getRequest(String url) async {
    Response response;

    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, errorInterceptorHandler) {
          print(error.message);
        },
        onRequest: (request, requestInterceptorHandler) {
          print('${request.method} | ${request.path}');
        },
        onResponse: (response, responseInterceptorHandler) {
          print(
              '${response.statusCode} | ${response.statusMessage} | ${response.data}');
        },
      ),
    );
  }

  @override
  void init() {
    _dio = Dio(
      BaseOptions(
          baseUrl: BASE_URL, headers: {'Authorization': 'Bearer $API_KEY'}),
    );

    initializeInterceptors();
  }
}
