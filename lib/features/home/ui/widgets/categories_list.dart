import 'package:flutter/material.dart';
import 'package:mini_shop/core/extensions/app_sizes_extension.dart';
import 'package:mini_shop/core/theme/app_colors.dart';
import 'package:mini_shop/core/theme/app_styles.dart';

class CatgoriesList extends StatefulWidget {
  const CatgoriesList({super.key});

  @override
  State<CatgoriesList> createState() => _CatgoriesListState();
}

class _CatgoriesListState extends State<CatgoriesList> {
  final List<String> categories = ['All', 'Tshirt', 'Jeans', 'Shoes'];

  final ValueNotifier<int> currentCategory = ValueNotifier(0);

  @override
  void dispose() {
    currentCategory.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: .horizontal,
      child: ValueListenableBuilder(
        valueListenable: currentCategory,
        builder: (context, currentIndex, _) {
          return Row(
            children: List.generate(categories.length, (index) {
              final bool isSelected = currentIndex == index;
              final String category = categories[index];
              return GestureDetector(
                onTap: () {
                  currentCategory.value = index;
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  margin: .only(right: 16),
                  padding: .symmetric(horizontal: 20.w, vertical: 7.h),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primaryBlue : Colors.white,
                    borderRadius: .circular(10.r),
                    border: Border.all(
                      color: isSelected
                          ? Colors.white
                          : AppColors.grey.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Text(
                    category,
                    style: AppStyles.readexPro16.copyWith(
                      color: isSelected ? Colors.white : AppColors.black,
                      fontWeight: .bold,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
