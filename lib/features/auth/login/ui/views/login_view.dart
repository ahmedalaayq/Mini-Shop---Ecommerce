import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mini_shop/core/extensions/navigation_extension.dart';
import 'package:mini_shop/core/helpers/helpers.dart';
import 'package:mini_shop/core/networking/api_service.dart';
import 'package:mini_shop/core/networking/session_manager_impl.dart';
import 'package:mini_shop/core/routing/app_routes.dart';
import 'package:mini_shop/features/auth/login/data/data_sources/login_data_source.dart';
import 'package:mini_shop/features/auth/login/data/repos/login_repo.dart';
import 'package:mini_shop/features/auth/login/logic/cubit/login_cubit.dart';

import '../widgets/dont_have_account.dart';
import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(
        loginRepo: LoginRepo(
          sessionManager: SessionManagerImpl(
            storage: const FlutterSecureStorage(),
          ),
          loginDataSource: LoginDataSource(ApiService()),
        ),
      ),
      child: Scaffold(
        body: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.pushNamed(AppRoutes.mainView);
            } else if (state is LoginFailure) {
              Helpers.showModernSnackBar(
                context,
                message: state.errorMessage,
                isError: true,
              );
            }
          },
          child: const SafeArea(child: LoginViewBody()),
        ),
        bottomNavigationBar: SafeArea(
          child: AuthFooter(
            text: 'Don’t have an account?',
            text2: 'Join',
            onJoinTap: () {
              context.pushNamed(AppRoutes.signupView);
            },
          ),
        ),
      ),
    );
  }
}
