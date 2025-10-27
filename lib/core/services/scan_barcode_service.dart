import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/services.dart';
import 'package:tmart_expiry_date/core/errors/custom_exception.dart';

class ScanBarcodeService {
  Future<String> scanBarcode() async {
    try {
      var barcode = await BarcodeScanner.scan();
      if (barcode.rawContent.contains(RegExp(r'[A-Z]'))) {
        throw CustomException(
          message: 'الرجاء ادخال بار كود صحيح',
        );
      } else if (barcode.rawContent == '') {
        throw CustomException(
          message: 'الرجاء عمل سكان لـ بار كود',
        );
      } else {
        return barcode.rawContent;
      }
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        throw CustomException(
          message: 'الرجاء الموافقة علي الصلاحيات',
        );
      } else {
        throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة أخرى.',
        );
      }
    } catch (e) {
      throw CustomException(
        message: 'الرجاء المحاولة مرة أخرى.',
      );
    }
  }
}
