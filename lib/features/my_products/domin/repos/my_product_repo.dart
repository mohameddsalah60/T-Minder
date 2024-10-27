import 'package:dartz/dartz.dart';
import 'package:tmart_expiry_date/core/errors/failures.dart';
import 'package:tmart_expiry_date/features/my_products/domin/entites/add_product_input_entity.dart';

abstract class MyProductRepo {
  Future<Either<Failure, String>> getBarcode();
  Future<Either<Failure, void>> addProductInput({
    required AddProductInputEntity productEntity,
  });
}
