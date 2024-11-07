import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/products_cubit/products_cubit.dart';
import 'package:tmart_expiry_date/core/widgets/custom_app_bar.dart';

import '../../../../core/repos/products_repo.dart';
import '../../../../core/services/getit_service.dart';
import 'widgets/my_products_view_body.dart';

class MyProductsView extends StatelessWidget {
  const MyProductsView({super.key});
  static const routeName = 'my-products';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'اضافاتي السابقة',
        onTap: Navigator.of(context).pop,
      ),
      body: BlocProvider(
        create: (context) => ProductsCubit(getIt<ProductsRepo>()),
        child: const SafeArea(child: MyProductsViewBody()),
      ),
    );
  }
}
