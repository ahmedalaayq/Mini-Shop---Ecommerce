import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_shop/features/home/data/models/category_model.dart';
import 'package:mini_shop/features/home/data/repos/home_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final HomeRepo _homeRepo;
  CategoryCubit({required this._homeRepo}) : super(CategoryInitial()){
    getAllCategories();
  }

  Future<void> getAllCategories() async {
    emit(CategoryLoading());
    final result = await _homeRepo.getAllCategories();
    result.fold(
      (left) {
        emit(CategoryFailure(errorMessage: left.message));
      },
      (success) {
        emit(CategoryLoaded(categories: success));
      },
    );
  }
}
