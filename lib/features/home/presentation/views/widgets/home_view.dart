import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/products_cubit/products_cubit.dart';
import 'package:tmart_expiry_date/core/repos/products_repo.dart';
import 'package:tmart_expiry_date/core/services/getit_service.dart';

import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt<ProductsRepo>())..getProducts(),
      child: const HomeViewBody(),
    );
  }
}
