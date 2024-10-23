import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tmart_expiry_date/core/errors/custom_exception.dart';
import 'package:tmart_expiry_date/core/errors/errors_messages.dart';
import 'package:tmart_expiry_date/core/errors/failures.dart';
import 'package:tmart_expiry_date/core/helper_functions/get_user.dart';
import 'package:tmart_expiry_date/core/services/database_service.dart';
import 'package:tmart_expiry_date/core/services/firebase_auth_service.dart';
import 'package:tmart_expiry_date/core/services/shared_preferences_singletone.dart';
import 'package:tmart_expiry_date/core/utils/backend_endpoint.dart';
import 'package:tmart_expiry_date/features/auth/data/models/user_model.dart';
import 'package:tmart_expiry_date/features/auth/domin/entites/user_entity.dart';
import 'package:tmart_expiry_date/features/auth/domin/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.databaseService,
    required this.firebaseAuthService,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
    String phone,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
        phone: phone,
        zone: "",
      );
      await addUserData(userEntity: userEntity);
      await saveUserData(userEntity: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailures(e.message));
    } catch (e) {
      await deleteUser(user);
      return left(ServerFailures(ErrorsMessages.genericErrorMessage));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
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
      var userEntity = await getUserData(uId: user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailures(e.message));
    } catch (e) {
      return left(ServerFailures(ErrorsMessages.genericErrorMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinUserWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signinUserWithGoogle();
      var userEntity = UserModel.fromFirebase(user!);
      var isUserExist = await databaseService.checkIfDataExists(
        path: BackendEndpoint.getUserCollection,
        docId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(userEntity: userEntity);
        await saveUserData(userEntity: userEntity);
      }
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailures(e.message));
    } catch (e) {
      await deleteUser(user);
      return left(ServerFailures(ErrorsMessages.genericErrorMessage));
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuthService.sendPasswordResetEmail(email);
    } on CustomException catch (e) {
      throw ServerFailures(e.message);
    } catch (e) {
      throw ServerFailures(ErrorsMessages.genericErrorMessage);
    }
  }

  @override
  Future addUserData({required UserEntity userEntity}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserCollection,
      data: UserModel.fromEntity(userEntity).toMap(),
      docId: userEntity.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoint.getUserCollection,
      uId: uId,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity userEntity}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(userEntity).toMap());
    await Prefs.setString('userData', jsonData);
  }

  @override
  Future selectUserZone({required String zone}) async {
    try {
      await databaseService.updateData(
        path: BackendEndpoint.getUserCollection,
        uId: getUser().uId,
        value: {
          'zone': zone,
        },
      );
      var userEntity = UserEntity(
        name: getUser().name,
        email: getUser().email,
        phone: getUser().phone,
        uId: getUser().uId,
        zone: zone,
      );
      await saveUserData(userEntity: userEntity);
    } catch (e) {
      throw ServerFailures(e.toString());
    }
  }
}
