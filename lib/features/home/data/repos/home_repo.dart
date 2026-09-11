import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:mini_shop/core/errors/app_exceptions.dart';
import 'package:mini_shop/core/errors/failure.dart';
import 'package:mini_shop/features/home/data/data_sources/home_data_source.dart';
import 'package:mini_shop/features/home/data/models/category.dart';

class HomeRepo {
  HomeRepo({required this.homeDataSource});

  final HomeDataSource homeDataSource;

  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    try {
      final categories = await homeDataSource.getAllCategories();

      return Right(categories);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e, stackTrace) {
      log('HomeRepo.unknownException', error: e, stackTrace: stackTrace);

      return Left(ServerFailure(message: e.toString()));
    }
  }
}
