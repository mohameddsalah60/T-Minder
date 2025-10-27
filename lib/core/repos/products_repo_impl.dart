import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tmart_expiry_date/core/errors/custom_exception.dart';
import 'package:tmart_expiry_date/core/errors/errors_messages.dart';
import 'package:tmart_expiry_date/core/helper_functions/string_to_date.dart';
import 'package:tmart_expiry_date/core/models/products_model.dart';
import 'package:tmart_expiry_date/core/services/database_service.dart';

import '../entites/products_entity.dart';
import '../errors/failures.dart';
import '../helper_functions/calculate_days_left.dart';
import '../utils/backend_endpoint.dart';
import 'products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});
  @override
  Stream<Either<Failure, List<ProductsEntity>>> getProducts() async* {
    try {
      await for (var (reslut as List<Map<String, dynamic>>) in databaseService
          .getStreamData(path: BackendEndpoint.productsCollection, query: {
        'orderBy': 'daysLeft',
        'descending': false,
      })) {
        List<ProductsEntity> products = reslut.map((e) {
          e["daysLeft"] = updateDaysLeftProduct(ProductsModel.fromJson(e));
          if (e["daysLeft"] <= 0) {
            databaseService.deleteData(
              path: BackendEndpoint.productsCollection,
              uId: e["barcode"],
            );
          }
          return ProductsModel.fromJson(e);
        }).toList();

        yield right(products);
      }
    } on CustomException catch (e) {
      yield left(ServerFailures(e.message));
    } catch (e) {
      yield left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductsEntity>>> getProductsByFilter({
    required String filterValue,
    required String filter,
  }) async {
    try {
      var data = await databaseService
          .getData(path: BackendEndpoint.productsCollection, query: {
        'where': filter,
        'isEqualTo': filterValue,
        'orderBy': 'daysLeft',
        'descending': false,
      }) as List<Map<String, dynamic>>;

      List<ProductsEntity> products = data.map((e) {
        e["daysLeft"] = updateDaysLeftProduct(ProductsModel.fromJson(e));
        return ProductsModel.fromJson(e);
      }).toList();

      return right(products);
    } on CustomException catch (e) {
      return left(ServerFailures(e.message));
    } catch (e) {
      log(e.toString());
      return left(ServerFailures(ErrorsMessages.genericErrorMessage));
    }
  }

  @override
  int? updateDaysLeftProduct(
    ProductsEntity product,
  ) {
    DateTime date = stringToDate(product.exp);
    int daysLeft = calculateDaysLeft(date);
    if (daysLeft != product.daysLeft) {
      databaseService.updateData(
        path: BackendEndpoint.productsCollection,
        uId: product.barcode,
        value: {
          'daysLeft': daysLeft,
        },
      );
    }

    return daysLeft;
  }

  @override
  Future<Either<Failure, void>> deleteProduct({required String barcode}) async {
    try {
      await databaseService.deleteData(
        path: BackendEndpoint.productsCollection,
        uId: barcode,
      );
      return right(null);
    } on CustomException catch (e) {
      return left(ServerFailures(e.message));
    } catch (e) {
      log(e.toString());
      return left(ServerFailures(ErrorsMessages.genericErrorMessage));
    }
  }
}
