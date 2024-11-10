import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tmart_expiry_date/core/errors/custom_exception.dart';
import 'package:tmart_expiry_date/core/errors/errors_messages.dart';
import 'package:tmart_expiry_date/core/errors/failures.dart';
import 'package:tmart_expiry_date/core/services/database_service.dart';
import 'package:tmart_expiry_date/core/services/scan_barcode_service.dart';
import 'package:tmart_expiry_date/core/models/products_model.dart';
import 'package:tmart_expiry_date/core/entites/products_entity.dart';
import 'package:tmart_expiry_date/core/services/workmanager_service.dart';
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
        if (productEntity.isNotification) {
          WorkmanagerService.registerProductNotifications(productEntity);
        }
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

  // void scheduleProductNotification(ProductsEntity productEntity) {
  //   final expiryDate = stringToDate(productEntity.exp);
  //   final daysLeft = calculateDaysLeft(expiryDate);

  //   // جدولة الإشعار بناءً على الأيام المتبقية
  //   if (daysLeft <= 30 && daysLeft > 7) {
  //     // إشعار قبل شهر
  //     scheduleNotification(expiryDate, 30, productEntity.barcode);
  //   } else if (daysLeft <= 7 && daysLeft > 2) {
  //     // إشعار قبل أسبوع
  //     scheduleNotification(expiryDate, 7, productEntity.barcode);
  //   } else if (daysLeft <= 2) {
  //     // إشعار كل يومين
  //     scheduleNotification(expiryDate, 2, productEntity.barcode);
  //   }
  // }

  // void scheduleNotification(
  //     DateTime expiryDate, int notificationInterval, String barcode) async {
  //   final notificationTime =
  //       expiryDate.subtract(Duration(days: notificationInterval));

  //   // جدولة الإشعار باستخدام WorkManager
  //   await Workmanager().registerOneOffTask(
  //     "background_id1",
  //     "productNotification",
  //     initialDelay: notificationTime.isBefore(DateTime.now())
  //         ? Duration.zero
  //         : notificationTime
  //             .difference(DateTime.now()), // تأخير العمل بناءً على الوقت
  //     inputData: {
  //       'expiry_date': expiryDate.toIso8601String(),
  //       'barcode': barcode,
  //     },
  //   );
  //   print('done');
  // }
}
