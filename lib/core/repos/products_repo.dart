import 'package:dartz/dartz.dart';
import 'package:tmart_expiry_date/core/entites/products_entity.dart';
import 'package:tmart_expiry_date/core/errors/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductsEntity>>> getProducts();
  Future<Either<Failure, List<ProductsEntity>>> getProductsByFilter(
      {required String filterValue, required String filter});
  int? updateDaysLeftProduct(
    ProductsEntity product,
  );

  Future<Either<Failure, void>> deleteProduct({required String barcode});
}
