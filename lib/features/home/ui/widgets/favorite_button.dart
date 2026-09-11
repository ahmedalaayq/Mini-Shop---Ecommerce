import 'package:flutter/material.dart';
import 'package:mini_shop/core/extensions/app_sizes_extension.dart';
import 'package:mini_shop/core/theme/app_colors.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.onTap,
    required this.isFavorite,
  });

  final Function(bool) onTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      child: InkWell(
        onTap: () => onTap(!isFavorite),
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 34.w,
          height: 34.h,
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
            size: 19.sp,
            color: isFavorite ? AppColors.red: const Color(0xFF555555),
          ),
        ),
      ),
    );
  }
}
