import 'package:dartz/dartz.dart';
import 'package:tmart_expiry_date/core/errors/failures.dart';
import 'package:tmart_expiry_date/features/auth/domin/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
    String phone,
  );
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failure, UserEntity>> signinUserWithGoogle();
  Future<void> sendPasswordResetEmail(String email);
  Future<UserEntity> getUserData({
    required String uId,
  });
  Future addUserData({required UserEntity userEntity});
  Future selectUserZone({required String zone});
  Future saveUserData({required UserEntity userEntity});
}
