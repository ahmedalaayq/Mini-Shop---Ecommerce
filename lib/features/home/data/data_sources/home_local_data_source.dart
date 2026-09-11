import 'dart:convert';

import 'package:mini_shop/core/helpers/preference_manager.dart';
import 'package:mini_shop/features/home/data/data_sources/home_data_source.dart';
import 'package:mini_shop/features/home/data/models/category_model.dart';
import 'package:mini_shop/features/home/data/models/product_model.dart';

class HomeLocalDataSource implements HomeDataSource {
  HomeLocalDataSource();

  static const String productsCacheKey = 'products_cache';

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    await Future.delayed(const Duration(milliseconds: 700));

    return CategoryModel.categories;
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final cachedProducts = PreferenceManager.getString(productsCacheKey);

    if (cachedProducts != null) {
      final dynamic decodedProducts = jsonDecode(cachedProducts);
      final List<dynamic> productsJson = decodedProducts is List
          ? decodedProducts
          : [decodedProducts];

      return productsJson.map((productJson) {
        if (productJson is String) {
          return ProductModel.fromJson(productJson);
        }
        return ProductModel.fromMap(productJson as Map<String, dynamic>);
      }).toList();
    }

    final cachedStringList = PreferenceManager.getStringList(productsCacheKey);
    if (cachedStringList != null && cachedStringList.isNotEmpty) {
      return cachedStringList
          .map((productJson) => ProductModel.fromJson(productJson))
          .toList();
    }

    await Future.delayed(const Duration(milliseconds: 700));

    final products = ProductModel.products;

    await PreferenceManager.setString(
      productsCacheKey,
      jsonEncode(products.map((product) => product.toMap()).toList()),
    );

    return products;
  }

  @override
  Future<void> saveProducts(List<ProductModel> products) async {
    await PreferenceManager.setString(
      productsCacheKey,
      jsonEncode(products.map((product) => product.toMap()).toList()),
    );
  }
}
