import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/features/home/presentation/views/home_view.dart';
import 'package:tmart_expiry_date/features/home/presentation/views/product_info_view.dart';
import 'package:tmart_expiry_date/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case ProductInfoView.routeName:
      return MaterialPageRoute(builder: (context) => const ProductInfoView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
