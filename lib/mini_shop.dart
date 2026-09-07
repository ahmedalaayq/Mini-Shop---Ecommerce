import 'package:flutter/material.dart';
import 'package:mini_shop/core/theme/app_colors.dart';

class MiniShop extends StatelessWidget {
  const MiniShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Shop',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColors.primaryBlue,
        colorScheme: .fromSeed(seedColor: AppColors.primaryBlue),
      ),
    );
  }
}
