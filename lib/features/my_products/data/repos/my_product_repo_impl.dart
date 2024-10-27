import 'package:dartz/dartz.dart';
import 'package:tmart_expiry_date/core/errors/custom_exception.dart';
import 'package:tmart_expiry_date/core/errors/failures.dart';
import 'package:tmart_expiry_date/core/services/scan_barcode_service.dart';
import 'package:tmart_expiry_date/features/my_products/domin/entites/add_product_input_entity.dart';
import 'package:tmart_expiry_date/features/my_products/domin/repos/my_product_repo.dart';

class MyProductRepoImpl implements MyProductRepo {
  final ScanBarcodeService scanBarcodeService;

  MyProductRepoImpl(this.scanBarcodeService);
  @override
  Future<Either<Failure, void>> addProductInput(
      {required AddProductInputEntity productEntity}) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> getBarcode() async {
    try {
      var barcode = await scanBarcodeService.scanBarcode();
      return right(barcode);
    } on CustomException catch (e) {
      return left(AppFailures(e.message));
    }
  }
}
