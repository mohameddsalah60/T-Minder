import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'homeView';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      bottomNavigationBar: CustombottomNavigationBar(),
      body: HomeViewBody(),
    ));
  }
}
