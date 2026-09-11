import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shop/core/helpers/spacing.dart';
import 'package:mini_shop/core/theme/app_colors.dart';
import 'package:mini_shop/core/theme/app_styles.dart';
import 'package:mini_shop/features/home/data/models/product_model.dart';
import 'package:mini_shop/features/home/logic/cubit/product_cubit/product_cubit.dart';
import 'package:mini_shop/features/home/ui/widgets/product_card.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Favorites',
          style: AppStyles.readexPro28Weight600.copyWith(
            color: AppColors.primaryBlue,
          ),
        ),
        verticalSpace(12),
        BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            switch (state) {
              case ProductInitial():
              case ProductLoading():
                return const Center(child: CircularProgressIndicator());

              case ProductFailure():
                return Center(child: Text(state.errorMessage));

              case ProductLoaded():
                final List<ProductModel> favoriteProducts = state.products
                    .where((product) => product.isFavorite)
                    .toList();

                if (favoriteProducts.isEmpty) {
                  return const Center(child: Text('No favorite products yet'));
                }

                return Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.72,
                        ),
                    itemCount: favoriteProducts.length,
                    itemBuilder: (context, index) {
                      final ProductModel product = favoriteProducts[index];

                      return ProductCard(product: product, onTap: () {});
                    },
                  ),
                );
            }
          },
        ),
      ],
    );
  }
}
