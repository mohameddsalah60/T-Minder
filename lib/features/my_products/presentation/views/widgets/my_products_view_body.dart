import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/features/my_products/presentation/my_products_cubit/my_products_cubit.dart';

import 'scan_product_button.dart';
import 'my_products_widget.dart';

class MyProductsViewBody extends StatelessWidget {
  const MyProductsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 48,
          ),
          GestureDetector(
            onTap: () async {
              context.read<MyProductsCubit>().getBarcode();
            },
            child: const ScanProductButton(),
          ),
          const SizedBox(
            height: 48,
          ),
          const MyProductsWidget(),
        ],
      ),
    );
  }
}
