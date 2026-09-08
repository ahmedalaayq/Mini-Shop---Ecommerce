import 'package:dio/dio.dart';
import 'package:mini_shop/core/networking/dio_client.dart';

class ApiService {
  final Dio dio = DioClient.createDio();

  /// Get
  Future<Response<dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio.get(endPoint, queryParameters: queryParameters);
  }

  /// Post
  Future<Response<dynamic>> post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio.post(endPoint, queryParameters: queryParameters, data: data);
  }

  /// Put
  Future<Response<dynamic>> put({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio.put(endPoint, queryParameters: queryParameters, data: data);
  }

  /// Delete
  Future<Response<dynamic>> delete({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio.delete(endPoint, queryParameters: queryParameters, data: data);
  }
}
