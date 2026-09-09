part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  @override
  List<Object> get props => [loginResponseBody];
  const LoginSuccess({required this.loginResponseBody});
  final LoginResponseBody loginResponseBody;
}

final class LoginFailure extends LoginState {
  const LoginFailure({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
