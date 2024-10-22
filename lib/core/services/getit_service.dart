import 'package:get_it/get_it.dart';
import 'package:tmart_expiry_date/core/services/firebase_auth_service.dart';
import 'package:tmart_expiry_date/core/services/firestore_service.dart';
import 'package:tmart_expiry_date/features/auth/data/repos/auth_repo_impl.dart';
import 'package:tmart_expiry_date/features/auth/domin/repos/auth_repo.dart';

final getIt = GetIt.instance;

void setupGetItService() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<FirestoreService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    firebaseAuthService: getIt<FirebaseAuthService>(),
    databaseService: getIt<FirestoreService>(),
  ));
}
