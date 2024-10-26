import 'package:flutter/material.dart';

import 'add_product_widget.dart';
import 'my_products_widget.dart';

class MyProductsViewBody extends StatelessWidget {
  const MyProductsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 48,
          ),
          GestureDetector(
            onTap: () {},
            child: const AddProductWidget(),
          ),
          const SizedBox(
            height: 48,
          ),
          const MyProductsWidget(),
        ],
      ),
    );
  }
}
