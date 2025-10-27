import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  Future<User?> signinUserWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return (await FirebaseAuth.instance.signInWithCredential(credential))
          .user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signinUserWithGoogle e code: ${e.code}");
      if (e.code.contains('Null')) {
        throw CustomException(message: ErrorsMessages.cancellationMessage);
      }
      throw CustomException(
          message: ErrorsMessages.getFirebaseErrorMessage(e.code));
    } catch (e) {
      log("Exception in FirebaseAuthService.signinUserWithGoogle: ${e.toString()}");

      throw CustomException(message: ErrorsMessages.genericErrorMessage);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuthInstance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      log(
        "Exception in FirebaseAuthService.sendPasswordResetEmail: ${e.toString()} and code is ${e.code}",
      );
      throw CustomException(
        message: ErrorsMessages.getFirebaseErrorMessage(e.code),
      );
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.sendPasswordResetEmail: ${e.toString()}",
      );

      throw CustomException(message: ErrorsMessages.genericErrorMessage);
    }
  }

  Future deleteUser() async {
    await firebaseAuthInstance.currentUser!.delete();
  }

  bool isLoggedIn() {
    return firebaseAuthInstance.currentUser != null;
  }

  Future signOut() async {
    await firebaseAuthInstance.signOut();
  }
}
