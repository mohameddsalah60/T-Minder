import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';

import 'widgets/home_view_section/custom_app_bar.dart';
import 'widgets/home_view_section/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.r),
          child: const CustomAppBar(),
        ),
      ),
      body: const HomeViewBody(),
    );
  }
}
