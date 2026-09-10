import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:mini_shop/core/errors/app_exceptions.dart';
import 'package:mini_shop/core/errors/failure.dart';
import 'package:mini_shop/core/networking/session_manager.dart';
import 'package:mini_shop/features/auth/login/data/data_sources/login_data_source.dart';
import 'package:mini_shop/features/auth/login/data/models/login_request_body.dart';
import 'package:mini_shop/features/auth/login/data/models/login_response_body.dart';

class LoginRepo {
  LoginRepo({required this._sessionManager, required this._loginDataSource});
  final LoginDataSource _loginDataSource;
  final SessionManager _sessionManager;
  Future<Either<Failure, LoginResponseBody>> login({
    required LoginRequestBody loginData,
  }) async {
    try {
      final LoginResponseBody response = await _loginDataSource.login(
        loginData: loginData,
      );
      _sessionManager.saveSession(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      log('LoginRepo.final catch part: $e');
      return const Left(
        ServerFailure(message: 'Somthing wen\'t wrong. please try again.'),
      );
    }
  }
}
