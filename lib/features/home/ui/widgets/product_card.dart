import 'package:flutter/material.dart';
import 'package:mini_shop/core/assets_manager/assets_manager.dart';
import 'package:mini_shop/core/extensions/app_sizes_extension.dart';
import 'package:mini_shop/core/theme/app_colors.dart';

import 'add_button.dart';
import 'favorite_button.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFFEDEDED)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 12.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16.r),
                        ),
                        child: ColoredBox(
                          color: const Color(0xFFF7F7F7),
                          child: Padding(
                            padding: EdgeInsets.all(16.r),
                            child: Image.asset(
                              AssetsManager.imagesShoesDummy,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 10.h,
                      right: 10.w,
                      child: FavoriteButton(onTap: () {}),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(12.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shoes',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF777777),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '\$ 1,190',
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 8.w),

                    AddButton(onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
