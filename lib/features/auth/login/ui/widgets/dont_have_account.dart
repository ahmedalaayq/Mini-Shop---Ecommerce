import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_shop/core/theme/app_colors.dart';
import 'package:mini_shop/core/theme/app_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key, required this.onJoinTap});

  final VoidCallback onJoinTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Don’t have an account? ',
              style: AppStyles.readexPro16Weight400,
            ),
            WidgetSpan(
              child: GestureDetector(
                onTap: onJoinTap,
                child: Text(
                  'Join',
                  style: AppStyles.readexPro16Weight400.copyWith(
                    color: AppColors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
