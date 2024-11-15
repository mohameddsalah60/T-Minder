import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/forget_password_view.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/select_zone_view.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/signin_view.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/signup_view.dart';
import 'package:tmart_expiry_date/features/home/presentation/views/main_view.dart';
import 'package:tmart_expiry_date/features/add_products/presentation/views/add_products_view.dart';

import '../../features/add_products/presentation/views/my_products_view.dart';
import '../../features/notifications/presentation/views/notification_view.dart';
import '../../features/profile/presentation/views/about_us.dart';
import '../../features/profile/presentation/views/profile_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(
          builder: (context) => const ForgetPasswordView());
    case SelectZoneView.routeName:
      return MaterialPageRoute(builder: (context) => const SelectZoneView());
    case AddProductsView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductsView());
    case MyProductsView.routeName:
      return MaterialPageRoute(builder: (context) => const MyProductsView());
    case NotificationView.routeName:
      return MaterialPageRoute(builder: (context) => const NotificationView());
    case ProfileView.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileView());
    case AboutUs.routeName:
      return MaterialPageRoute(builder: (context) => const AboutUs());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
