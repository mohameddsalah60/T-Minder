import 'package:tmart_expiry_date/core/helper_functions/get_user.dart';
import 'package:tmart_expiry_date/core/services/firebase_auth_service.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/select_zone_view.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/signin_view.dart';
import 'package:tmart_expiry_date/features/home/presentation/views/main_view.dart';

String excuteNaviagtion() {
  var isLoggedIn = FirebaseAuthService().isLoggedIn();
  if (isLoggedIn) {
    if (getUser().zone != '') {
      return MainView.routeName;
    } else {
      return SelectZoneView.routeName;
    }
  } else {
    return SigninView.routeName;
  }
}
