import 'package:flutter/material.dart';
import 'package:mini_shop/core/extensions/app_sizes_extension.dart';
import 'package:mini_shop/core/helpers/spacing.dart';
import 'package:mini_shop/core/theme/app_styles.dart';
import 'package:mini_shop/core/widgets/app_elevated_button.dart';
import 'package:mini_shop/core/widgets/app_text_form_field.dart';
import 'package:mini_shop/features/auth/signup/ui/widgets/password_strength.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final ValueNotifier<String> _passwordNotifier = ValueNotifier('');
  final ValueNotifier<String> _confirmPasswordNotifier = ValueNotifier('');

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      _passwordNotifier.value = _passwordController.text;
    });

    _confirmPasswordController.addListener(() {
      _confirmPasswordNotifier.value = _confirmPasswordController.text;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    _passwordNotifier.dispose();
    _confirmPasswordNotifier.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text('Create an account', style: AppStyles.readexPro32WeightBold),
            verticalSpace(4),
            Text('Let’s create your account.', style: AppStyles.readexPro16),
            verticalSpace(24),

            Text(
              'Full Name',
              style: TextStyle(fontSize: 16.sp, fontWeight: .w600),
            ),
            verticalSpace(4),
            AppTextFormField(
              hintText: 'Enter your full name',
              controller: _nameController,
            ),

            verticalSpace(16),

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

            verticalSpace(24),

            Text(
              'Confirm Password',
              style: TextStyle(fontSize: 16.sp, fontWeight: .w600),
            ),
            verticalSpace(4),
            AppTextFormField(
              isPassword: true,
              hintText: 'Enter your confirm password',
              controller: _confirmPasswordController,
            ),

            verticalSpace(24),

            ValueListenableBuilder<String>(
              valueListenable: _passwordNotifier,
              builder: (context, password, _) {
                return ValueListenableBuilder<String>(
                  valueListenable: _confirmPasswordNotifier,
                  builder: (context, confirmPassword, _) {
                    return PasswordStrengthWidget(
                      password: password.trim(),
                      confirmPassword: confirmPassword.trim(),
                    );
                  },
                );
              },
            ),

            verticalSpace(55),

            AppElevatedButton(btnText: 'Create Account', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
