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

