import 'package:flutter/material.dart';

import '../widgets/dont_have_account.dart';
import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LoginViewBody()),
      bottomNavigationBar: SafeArea(child: DontHaveAccount(onJoinTap: () {})),
    );
  }
}
