import 'package:mini_shop/features/home/data/models/category.dart';

abstract class HomeDataSource {
  Future<List<CategoryModel>> getAllCategories();
}
