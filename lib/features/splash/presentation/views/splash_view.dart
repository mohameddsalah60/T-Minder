import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = 'splash';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SplashViewBody(),
    );
  }
}
