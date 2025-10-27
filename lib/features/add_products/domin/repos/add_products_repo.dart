import 'package:dartz/dartz.dart';
import 'package:tmart_expiry_date/core/errors/failures.dart';
import 'package:tmart_expiry_date/core/entites/products_entity.dart';

abstract class AddProductsRepo {
  Future<Either<Failure, String>> getBarcode();
  Future<Either<Failure, void>> addProductInput({
    required ProductsEntity productEntity,
  });
}
