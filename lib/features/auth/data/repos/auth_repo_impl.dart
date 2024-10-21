import 'package:dartz/dartz.dart';
import 'package:tmart_expiry_date/core/errors/failures.dart';
import 'package:tmart_expiry_date/features/auth/domin/entites/user_entity.dart';
import 'package:tmart_expiry_date/features/auth/domin/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password) {}
}
