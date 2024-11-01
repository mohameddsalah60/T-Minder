import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../products_cubit/products_cubit.dart';
import '../utils/app_colors.dart';
import 'custom_no_found_data_widget.dart';
import 'custom_product_item.dart';

class ProductItemSliverList extends StatelessWidget {
  const ProductItemSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccses) {
          return SliverList.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: CustomProductItem(
                  productsEntity: state.products[index],
                ),
              );
            },
          );
        } else if (state is NoFoundProductsState) {
          return const SliverToBoxAdapter(
            child: CustomNoFoundDataWidget(),
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(child: Text(state.message));
        } else {
          return SliverToBoxAdapter(
            child: Center(
                child: state is ProductsLoading
                    ? const CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : const SizedBox()),
          );
        }
      },
    );
  }
}
