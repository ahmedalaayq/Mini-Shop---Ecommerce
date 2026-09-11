part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  const CategoryLoaded({required this.categories});
  final List<CategoryModel> categories;
}

final class CategoryFailure extends CategoryState {
  const CategoryFailure({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
