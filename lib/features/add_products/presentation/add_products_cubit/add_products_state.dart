part of 'add_products_cubit.dart';

sealed class AddProductsState {}

final class AddProductsInitial extends AddProductsState {}

final class AddProductsLoading extends AddProductsState {}

final class AddProductsSuccses extends AddProductsState {}

final class AddProductsFailure extends AddProductsState {
  final String message;

  AddProductsFailure({required this.message});
}

final class GetBarcodeSuccsess extends AddProductsState {
  final String barcode;

  GetBarcodeSuccsess({required this.barcode});
}

final class GetBarcodeFailure extends AddProductsState {
  final String message;

  GetBarcodeFailure({required this.message});
}
