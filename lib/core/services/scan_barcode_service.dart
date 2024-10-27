import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:tmart_expiry_date/core/errors/custom_exception.dart';

class ScanBarcodeService {
  Future<String> scanBarcode() async {
    var barcode = await BarcodeScanner.scan();
    if (barcode.rawContent == '' ||
        barcode.rawContent.contains(RegExp(r'[A-Z]'))) {
      throw CustomException(
        message: 'الرجاء ادخال بار كود صحيح',
      );
    } else {
      return barcode.rawContent;
    }
  }
}
