import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_shop/core/theme/app_colors.dart';

import '../theme/app_styles.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    this.filled,
    this.fillColor,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.style,
    required this.controller,
    this.enabled,
    this.contentPadding,
    this.suffixIcon,
    this.isPassword = false, this.prefixIcon,
  });
  final String hintText;
  final bool? filled;
  final Color? fillColor;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final TextStyle? style;
  final TextEditingController controller;
  final bool? enabled;
  final EdgeInsetsGeometry? contentPadding;
  final Icon? suffixIcon;
  final bool isPassword;
  final Icon? prefixIcon;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool obscurePassword = false;
  @override
  void initState() {
    super.initState();
    obscurePassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      obscureText: obscurePassword,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      enabled: widget.enabled ?? true,
      controller: widget.controller,
      style: widget.style ?? AppStyles.readexPro16Weight400,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: (widget.isPassword
            ? IconButton(
                onPressed: () {
                  obscurePassword = !obscurePassword;
                  setState(() {});
                },
                icon: !obscurePassword == true
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : widget.suffixIcon),
        contentPadding:
            widget.contentPadding ??
            .symmetric(horizontal: 20.w, vertical: 15.h),
        isDense: true,
        hintText: widget.hintText,
        filled: widget.filled ?? true,
        fillColor: widget.fillColor ?? Colors.white,
        border: OutlineInputBorder(),

        enabledBorder: OutlineInputBorder(
          borderRadius: .circular(10.r),
          borderSide: BorderSide(color: Color(0xFFE6E6E6), width: 1.0.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: .circular(10.r),
          borderSide: BorderSide(color: AppColors.primaryBlue, width: 1.3.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: .circular(10.r),
          borderSide: BorderSide(color: Color(0xFFED1010), width: 1.0.w),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: .circular(10.r),
          borderSide: BorderSide(color: Color(0xFFED1010), width: 1.3.w),
        ),
      ),
    );
  }
}
