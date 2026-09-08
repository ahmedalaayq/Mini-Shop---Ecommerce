import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_shop/core/theme/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.btnText,
    required this.onPressed,
    this.bgColor,
    this.foregroundColor,
    this.borderRadius,
  });
  final String btnText;
  final VoidCallback onPressed;
  final Color? bgColor, foregroundColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? AppColors.primaryBlue,
        foregroundColor: foregroundColor ?? Colors.white,
        minimumSize: Size.fromHeight(50.h),
        shape: RoundedRectangleBorder(
          borderRadius: .circular(borderRadius ?? 10.r),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        btnText,
        style: TextStyle(color: Colors.white, fontSize: 14.sp),
      ),
    );
  }
}
