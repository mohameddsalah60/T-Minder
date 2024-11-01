import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/widgets/custom_search_textfield.dart';

import '../../../../../core/products_cubit/products_cubit.dart';
import 'custom_home_appbar.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const CustomHomeAppbar(),
          const SizedBox(
            height: 16,
          ),
          CustomSearchTextfield(
            onChanged: (value) {
              if (value.isNotEmpty) {
                context.read<ProductsCubit>().getProductsByFilter(
                      filterValue: value,
                      filter: 'barcode',
                    );
              } else {
                context.read<ProductsCubit>().getProducts();
              }
            },
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
