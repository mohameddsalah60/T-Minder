import 'package:flutter/material.dart';

import 'custom_product_item.dart';

class ProductItemSliverList extends StatelessWidget {
  const ProductItemSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: CustomProductItem(),
        );
      },
    );
  }
}
