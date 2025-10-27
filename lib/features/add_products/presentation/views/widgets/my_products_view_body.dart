import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/helper_functions/get_user.dart';
import 'package:tmart_expiry_date/core/products_cubit/products_cubit.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/widgets/custom_search_textfield.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/product_item_sliver_list.dart';

class MyProductsViewBody extends StatefulWidget {
  const MyProductsViewBody({super.key});

  @override
  State<MyProductsViewBody> createState() => _MyProductsViewBodyState();
}

class _MyProductsViewBodyState extends State<MyProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProductsByFilter(
          filter: 'uId',
          filterValue: getUser().uId,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * .17,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'ابحث عن اي منتج قمت باضافتة من خلال الباركود',
                      style: TextStyles.regular13.copyWith(
                        color: Colors.white,
                      ),
                    ),
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
                          context.read<ProductsCubit>().getProductsByFilter(
                                filter: 'uId',
                                filterValue: getUser().uId,
                              );
                        }
                      },
                    ),
                    const Expanded(
                      child: SizedBox(
                        height: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const ProductItemSliverList(),
      ],
    );
  }
}
