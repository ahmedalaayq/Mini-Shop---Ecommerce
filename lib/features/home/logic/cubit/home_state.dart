part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeCategorySuccess extends HomeState {
  final List<CategoryModel> categories;
  const HomeCategorySuccess({required this.categories});
  @override
  List<Object> get props => [categories];
}

final class HomeSuccess extends HomeState {}

final class HomeFailure extends HomeState {
  const HomeFailure({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
