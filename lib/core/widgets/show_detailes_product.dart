import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/entites/products_entity.dart';
import 'package:tmart_expiry_date/core/products_cubit/products_cubit.dart';
import 'package:tmart_expiry_date/core/repos/products_repo.dart';
import 'package:tmart_expiry_date/core/services/getit_service.dart';
import 'package:tmart_expiry_date/core/widgets/custom_dialog_alert.dart';
import 'package:tmart_expiry_date/core/widgets/custom_show_snack_bar.dart';

import '../delete_products_cubit/delete_products_cubit.dart';
import 'product_detailes_view_body.dart';

void productDetailesView(BuildContext context, ProductsEntity product) {
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    enableDrag: true,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => DeleteProductsCubit(getIt<ProductsRepo>()),
        child: ProductDetailesViewBlocConsumer(
          product: product,
        ),
      );
    },
  ).whenComplete(() {
    FocusManager.instance.primaryFocus
        ?.unfocus(); // إغلاق لوحة المفاتيح عند إغلاق الـ Bottom Sheet
  });
}

class ProductDetailesViewBlocConsumer extends StatelessWidget {
  const ProductDetailesViewBlocConsumer({
    super.key,
    required this.product,
  });
  final ProductsEntity product;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteProductsCubit, DeleteProductsState>(
      listener: (context, state) {
        if (state is DeleteProductFailure) {
          customDialogAlert(context: context, text: state.message);
        } else {
          Navigator.pop(context);
          if (context.mounted) {
            FocusScope.of(context).unfocus();
          }

          customShowSnackBar(
            context,
            text: 'تم حذف المنتج بنجاح',
            color: Colors.green,
          );
          context.read<ProductsCubit>().getProducts();
        }
      },
      builder: (context, state) => ProductDetailesViewBody(
        product: product,
      ),
    );
  }
}
