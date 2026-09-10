import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_shop/core/extensions/app_sizes_extension.dart';
import 'package:mini_shop/core/helpers/spacing.dart';
import 'package:mini_shop/core/theme/app_colors.dart';
import 'package:mini_shop/core/theme/app_styles.dart';
import 'package:mini_shop/core/widgets/app_text_form_field.dart';
import 'package:mini_shop/features/home/ui/widgets/categories_list.dart';

class HomeBody extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final TextEditingController _searchController = TextEditingController();
  int currentCategory = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Discover', style: AppStyles.readexPro32WeightBold),
          verticalSpace(16),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 26.w,
                    color: AppColors.grey,
                  ),
                  hintText: 'Search for clothes...',
                  controller: _searchController,
                ),
              ),
              horizontalSpace(8),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 52.h,
                  width: 52.w,
                  decoration: BoxDecoration(
                    borderRadius: .circular(10.r),
                    color: AppColors.primaryBlue,
                  ),
                  child: Center(
                    child: SvgPicture.asset('assets/svgs/filter_icon.svg'),
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(16),
          CatgoriesList(),
        ],
      ),
    );
  }
}
