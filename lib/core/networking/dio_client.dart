import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mini_shop/core/constants/app_constants.dart';
import 'package:mini_shop/core/networking/interceptor/auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'session_manager_impl.dart';

class DioClient {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ),
      );
    }
    dio.interceptors.add(
      AuthInterceptor(
        dio: dio,
        sessionManager: SessionManagerImpl(storage: FlutterSecureStorage()),
      ),
    );
    return dio;
  }
}
