import 'package:flutter/material.dart';
import 'package:mini_shop/core/extensions/navigation_extension.dart';
import 'package:mini_shop/core/routing/app_routes.dart';

import '../widgets/dont_have_account.dart';
import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LoginViewBody()),
      bottomNavigationBar: SafeArea(
        child: AuthFooter(
          text: 'Don’t have an account?',
          text2: 'Join',
          onJoinTap: () {
            context.pushNamed(AppRoutes.signupView);
          },
        ),
      ),
    );
  }
}
