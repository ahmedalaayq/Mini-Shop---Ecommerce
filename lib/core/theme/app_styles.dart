import 'package:flutter/material.dart';
import 'package:mini_shop/core/extensions/app_sizes_extension.dart';

class AppStyles {
  static final TextStyle readexPro32WeightBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: .bold,
  );
  static final TextStyle readexPro28Weight600 = TextStyle(
    fontSize: 28.sp,
    fontWeight: .w600,
  );
  static final TextStyle readexPro16 = TextStyle(fontSize: 16.sp);
  static TextStyle readexPro12Weight500(Color color) => TextStyle(
    color: color,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );
}
