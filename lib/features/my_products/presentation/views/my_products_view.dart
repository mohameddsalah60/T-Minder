import 'package:flutter/material.dart';

import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';
import 'package:tmart_expiry_date/features/home/presentation/views/widgets/notifications_widget.dart';

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
            NotificationWidget(),
          ],
        ),
        body: const MyProductsViewBody(),
      ),
    );
  }
}
