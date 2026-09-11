import 'package:mini_shop/features/home/data/models/product_model.dart';

// part 'category.g.dart';

// @JsonSerializable()
class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
  });
  final int id;
  final String name;
  final String slug;
  final String? image;
  final DateTime creationAt;
  final DateTime updatedAt;
  final ProductCategoryEnum category;

  // factory CategoryModel.fromJson(Map<String, dynamic> json) =>
  //     _$CategoryModelFromJson(json);

  // Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  static final List<CategoryModel> categories = [
    CategoryModel(
      id: 1,
      name: "Men's Clothing",
      slug: 'mens-clothing',
      image: 'https://i.imgur.com/QkIa5tT.jpeg',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
      category: .mensClothing,
    ),
    CategoryModel(
      id: 2,
      name: 'Jewelry',
      slug: 'jewelry',
      image: 'https://i.imgur.com/BG8J0Fj.jpg',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
      category: .jewelery,
    ),
    CategoryModel(
      id: 3,
      name: 'Electronics',
      slug: 'electronics',
      image: 'https://i.imgur.com/ZANVnHE.jpeg',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
      category: .electronics,
    ),
    CategoryModel(
      id: 4,
      name: "Women's Clothing",
      slug: 'womens-clothing',
      image: 'https://i.imgur.com/qNOjJje.jpeg',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
      category: .womensClothing,
    ),
  ];
}
