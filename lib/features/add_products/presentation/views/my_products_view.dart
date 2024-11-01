import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/widgets/custom_app_bar.dart';

import 'widgets/my_products_view_body.dart';

class MyProductsView extends StatelessWidget {
  const MyProductsView({super.key});
  static const routeName = 'my-products';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'اضافاتي السابقة',
          onTap: Navigator.of(context).pop,
        ),
        body: const MyProductsViewBody(),
      ),
    );
  }
}
