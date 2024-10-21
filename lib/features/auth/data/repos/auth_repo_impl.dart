import 'package:dartz/dartz.dart';
import 'package:tmart_expiry_date/core/errors/custom_exception.dart';
import 'package:tmart_expiry_date/core/errors/errors_messages.dart';
import 'package:tmart_expiry_date/core/errors/failures.dart';
import 'package:tmart_expiry_date/core/services/firebase_auth_service.dart';
import 'package:tmart_expiry_date/features/auth/data/models/user_model.dart';
import 'package:tmart_expiry_date/features/auth/domin/entites/user_entity.dart';
import 'package:tmart_expiry_date/features/auth/domin/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(ServerFailures(e.message));
    } catch (e) {
      return left(ServerFailures(ErrorsMessages.genericErrorMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(ServerFailures(e.message));
    } catch (e) {
      return left(ServerFailures(ErrorsMessages.genericErrorMessage));
    }
  }
}
