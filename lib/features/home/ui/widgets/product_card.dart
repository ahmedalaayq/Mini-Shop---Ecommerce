import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shop/core/extensions/app_sizes_extension.dart';
import 'package:mini_shop/core/theme/app_colors.dart';
import 'package:mini_shop/features/home/logic/cubit/product_cubit/product_cubit.dart';

import '../../data/models/product_model.dart';
import 'add_button.dart';
import 'favorite_button.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.onTap, required this.product});

  final VoidCallback onTap;
  final ProductModel product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  ValueNotifier<bool> isFav = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    isFav = ValueNotifier(widget.product.isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onTap,
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
                              widget.product.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),

                    ValueListenableBuilder<bool>(
                      valueListenable: isFav,
                      builder: (context, isFavorite, _) {
                        return Positioned(
                          top: 10.h,
                          right: 10.w,
                          child: FavoriteButton(
                            isFavorite: isFavorite,
                            onTap: (newFavoriteValue) {
                              isFav.value = newFavoriteValue;
                              context.read<ProductCubit>().toggleFavorite(
                                widget.product.id,
                              );
                            },
                          ),
                        );
                      },
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
                            widget.product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF777777),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '\$ ${widget.product.price}',
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
