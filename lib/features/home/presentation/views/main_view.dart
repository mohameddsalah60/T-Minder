import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:tmart_expiry_date/features/add_products/presentation/views/add_products_view.dart';
import '../../../../core/products_cubit/products_cubit.dart';
import '../../../../core/repo/products_repo.dart';
import '../../../../core/services/getit_service.dart';
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
      _productsCubit
          .getProducts(); // استدعاء getProducts عند العودة إلى HomeView
    }
  }

  late ProductsCubit _productsCubit;

  @override
  void initState() {
    super.initState();
    _productsCubit = ProductsCubit(getIt<ProductsRepo>())..getProducts();
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
          children: [
            BlocProvider.value(
              value: _productsCubit,
              child: const HomeViewBody(),
            ),
            const AddProductsView(),
          ],
        ),
      ),
    );
  }
}
