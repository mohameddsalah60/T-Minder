import 'dart:developer';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'scan_barcode_state.dart';

class ScanBarcodeCubit extends Cubit<ScanBarcodeState> {
  ScanBarcodeCubit() : super(ScanBarcodeInitial());
  String? barcode;

  Future<void> scanBarcode() async {
    try {
      final scannedResult = await BarcodeScanner.scan();

      if (scannedResult.rawContent.isNotEmpty) {
        barcode = scannedResult.rawContent;

        log('Scanned barcode: $barcode');
        emit(ScanBarcodeSuccess());
      }
    } catch (e) {
      log(e.toString());
      emit(ScanBarcodefailure(error: e.toString()));
    }
  }
}
