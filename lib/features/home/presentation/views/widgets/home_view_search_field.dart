import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/products_cubit/products_cubit.dart';
import '../../../../../core/widgets/custom_search_textfield.dart';

class HomeViewSearchField extends StatelessWidget {
  const HomeViewSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSearchTextfield(
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
    );
  }
}
