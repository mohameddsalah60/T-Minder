import 'package:tmart_expiry_date/core/services/firebase_auth_service.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/signin_view.dart';
import 'package:tmart_expiry_date/features/home/presentation/views/home_view.dart';

String excuteNaviagtion() {
  var isLoggedIn = FirebaseAuthService().isLoggedIn();
  if (isLoggedIn) {
    return HomeView.routeName;
  } else {
    return SigninView.routeName;
  }
}
