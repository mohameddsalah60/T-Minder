part of 'delete_products_cubit.dart';

sealed class DeleteProductsState {}

final class DeleteProductsInitial extends DeleteProductsState {}

final class DeleteProductSuccses extends DeleteProductsState {}

final class DeleteProductFailure extends DeleteProductsState {
  final String message;

  DeleteProductFailure({required this.message});
}
