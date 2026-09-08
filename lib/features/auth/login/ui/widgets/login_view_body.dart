import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_shop/core/helpers/spacing.dart';
import 'package:mini_shop/core/theme/app_styles.dart';
import 'package:mini_shop/core/widgets/app_elevated_button.dart';
import 'package:mini_shop/core/widgets/app_text_form_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
                                                                 
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Login to your account',
              style: AppStyles.readexPro32Weight600,
            ),
            verticalSpace(8),
            Text(
              'It’s great to see you again.',
              style: AppStyles.readexPro16Weight400,
            ),
            verticalSpace(24),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Email',
                  style: TextStyle(fontSize: 16.sp, fontWeight: .w600),
                ),
                verticalSpace(4),
                AppTextFormField(
                  hintText: 'Enter your email address',
                  controller: _emailController,
                ),
                verticalSpace(16),
                Text(
                  'Password',
                  style: TextStyle(fontSize: 16.sp, fontWeight: .w600),
                ),
                verticalSpace(4),
                AppTextFormField(
                  isPassword: true,
                  hintText: 'Enter your password',
                  controller: _passwordController,
                ),
                verticalSpace(55),
                AppElevatedButton(btnText: 'Sign In', onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
