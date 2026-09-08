import 'package:dio/dio.dart';

import '../errors/app_exceptions.dart';

class ApiErrorHandler {
  static Exception handle(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerException(message: 'Connection timeout');

      case DioExceptionType.sendTimeout:
        return const ServerException(message: 'Send timeout');

      case DioExceptionType.receiveTimeout:
        return const ServerException(message: 'Receive timeout');

      case DioExceptionType.connectionError:
        return const ServerException(message: 'No internet connection');

      case DioExceptionType.badCertificate:
        return const ServerException(message: 'Bad certificate');

      case DioExceptionType.cancel:
        return const ServerException(message: 'Request was cancelled');

      case DioExceptionType.badResponse:
        return ServerException(
          message: _handleStatusCode(exception.response?.statusCode),
        );

      case DioExceptionType.unknown:
        return const ServerException(message: 'Something went wrong');
      case DioExceptionType.transformTimeout:
        return const ServerException(message: 'Something went wrong');
    }
  }

  static String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';

      case 401:
        return 'Unauthorized';

      case 403:
        return 'Forbidden';

      case 404:
        return 'Resource not found';

      case 409:
        return 'Conflict';

      case 422:
        return 'Validation error';

      case 429:
        return 'Too many requests';

      case 500:
        return 'Internal server error';

      case 502:
        return 'Bad gateway';

      case 503:
        return 'Service unavailable';

      case 504:
        return 'Gateway timeout';

      default:
        return 'Something went wrong';
    }
  }
}
