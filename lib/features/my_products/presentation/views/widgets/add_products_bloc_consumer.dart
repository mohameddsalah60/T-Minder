import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_dialog_alert.dart';
import '../../../../../core/widgets/custom_show_snack_bar.dart';
import '../../add_products_cubit/add_products_cubit.dart';
import 'add_product_bottom_sheet_body.dart';

class AddProductsBlocConsumer extends StatelessWidget {
  const AddProductsBlocConsumer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductsCubit, AddProductsState>(
      listener: (context, state) {
        if (state is AddProductsFailure) {
          customDialogAlert(
            context: context,
            text: state.message,
          );
          log(state.message);
        } else if (state is AddProductsSuccses) {
          customShowSnackBar(
            context,
            text: "تم اضافة المنتج بنجاح",
            color: Colors.green,
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: const AddProductsBottomSheetBody(),
          ),
        );
      },
    );
  }
}
