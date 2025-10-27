import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tmart_expiry_date/core/errors/custom_exception.dart';
import 'package:tmart_expiry_date/core/errors/errors_messages.dart';

import 'package:tmart_expiry_date/core/errors/failures.dart';
import 'package:tmart_expiry_date/core/helper_functions/get_user.dart';
import 'package:tmart_expiry_date/core/services/database_service.dart';
import 'package:tmart_expiry_date/core/services/shared_preferences_singletone.dart';
import 'package:tmart_expiry_date/core/utils/backend_endpoint.dart';

import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/services/workmanager_service.dart';
import '../../domin/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final DatabaseService databaseService;
  final FirebaseAuthService firebaseAuthService;

  ProfileRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});

  @override
  Future<Either<Failure, void>> deleteAccount() async {
    try {
      await databaseService.deleteData(
        path: BackendEndpoint.getUserCollection,
        uId: getUser().uId,
      );
      await firebaseAuthService.deleteUser();

      WorkmanagerService.cancelAll();
      await Prefs.clearAllData();
      return right(null);
    } on CustomException catch (e) {
      return left(ServerFailures(e.message));
    } catch (e) {
      log(e.toString());
      return left(ServerFailures(ErrorsMessages.genericErrorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> logoutAccount() async {
    try {
      await firebaseAuthService.signOut();
      return right(null);
    } on CustomException catch (e) {
      return left(ServerFailures(e.message));
    } catch (e) {
      log(e.toString());
      return left(ServerFailures(ErrorsMessages.genericErrorMessage));
    }
  }
}
