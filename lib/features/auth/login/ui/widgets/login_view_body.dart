import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mini_shop/core/extensions/app_sizes_extension.dart';
import 'package:mini_shop/core/helpers/spacing.dart';
import 'package:mini_shop/core/theme/app_colors.dart';
import 'package:mini_shop/core/theme/app_styles.dart';
import 'package:mini_shop/core/widgets/app_elevated_button.dart';
import 'package:mini_shop/core/widgets/app_text_form_field.dart';
import 'package:mini_shop/features/auth/login/data/models/login_request_body.dart';
import 'package:mini_shop/features/auth/login/logic/cubit/login_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = 'john@mail.com';
    _passwordController.text = 'changeme';
  }

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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Login to your account',
              style: AppStyles.readexPro32WeightBold,
            ),
            verticalSpace(4),
            Text('It’s great to see you again.', style: AppStyles.readexPro16),
            verticalSpace(24),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text('Email', style: AppStyles.readexPro16),
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
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return AppElevatedButton(
                      btnText: 'Sign In',
                      onPressed: state is LoginLoading ? null : _login,
                      child: state is LoginLoading
                          ? LoadingAnimationWidget.staggeredDotsWave(
                              color: AppColors.primaryBlue,
                              size: 20.r,
                            )
                          : null,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    context.read<LoginCubit>().login(
      LoginRequestBody(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    );
  }
}
