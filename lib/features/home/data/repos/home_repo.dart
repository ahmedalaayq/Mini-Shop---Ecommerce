import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:mini_shop/core/errors/app_exceptions.dart';
import 'package:mini_shop/core/errors/failure.dart';

import 'package:mini_shop/features/home/data/data_sources/home_data_source.dart';
import 'package:mini_shop/features/home/data/models/category_model.dart';
import 'package:mini_shop/features/home/data/models/product_model.dart';

class HomeRepo {
  HomeRepo({
    required this.homeDataSource,
  });

  final HomeDataSource homeDataSource;

  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    try {
      final categories = await homeDataSource.getAllCategories();

      return Right(categories);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(message: e.message),
      );
    } catch (e, stackTrace) {
      log(
        'HomeRepo.getAllCategories.unknownException',
        error: e,
        stackTrace: stackTrace,
      );

      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      final products = await homeDataSource.getAllProducts();

      return Right(products);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(message: e.message),
      );
    } catch (e, stackTrace) {
      log(
        'HomeRepo.getAllProducts.unknownException',
        error: e,
        stackTrace: stackTrace,
      );

      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  Future<Either<Failure, void>> saveProducts(
    List<ProductModel> products,
  ) async {
    try {
      await homeDataSource.saveProducts(products);

      return const Right(null);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(message: e.message),
      );
    } catch (e, stackTrace) {
      log(
        'HomeRepo.saveProducts.unknownException',
        error: e,
        stackTrace: stackTrace,
      );

      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }
}
