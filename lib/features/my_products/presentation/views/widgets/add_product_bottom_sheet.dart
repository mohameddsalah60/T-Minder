import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/getit_service.dart';
import '../../../domin/repos/my_product_repo.dart';
import '../../add_products_cubit/add_products_cubit.dart';
import 'add_products_bloc_consumer.dart';

Future<dynamic> addProductsBottomSheet(BuildContext context,
    {required String barcode}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    builder: (context) {
      return BlocProvider(
        create: (context) => AddProductsCubit(getIt<MyProductRepo>()),
        child: const AddProductsBlocConsumer(),
      );
    },
  );
}
