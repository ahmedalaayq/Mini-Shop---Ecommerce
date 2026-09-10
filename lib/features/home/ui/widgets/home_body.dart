import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shop/core/extensions/app_sizes_extension.dart';
import 'package:mini_shop/features/home/logic/cubit/home_cubit.dart';

import 'home_header.dart';
import 'product_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () {
        return context.read<HomeCubit>().getHomeCategories();
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
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 0.72,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ProductCard(onTap: () {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
