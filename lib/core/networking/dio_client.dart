import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mini_shop/core/constants/app_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  static Dio createDio() {
    return Dio(
        BaseOptions(
          baseUrl: AppConstants.baseUrl,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
        ),
      )
      ..interceptors.add(
        kDebugMode
            ? PrettyDioLogger(
                requestBody: true,
                requestHeader: true,
                responseBody: true,
                responseHeader: true,
              )
            : InterceptorsWrapper(),
      );
  }
}
