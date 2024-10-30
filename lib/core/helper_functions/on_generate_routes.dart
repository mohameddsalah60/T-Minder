import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/forget_password_view.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/select_zone_view.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/signin_view.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/signup_view.dart';
import 'package:tmart_expiry_date/features/home/presentation/views/home_view.dart';
import 'package:tmart_expiry_date/features/my_products/presentation/views/add_products_view.dart';

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
    case MyProductsView.routeName:
      return MaterialPageRoute(builder: (context) => const MyProductsView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
