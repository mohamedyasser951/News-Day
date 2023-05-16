import 'package:dio/dio.dart';

String apiKey = "55f1a78cf8f1404389f2b8708291f14f";
//55f1a78cf8f1404389f2b8708291f14f gmail
//1bbd4e629ec9490db7c755f0ecca8954 facebook

class DioHelper {
  static String mainUrl = "https://newsapi.org/";
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(baseUrl: mainUrl, receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(
      {required String url,
      required Map<String, dynamic> queryParameters}) async {
    return await dio.get(
      url,
      queryParameters: queryParameters,
    );
  }

  
}
