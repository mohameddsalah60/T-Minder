import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/services/getit_service.dart';

import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';
import 'package:tmart_expiry_date/core/widgets/custom_dialog_alert.dart';
import 'package:tmart_expiry_date/features/home/presentation/views/widgets/notifications_widget.dart';
import 'package:tmart_expiry_date/features/my_products/domin/repos/my_product_repo.dart';
import 'package:tmart_expiry_date/features/my_products/presentation/my_products_cubit/my_products_cubit.dart';

import 'widgets/add_product_bottom_sheet.dart';
import 'widgets/my_products_view_body.dart';

class MyProductsView extends StatelessWidget {
  const MyProductsView({super.key});
  static const routeName = 'my-products';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'منتجاتي',
            style: TextStyles.bold16,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: NotificationWidget(),
            ),
          ],
        ),
        body: BlocProvider(
          create: (context) => MyProductsCubit(getIt<MyProductRepo>()),
          child: BlocListener<MyProductsCubit, MyProductsState>(
            listener: (context, state) {
              if (state is MyProductsGetBarcodeSuccsess) {
                addProductsBottomSheet(context, barcode: state.barcode);
              } else if (state is MyProductsGetBarcodeFailure) {
                customDialogAlert(
                  context: context,
                  text: state.message,
                  type: 'error',
                );
              }
            },
            child: const MyProductsViewBody(),
          ),
        ),
      ),
    );
  }
}
