import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/widgets/custom_app_bar.dart';
import 'package:tmart_expiry_date/features/add_products/presentation/add_products_cubit/add_products_cubit.dart';

import '../../../../core/services/getit_service.dart';
import '../../../home/presentation/views/widgets/notifications_button_widget.dart';
import '../../domin/repos/add_products_repo.dart';

import 'widgets/add_products_bloc_consumer.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({super.key});
  static const routeName = 'add-products';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'اضافة منتج جديد', actions: [
        const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: NotificationWidget(),
        ),
      ]),
      body: BlocProvider(
        create: (context) => AddProductsCubit(getIt<AddProductsRepo>()),
        child: const SafeArea(child: AddProductsBlocConsumer()),
      ),
    );
  }
}
