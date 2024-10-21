import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:tmart_expiry_date/core/errors/custom_exception.dart';
import 'package:tmart_expiry_date/core/errors/errors_messages.dart';

class FirebaseAuthService {
  final firebaseAuthInstance = FirebaseAuth.instance;
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var credential =
          await firebaseAuthInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}",
      );
      throw CustomException(
        message: ErrorsMessages.getFirebaseErrorMessage(e.code),
      );
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}",
      );

      throw CustomException(message: ErrorsMessages.genericErrorMessage);
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var credential = await firebaseAuthInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}",
      );
      throw CustomException(
        message: ErrorsMessages.getFirebaseErrorMessage(e.code),
      );
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}",
      );

      throw CustomException(message: ErrorsMessages.genericErrorMessage);
    }
  }
}
