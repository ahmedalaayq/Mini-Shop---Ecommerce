import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_shop/core/routing/app_routes.dart';
import 'package:mini_shop/core/routing/router_manager.dart';
import 'package:mini_shop/core/theme/app_colors.dart';

class MiniShop extends StatelessWidget {
  const MiniShop({super.key, required this.hasSession});
  final bool hasSession;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mini Shop',
        theme: ThemeData(
          fontFamily: GoogleFonts.readexPro().fontFamily,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: AppColors.primaryBlue,
          colorScheme: .fromSeed(seedColor: AppColors.primaryBlue),
        ),
        initialRoute: hasSession ? AppRoutes.signupView : AppRoutes.loginView,
        onGenerateRoute: RoutingManager.onGenerateRoute,
      ),
    );
  }
}
