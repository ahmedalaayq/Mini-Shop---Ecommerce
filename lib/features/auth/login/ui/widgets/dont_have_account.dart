import 'package:flutter/material.dart';
import 'package:mini_shop/core/extensions/app_sizes_extension.dart';
import 'package:mini_shop/core/theme/app_colors.dart';
import 'package:mini_shop/core/theme/app_styles.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.onJoinTap,
    required this.text,
    required this.text2,
  });

  final VoidCallback onJoinTap;
  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '$text ', style: AppStyles.readexPro16),
            WidgetSpan(
              child: GestureDetector(
                onTap: onJoinTap,
                child: Text(
                  text2,
                  style: AppStyles.readexPro16.copyWith(
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
