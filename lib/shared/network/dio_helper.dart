import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        headers: {
          'Content-Type': 'application/json',
          'Accept':'application/json'
        },
        baseUrl: 'http://192.168.1.132/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    return await dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> getData({
    required String url,
    required String token,
    required Map<String, dynamic> queryParams,
  }) async =>
      await dio.get(
        url,
        queryParameters: queryParams,
      );
}
