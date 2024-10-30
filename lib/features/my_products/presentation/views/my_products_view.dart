import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/widgets/custom_app_bar.dart';
import 'package:tmart_expiry_date/features/my_products/presentation/add_products_cubit/add_products_cubit.dart';

import '../../../../core/services/getit_service.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_show_snack_bar.dart';
import '../../../home/presentation/views/widgets/notifications_widget.dart';
import '../../domin/repos/my_product_repo.dart';
import '../my_products_cubit/my_products_cubit.dart';
import 'widgets/add_product_bottom_sheet.dart';
import 'widgets/add_product_bottom_sheet_body.dart';
import 'widgets/add_products_bloc_consumer.dart';
import 'widgets/my_products_view_body.dart';

class MyProductsView extends StatelessWidget {
  const MyProductsView({super.key});
  static const routeName = 'my-products';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context, title: 'اضافة منتج جديد', actions: [
          const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: NotificationWidget(),
          ),
        ]),
        body: BlocProvider(
          create: (context) => AddProductsCubit(getIt<MyProductRepo>()),
          child: const AddProductsBlocConsumer(),
        ),
      ),
    );
  }
}
