import 'package:dio/dio.dart';
import 'package:mini_shop/core/networking/session_manager.dart';

class AuthInterceptor extends Interceptor {
  final SessionManager sessionManager;

  new({required this.sessionManager});
  @override
  void onRequest(
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
}
