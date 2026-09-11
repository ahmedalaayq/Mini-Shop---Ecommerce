import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shop/features/home/data/models/product_model.dart';
import 'package:mini_shop/features/home/data/repos/home_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.homeRepo}) : super(ProductInitial()) {
    getAllProducts();
  }

  final HomeRepo homeRepo;

  List<ProductModel> originalProducts = [];

  ProductCategoryEnum? selectedCategory;

  Future<void> getAllProducts() async {
    emit(ProductLoading());

    final result = await homeRepo.getAllProducts();

    result.fold(
      (failure) {
        emit(ProductFailure(errorMessage: failure.message));
      },
      (products) {
        originalProducts = products;

        emit(ProductLoaded(products: products, isFiltered: false));
      },
    );
  }

  void filterProducts(ProductCategoryEnum category) {
    selectedCategory = category;

    final filteredProducts = originalProducts
        .where((product) => product.category == category)
        .toList();

    emit(ProductLoaded(products: filteredProducts, isFiltered: true));
  }

  Future<void> toggleFavorite(int productId) async {
    final updatedProducts = originalProducts.map((product) {
      if (product.id != productId) {
        return product;
      }

      return product.copyWith(isFavorite: !product.isFavorite);
    }).toList();

    originalProducts = updatedProducts;

    // Save the complete ProductModel list.
    await homeRepo.saveProducts(updatedProducts);

    final displayedProducts = selectedCategory == null
        ? originalProducts
        : originalProducts
              .where((product) => product.category == selectedCategory)
              .toList();

    emit(
      ProductLoaded(
        products: displayedProducts,
        isFiltered: selectedCategory != null,
      ),
    );
  }
}
