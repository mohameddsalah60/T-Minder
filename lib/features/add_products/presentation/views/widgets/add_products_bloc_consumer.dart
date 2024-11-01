import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/widgets/custom_loading_indector.dart';

import '../../../../../core/widgets/custom_dialog_alert.dart';
import '../../../../../core/widgets/custom_show_snack_bar.dart';
import '../../add_products_cubit/add_products_cubit.dart';
import 'add_products_view_body.dart';

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
        return CustomLoadingIndector(
          isLoading: state is AddProductsLoading ? true : false,
          child: const AddProductsViewBody(),
        );
      },
    );
  }
}
