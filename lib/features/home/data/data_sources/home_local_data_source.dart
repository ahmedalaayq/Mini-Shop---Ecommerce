import 'package:mini_shop/features/home/data/data_sources/home_data_source.dart';
import 'package:mini_shop/features/home/data/models/category.dart';

class HomeLocalDataSource implements HomeDataSource {
  final List<CategoryModel> categories = [
    CategoryModel(
      id: 1,
      name: 'Clothes',
      slug: 'clothes',
      image: 'https://i.imgur.com/QkIa5tT.jpeg',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    CategoryModel(
      id: 2,
      name: 'Shoes',
      slug: 'shoes',
      image: 'https://i.imgur.com/qNOjJje.jpeg',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    CategoryModel(
      id: 3,
      name: 'Accessories',
      slug: 'accessories',
      image: 'https://i.imgur.com/BG8J0Fj.jpg',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    CategoryModel(
      id: 4,
      name: 'Electronics',
      slug: 'electronics',
      image: 'https://i.imgur.com/ZANVnHE.jpeg',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    CategoryModel(
      id: 5,
      name: 'Furniture',
      slug: 'furniture',
      image: 'https://i.imgur.com/Qphac99.jpeg',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    CategoryModel(
      id: 6,
      name: 'Beauty',
      slug: 'beauty',
      image: 'https://placehold.co/600x400',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    CategoryModel(
      id: 7,
      name: 'Sports',
      slug: 'sports',
      image: 'https://placehold.co/600x400',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    CategoryModel(
      id: 8,
      name: 'Watches',
      slug: 'watches',
      image: 'https://placehold.co/600x400',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    CategoryModel(
      id: 9,
      name: 'Jewelry',
      slug: 'jewelry',
      image: 'https://placehold.co/600x400',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    CategoryModel(
      id: 10,
      name: 'Bags',
      slug: 'bags',
      image: 'https://placehold.co/600x400',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    CategoryModel(
      id: 11,
      name: 'Gaming',
      slug: 'gaming',
      image: 'https://placehold.co/600x400',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    CategoryModel(
      id: 12,
      name: 'Cameras',
      slug: 'cameras',
      image: 'https://placehold.co/600x400',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      await Future.delayed(const Duration(milliseconds: 700));
      return categories;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
