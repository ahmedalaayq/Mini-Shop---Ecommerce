import 'package:dio/dio.dart';
import 'package:mini_shop/core/networking/dio_client.dart';

class ApiService {
  final Dio dio = DioClient.createDio();

  /// Get
  Future<Response<dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    bool requiredAuth = true,
  }) async {
    return dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: Options(extra: {'requiredAuth': requiredAuth}),
    );
  }

  /// Post
  Future<Response<dynamic>> post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool requiredAuth = true,
  }) async {
    return dio.post(
      endPoint,
      queryParameters: queryParameters,
      data: data,
      options: Options(extra: {'requiredAuth': requiredAuth}),
    );
  }

  /// Put
  Future<Response<dynamic>> put({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
        bool requiredAuth = true,

  }) async {
    return dio.put(endPoint, queryParameters: queryParameters, data: data,
      options: Options(extra: {'requiredAuth': requiredAuth}),
    );
  }

  /// Delete
  Future<Response<dynamic>> delete({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
        bool requiredAuth = true,

  }) async {
    return dio.delete(endPoint, queryParameters: queryParameters, data: data,
      options: Options(extra: {'requiredAuth': requiredAuth}),
    );
  }
}
