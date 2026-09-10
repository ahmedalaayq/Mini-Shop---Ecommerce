import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppSizesExtension on num {
  double get w => ScreenUtil().setWidth(toDouble());

  double get h => ScreenUtil().setHeight(toDouble());

  double get sp => ScreenUtil().setSp(toDouble());

  double get r => ScreenUtil().radius(toDouble());

  static double width(double width) => ScreenUtil().setWidth(width);

  static double height(double height) => ScreenUtil().setHeight(height);

  static double fontSize(double size) => ScreenUtil().setSp(size);

  static double radius(double radius) => ScreenUtil().radius(radius);
}
