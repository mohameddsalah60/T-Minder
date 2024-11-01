import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tmart_expiry_date/core/errors/custom_exception.dart';
import 'package:tmart_expiry_date/core/errors/errors_messages.dart';
import 'package:tmart_expiry_date/core/errors/failures.dart';
import 'package:tmart_expiry_date/core/services/database_service.dart';
import 'package:tmart_expiry_date/core/services/scan_barcode_service.dart';
import 'package:tmart_expiry_date/core/models/products_model.dart';
import 'package:tmart_expiry_date/core/entites/products_entity.dart';
import 'package:tmart_expiry_date/core/utils/backend_endpoint.dart';
import 'package:tmart_expiry_date/features/add_products/domin/repos/add_products_repo.dart';

import '../../../../core/helper_functions/calculate_days_left.dart';
import '../../../../core/helper_functions/string_to_date.dart';

class AddProductsRepoImpl implements AddProductsRepo {
  final ScanBarcodeService scanBarcodeService;
  final DatabaseService databaseService;
  AddProductsRepoImpl(this.scanBarcodeService, this.databaseService);
  @override
  Future<Either<Failure, void>> addProductInput(
      {required ProductsEntity productEntity}) async {
    try {
      productEntity.daysLeft = calculateDaysLeft(
        stringToDate(productEntity.exp),
      );
      var isBarcodeExist = await databaseService.checkIfDataExists(
        path: BackendEndpoint.productsCollection,
        docId: productEntity.barcode,
      );
      if (isBarcodeExist) {
        return left(ServerFailures('هذا المنتج تمت اضافته بالفعل'));
      } else {
        await databaseService.addData(
          path: BackendEndpoint.productsCollection,
          data: ProductsModel.fromEntity(productEntity).toMap(),
          docId: productEntity.barcode,
        );
        return right(null);
      }
    } on CustomException catch (e) {
      return left(ServerFailures(e.message));
    } catch (e) {
      log(e.toString());
      return left(ServerFailures(ErrorsMessages.genericErrorMessage));
    }
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
