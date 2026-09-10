import 'package:dio/dio.dart';
import 'package:mini_shop/core/errors/app_exceptions.dart';
import 'package:mini_shop/core/networking/api_constants.dart';
import 'package:mini_shop/core/networking/api_error_handler.dart';
import 'package:mini_shop/core/networking/api_service.dart';
import '../models/category.dart';
import 'home_data_source.dart';

class HomeRemoteDataSource implements HomeDataSource {
  final ApiService _apiService;

  HomeRemoteDataSource({required this._apiService});
  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await _apiService.get(
        endPoint: ApiConstants.categories,
        requiredAuth: true,
      );

      final List<dynamic> categories = response.data;

      return categories
          .map(
            (category) =>
                CategoryModel.fromJson(category as Map<String, dynamic>),
          )
          .toList();
    } on DioException catch (e) {
      throw ApiErrorHandler.handle(e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
