import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_shop/features/auth/login/data/models/login_request_body.dart';
import 'package:mini_shop/features/auth/login/data/models/login_response_body.dart';
import 'package:mini_shop/features/auth/login/data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this._loginRepo}) : super(LoginInitial());

  final LoginRepo _loginRepo;

  Future<void> login(LoginRequestBody loginData) async {
    emit(LoginLoading());
    final response = await _loginRepo.login(loginData: loginData);
    response.fold(
      (left) {
        emit(LoginFailure(errorMessage: left.message));
      },
      (success) {
        emit(LoginSuccess(loginResponseBody: success));
      },
    );
  }
}
