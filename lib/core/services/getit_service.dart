import 'package:get_it/get_it.dart';
import 'package:tmart_expiry_date/core/repos/notifications_repo.dart';
import 'package:tmart_expiry_date/features/profile/data/repos/profile_repo_impl.dart';
import 'package:tmart_expiry_date/features/profile/domin/repos/profile_repo.dart';

import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/domin/repos/auth_repo.dart';
import '../../features/add_products/data/repos/add_products_repo_impl.dart';
import '../../features/add_products/domin/repos/add_products_repo.dart';
import '../repos/notifications_repo_impl.dart';
import '../repos/products_repo.dart';
import '../repos/products_repo_impl.dart';
import 'firebase_auth_service.dart';
import 'firestore_service.dart';
import 'notifications_service.dart';
import 'scan_barcode_service.dart';

final getIt = GetIt.instance;

void setupGetItService() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<FirestoreService>(FirestoreService());

  getIt.registerSingleton<ScanBarcodeService>(ScanBarcodeService());
  getIt.registerSingleton<AddProductsRepo>(AddProductsRepoImpl(
    getIt<ScanBarcodeService>(),
    getIt<FirestoreService>(),
  ));
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(
    databaseService: getIt<FirestoreService>(),
  ));
  getIt.registerSingleton<NotificationsService>(NotificationsService());

  getIt.registerSingleton<NotificationsRepo>(NotificationsRepoImpl(
    databaseService: getIt<FirestoreService>(),
    notificationsService: getIt<NotificationsService>(),
  ));
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    firebaseAuthService: getIt<FirebaseAuthService>(),
    databaseService: getIt<FirestoreService>(),
  ));
  getIt.registerSingleton<ProfileRepo>(ProfileRepoImpl(
    firebaseAuthService: getIt<FirebaseAuthService>(),
    databaseService: getIt<FirestoreService>(),
  ));
}
