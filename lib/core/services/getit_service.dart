import 'package:get_it/get_it.dart';
import 'package:tmart_expiry_date/core/services/firebase_auth_service.dart';
import 'package:tmart_expiry_date/core/services/firestore_service.dart';
import 'package:tmart_expiry_date/core/services/scan_barcode_service.dart';
import 'package:tmart_expiry_date/features/auth/data/repos/auth_repo_impl.dart';
import 'package:tmart_expiry_date/features/auth/domin/repos/auth_repo.dart';
import 'package:tmart_expiry_date/features/my_products/data/repos/my_product_repo_impl.dart';
import 'package:tmart_expiry_date/features/my_products/domin/repos/my_product_repo.dart';

final getIt = GetIt.instance;

void setupGetItService() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<FirestoreService>(FirestoreService());
  getIt.registerSingleton<ScanBarcodeService>(ScanBarcodeService());
  getIt.registerSingleton<MyProductRepo>(MyProductRepoImpl(
    getIt<ScanBarcodeService>(),
  ));
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    firebaseAuthService: getIt<FirebaseAuthService>(),
    databaseService: getIt<FirestoreService>(),
  ));
}
