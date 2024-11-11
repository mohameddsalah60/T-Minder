import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:tmart_expiry_date/features/add_products/presentation/views/add_products_view.dart';
import '../../../../core/products_cubit/products_cubit.dart';
import '../../../profile/presentation/views/profile_view.dart';
import 'widgets/home_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = 'homeView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (_currentIndex == 0) {
      context.read<ProductsCubit>().getProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTapped,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeViewBody(),
          AddProductsView(),
          ProfileView(),
        ],
      ),
    );
  }
}
