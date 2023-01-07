import 'package:dio/dio.dart' as dio;

class DioHelper {
  static late dio.Dio _dio;

  static init() {
    _dio = dio.Dio(
      dio.BaseOptions(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        baseUrl: 'http://192.168.1.109/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<dio.Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<dio.Response> getData(
      {required String url,
      Map<String, dynamic>? queryParams,
      required String token}) async {
    _dio.options.headers["Authorization"] = "Bearer $token";
    return await _dio.get(url, queryParameters: queryParams);
  }

  static Future<dio.Response> addFavorite({
    required String token,
    required int expertId,
  }) async {
    _dio.options.headers["Authorization"] = "Bearer $token";
    return await _dio.post('favourites/$expertId');
  }

  static Future<dio.Response> deleteFavorite({
    required String token,
    required int expertId,
  }) async {
    _dio.options.headers["Authorization"] = "Bearer $token";
    return await _dio.delete('favourites/$expertId');
  }
}
