import 'package:dartz/dartz.dart';
import 'package:tmart_expiry_date/core/errors/failures.dart';

abstract class ProfileRepo {
  Future<Either<Failure, void>> deleteAccount();
  Future<Either<Failure, void>> logoutAccount();
}
