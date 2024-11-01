part of 'products_cubit.dart';

sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class NoFoundProductsState extends ProductsState {}

final class ProductsSuccses extends ProductsState {
  final List<ProductsEntity> products;

  ProductsSuccses({required this.products});
}

final class ProductsFailure extends ProductsState {
  final String message;

  ProductsFailure({required this.message});
}
