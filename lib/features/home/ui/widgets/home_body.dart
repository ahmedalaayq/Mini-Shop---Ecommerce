import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mini_shop/core/extensions/app_sizes_extension.dart';
import 'package:mini_shop/core/theme/app_colors.dart';
import 'package:mini_shop/features/home/data/models/product_model.dart';
import 'package:mini_shop/features/home/logic/cubit/category_cubit/category_cubit.dart';
import 'package:mini_shop/features/home/logic/cubit/product_cubit/product_cubit.dart';

import 'home_header.dart';
import 'product_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () {
        return context.read<CategoryCubit>().getAllCategories();
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            scrolledUnderElevation: 0.0,
            backgroundColor: Colors.white,
            toolbarHeight: 190.h,
            automaticallyImplyLeading: false,
            flexibleSpace: const HomeHeader(),
          ),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              switch (state) {
                case ProductInitial():
                case ProductLoading():
                  return SliverFillRemaining(
                    child: Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: AppColors.primaryBlue,
                        size: 18.w,
                      ),
                    ),
                  );
                case ProductLoaded():
                  return SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    sliver: SliverGrid.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 0.72,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final ProductModel product = state.products[index];
                        return ProductCard(onTap: () {}, product: product);
                      },
                    ),
                  );
                case ProductFailure():
                  return SliverToBoxAdapter(child: Text(state.errorMessage));
              }
            },
          ),
        ],
      ),
    );
  }
}
