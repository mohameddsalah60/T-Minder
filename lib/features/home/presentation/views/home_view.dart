import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:tmart_expiry_date/features/my_products/presentation/views/my_products_view.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const routeName = 'homeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onBottomNavTapped,
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            HomeViewBody(),
            MyProductsView(),
          ],
        ),
      ),
    );
  }
}
