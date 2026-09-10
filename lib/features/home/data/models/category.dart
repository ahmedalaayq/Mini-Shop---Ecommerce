import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });
  final int id;
  final String name;
  final String slug;
  final String? image;
  final DateTime creationAt;
  final DateTime updatedAt;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

/*
 {
        "id": 1,
        "name": "Updated Category Name",
        "slug": "updated-category-name",
        "image": "https://placeimg.com/640/480/any",
        "creationAt": "2026-09-10T00:11:03.000Z",
        "updatedAt": "2026-09-10T18:01:56.000Z"
    },
 */
