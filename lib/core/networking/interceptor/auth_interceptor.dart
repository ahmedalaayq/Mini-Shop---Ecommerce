import 'package:dio/dio.dart';
import 'package:mini_shop/core/networking/session_manager.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final SessionManager sessionManager;

  AuthInterceptor({required this.dio, required this.sessionManager});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final requiredAuth = options.extra['requiredAuth'] ?? true;
    if (requiredAuth) {
      final String? accessToken = await sessionManager.getAccessToken();
      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    if (error.response?.statusCode != 401) {
      handler.next(error);
      return;
    }

    final responseData = error.response?.data;

    final String? message = responseData is Map<String, dynamic>
        ? responseData['message'] as String?
        : null;

    if (message != 'Access token expired') {
      handler.next(error);
      return;
    }

    final String? refreshToken = await sessionManager.getRefreshToken();

    if (refreshToken == null || refreshToken.isEmpty) {
      await sessionManager.clearSession();
      handler.next(error);
      return;
    }

    try {
      final Response refreshResponse = await dio.post(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
        options: Options(extra: {'isLoggedIn': false}),
      );

      final data = refreshResponse.data as Map<String, dynamic>;

      final String newAccessToken = data['access_token'] as String;

      final String newRefreshToken = data['refresh_token'] as String;

      await sessionManager.saveSession(
        accessToken: newAccessToken,
        refreshToken: newRefreshToken,
      );

      final RequestOptions originalRequest = error.requestOptions;

      originalRequest.headers['Authorization'] = 'Bearer $newAccessToken';

      final Response retryResponse = await dio.fetch(originalRequest);

      handler.resolve(retryResponse);
    } catch (_) {
      await sessionManager.clearSession();

      handler.next(error);
    }
  }
}
