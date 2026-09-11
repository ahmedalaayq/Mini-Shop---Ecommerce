import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_shop/core/assets_manager/assets_manager.dart';
import 'package:mini_shop/core/extensions/app_sizes_extension.dart';
import 'package:mini_shop/core/theme/app_styles.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE6E6E6)),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _NavigationItem(
                  unSelectedIcon: AssetsManager.svgsHomeIcon,
                  selectedIcon: AssetsManager.svgsHomeIcon,
                  label: 'Home',
                  isSelected: currentIndex == 0,
                  onTap: () => onItemSelected(0),
                ),

                SizedBox(width: 28.w),

                _NavigationItem(
                  unSelectedIcon: AssetsManager.svgsFavoriteIcon,
                  selectedIcon: AssetsManager.svgsFavoriteIcon,
                  label: 'Favorite',
                  isSelected: currentIndex == 1,
                  onTap: () => onItemSelected(1),
                ),

                SizedBox(width: 28.w),

                _NavigationItem(
                  unSelectedIcon: AssetsManager.svgsCartIcon,
                  selectedIcon: AssetsManager.svgsCartIcon,
                  label: 'Cart',
                  isSelected: currentIndex == 2,
                  onTap: () => onItemSelected(2),
                ),

                SizedBox(width: 28.w),

                _NavigationItem(
                  unSelectedIcon: AssetsManager.svgsAccountIcon,
                  selectedIcon: AssetsManager.svgsAccountIcon,
                  label: 'Account',
                  isSelected: currentIndex == 3,
                  onTap: () => onItemSelected(3),
                ),
              ],
            ),
          ),

          // iOS Home Indicator
          SizedBox(
            height: 27.h,
            child: Center(
              child: Container(
                width: 134.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF191919),
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  const _NavigationItem({
    required this.unSelectedIcon,
    required this.selectedIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String unSelectedIcon;
  final String selectedIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color color = isSelected
        ? const Color(0xFF3669C9)
        : const Color(0xFF999999);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 50.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              isSelected ? selectedIcon : unSelectedIcon,
              width: 20.w,
              height: 20.h,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            SizedBox(height: 2.h),
            Text(label, style: AppStyles.readexPro12Weight500(color)),
          ],
        ),
      ),
    );
  }
}
