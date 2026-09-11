import 'package:mini_shop/features/home/data/models/category_model.dart';
import 'package:mini_shop/features/home/data/models/product_model.dart';

abstract class HomeDataSource {
  Future<List<CategoryModel>> getAllCategories();

  Future<List<ProductModel>> getAllProducts();

  Future<void> saveProducts(List<ProductModel> products);
}