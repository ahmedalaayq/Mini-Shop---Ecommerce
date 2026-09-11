part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  final bool isFiltered;
  const ProductLoaded({required this.products, required this.isFiltered});
  @override
  List<Object> get props => [products,isFiltered];
}

final class ProductFailure extends ProductState {
  const ProductFailure({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
