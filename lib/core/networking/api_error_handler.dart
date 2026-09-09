import 'package:dio/dio.dart';
import 'package:mini_shop/core/errors/app_exceptions.dart';

class ApiErrorHandler {
  static ServerException handle(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerException(
          message: 'Connection timeout. Please try again.',
        );

      case DioExceptionType.sendTimeout:
        return const ServerException(
          message: 'Request timeout. Please try again.',
        );

      case DioExceptionType.receiveTimeout:
        return const ServerException(
          message: 'Server took too long to respond. Please try again.',
        );

      case DioExceptionType.connectionError:
        return const ServerException(
          message: 'No internet connection. Please check your connection.',
        );

      case DioExceptionType.badCertificate:
        return const ServerException(
          message: 'Secure connection failed. Please try again.',
        );

      case DioExceptionType.cancel:
        return const ServerException(message: 'Request was cancelled.');

      case DioExceptionType.badResponse:
        return ServerException(
          message: _handleStatusCode(exception.response?.statusCode),
        );

      case DioExceptionType.transformTimeout:
        return const ServerException(
          message: 'Something went wrong. Please try again.',
        );

      case DioExceptionType.unknown:
        return const ServerException(
          message: 'Something went wrong. Please try again.',
        );
    }
  }

  // static String _handleResponse(Response? response) {
  //   try {
  //     if (response?.data is Map<String, dynamic>) {
  //       final error = ApiErrorModel.fromJson(
  //         response!.data as Map<String, dynamic>,
  //       );

  //       final message = error.message;

  //       if (message.trim().isNotEmpty) {
  //         return message;
  //       }
  //     }
  //   } catch (_) {}

  //   return _handleStatusCode(response?.statusCode);
  // }

  static String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'We couldn’t process your request. Please check your information and try again.';

      case 401:
        return 'Your email or password is incorrect. Please check your credentials and try again.';

      case 403:
        return 'You don’t have permission to perform this action.';

      case 404:
        return 'We couldn’t find what you’re looking for. Please try again.';

      case 409:
        return 'This information is already in use. Please use different information.';

      case 422:
        return 'Some of the information you entered is invalid. Please check your details and try again.';

      case 429:
        return 'Too many requests. Please wait a moment and try again.';

      case 500:
        return 'Something went wrong on our server. Please try again later.';

      case 502:
        return 'Our server is temporarily unavailable. Please try again later.';

      case 503:
        return 'The service is temporarily unavailable. Please try again later.';

      case 504:
        return 'The server took too long to respond. Please try again.';

      default:
        return 'Something went wrong. Please try again.';
    }
  }
}
