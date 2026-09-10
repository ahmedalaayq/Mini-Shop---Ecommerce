import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import 'spacing.dart';

class Helpers {
  static void showModernSnackBar(
    BuildContext context, {
    required String message,
    IconData icon = Icons.error_outline_rounded,
    bool isError = false,
  }) {
    final messenger = ScaffoldMessenger.of(context);

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          duration: const Duration(seconds: 3),
          content: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: isError ? Color(0xFFED1010) : AppColors.primaryBlue,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: isError
                      ? Color(0xFFED1010).withValues(alpha: 0.25)
                      : AppColors.primaryBlue.withValues(alpha: 0.25),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: Colors.white, size: 22.sp),
                ),

                horizontalSpace(12),

                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                horizontalSpace(8),

                GestureDetector(
                  onTap: messenger.hideCurrentSnackBar,
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.white.withValues(alpha: 0.8),
                    size: 20.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
