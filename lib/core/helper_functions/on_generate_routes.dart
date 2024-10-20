import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/signin_view.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/signup_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
