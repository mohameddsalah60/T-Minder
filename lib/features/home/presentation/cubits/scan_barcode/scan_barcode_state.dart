part of 'scan_barcode_cubit.dart';

sealed class ScanBarcodeState {}

final class ScanBarcodeInitial extends ScanBarcodeState {}

final class ScanBarcodeSuccess extends ScanBarcodeState {}

final class ScanBarcodefailure extends ScanBarcodeState {
  final String error;

  ScanBarcodefailure({required this.error});
}
