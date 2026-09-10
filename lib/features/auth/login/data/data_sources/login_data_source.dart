import 'package:dio/dio.dart';
import 'package:mini_shop/core/errors/app_exceptions.dart';
import 'package:mini_shop/core/networking/api_constants.dart';
import 'package:mini_shop/core/networking/api_error_handler.dart';
import 'package:mini_shop/core/networking/api_service.dart';
import 'package:mini_shop/features/auth/login/data/models/login_request_body.dart';
import 'package:mini_shop/features/auth/login/data/models/login_response_body.dart';

class LoginDataSource {
  LoginDataSource(ApiService apiService) : _apiService = apiService;

  final ApiService _apiService;

  Future<LoginResponseBody> login({required LoginRequestBody loginData}) async {
    try {
      final response = await _apiService.post(
        endPoint: ApiConstants.login,
        data: loginData.toJson(),
        requiredAuth: false,
      );

      return LoginResponseBody.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handle(e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
