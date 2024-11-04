import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/entites/products_entity.dart';
import 'package:tmart_expiry_date/core/products_cubit/products_cubit.dart';
import 'package:tmart_expiry_date/core/widgets/custom_dialog_alert.dart';
import 'package:tmart_expiry_date/core/widgets/custom_show_snack_bar.dart';

import 'product_detailes_view_body.dart';

void productDetailesView(BuildContext context, ProductsEntity product) {
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    enableDrag: true,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return BlocListener<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is DeleteProductFailure) {
            customDialogAlert(context: context, text: state.message);
          } else {
            Navigator.pop(context);
            FocusScope.of(context).unfocus();

            customShowSnackBar(
              context,
              text: 'تم حذف المنتج بنجاح',
              color: Colors.green,
            );
          }
        },
        child: ProductDetailesViewBody(
          product: product,
        ),
      );
    },
  ).whenComplete(() {
    FocusManager.instance.primaryFocus
        ?.unfocus(); // إغلاق لوحة المفاتيح عند إغلاق الـ Bottom Sheet
  });
}
