import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shop/features/home/data/models/category.dart';
import 'package:mini_shop/features/home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial()) {
    getHomeCategories();
  }

  final HomeRepo homeRepo;

  Future<void> getHomeCategories() async {
    emit(HomeLoading());

    final result = await homeRepo.getAllCategories();

    result.fold(
      (failure) {
        emit(HomeFailure(errorMessage: failure.message));
      },
      (categories) {
        emit(HomeCategorySuccess(categories: categories));
      },
    );
  }
}
