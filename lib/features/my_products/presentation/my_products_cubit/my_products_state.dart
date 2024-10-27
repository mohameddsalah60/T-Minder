part of 'my_products_cubit.dart';

sealed class MyProductsState {}

final class MyProductsInitial extends MyProductsState {}

final class MyProductsGetBarcodeSuccsess extends MyProductsState {
  final String barcode;

  MyProductsGetBarcodeSuccsess({required this.barcode});
}

final class MyProductsGetBarcodeFailure extends MyProductsState {
  final String message;

  MyProductsGetBarcodeFailure({required this.message});
}
