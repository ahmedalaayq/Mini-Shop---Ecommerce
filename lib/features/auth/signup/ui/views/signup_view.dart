import 'package:flutter/material.dart';
import 'package:mini_shop/features/auth/signup/ui/widgets/signup_view_body.dart';

import '../../../login/ui/widgets/dont_have_account.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: SignupViewBody()),

      bottomNavigationBar: SafeArea(
        child: AuthFooter(
          text: 'Already have an account?',
          text2: 'Log In',
          onJoinTap: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
