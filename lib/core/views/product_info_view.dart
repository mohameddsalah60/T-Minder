import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/widgets/custom_app_bar.dart';

class ProductInfoView extends StatelessWidget {
  const ProductInfoView({super.key});
  static const routeName = 'product-info';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'معلومات اضافية',
          onTap: () => Navigator.of(context).pop,
        ),
      ),
    );
  }
}
